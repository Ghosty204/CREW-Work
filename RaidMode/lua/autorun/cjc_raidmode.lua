// Cleaner, optimized version of my raid mode.
if SERVER then
	util.AddNetworkString("RaidMode_Start")
	util.AddNetworkString("RaidMode_Fail")
	util.AddNetworkString("RaidMode_Stop")
	
	local meta = FindMetaTable( 'player' )
	function meta:IsRaidJob()
		return self:getJobTable().Raid
	end
	
	function meta:IsRaiding()
		return self:GetNWBool("Raiding")
	end
	
	RaidMode = RaidMode or {}
	
	function RaidMode.Think()
		for k,ply in pairs(player.GetAll()) do
			if not (ply.NextRaid == nil) && CurTime() >= ply.NextRaid then
				ply.NextRaid = nil
				ply.CanRaid = true
			end

			if not (ply.RaidTime == nil) && CurTime() >= ply.RaidTime then
				RaidMode.StopRaid( ply, true, "Stop" )
			end
		end
	end
	hook.Add("Think", "RaidModeThink", RaidMode.Think)
	
	function RaidMode.Spawn( ply )
		ply:SetNWBool("Raiding", false)
		if ply.NextRaid == nil then
			ply.CanRaid = true
		end
	end
	hook.Add("PlayerSpawn", "RaidModeSpawn", RaidMode.Spawn)
	
	function RaidMode.StartRaid( ply ) 
		ply:SetNWBool("Raiding", true)
		ply.RaidTime = CurTime() + 1200
		ply:wanted(nil, "Raiding", 1500)
	end
	
	// Stopreasons: Died, Disconnected, Stop, ChangedTeam
	function RaidMode.StopRaid( ply, keepWanted, stopReason )
		if self:GetNWBool("Raiding") then
			ply:SetNWBool("Raiding", false)
			ply.NextRaid = CurTime() + 300
			ply.CanRaid = false
			ply.RaidTime = nil
			if keepWanted then
				ply:wanted(nil, "Raiding", 300)
			else
				ply:unWanted()
			end
			net.Start("RaidMode_Stop")
				net.WriteString(stopReason)
				net.WriteEntity(ply)
			net.Broadcast()
		end
	end
	
	function RaidMode.StartRaid( ply, party )
		local party = party or "Alone"
		ply:SetNWBool("Raiding", true)
		ply.RaidTime = CurTime() + 1200
		ply:wanted(nil, "Raiding", 1500)
		
		if party == "Alone" then
			net.Start("RaidMode_Start")
				net.WriteString(party)
				net.WriteEntity(ply)
			net.Broadcast()
		end
	end
	
	function RaidMode.StartPartyRaid( ply )
		local RaidTeamNicks = {}
		local RaidModeGrammar = {}
		for k,tgt in pairs(ply:GetCurrentParty().Players) do
			if not RaidMode.IsRaidJob(tgt) then return end

			table.insert(RaidTeamNicks, tgt:Nick())

			RaidMode.StartRaid(tgt, "Party")
		end
		
		// Don't judge me on this, I was stoned
		for k,nick in pairs(RaidTeamNicks) do
			if nick == table.GetLastValue(RaidTeamNicks) then
				table.insert(RaidModeGrammar, "and "..nick)
			elseif nick == table.GetFirstValue(RaidTeamNicks) then
				table.insert(RaidModeGrammar, nick)
			else
				table.insert(RaidModeGrammar, ", "..nick)
			end
		end

		net.Start("RaidMode_Start")
			net.WriteString("Party")
			net.WriteEntity(ply)
			net.WriteTable(RaidModeGrammar)
		net.Broadcast()
	end
	
	function RaidMode.Death( ply )
		if ply:IsRaiding() then
			RaidMode.StopRaid( ply, false, "Died" )
		end
	end
	hook.Add("PlayerDeath", "RaidModeDeath", RaidMode.Death)
	
	function RaidMode.ChangedTeam( ply )
		if ply:IsRaiding() then
			RaidMode.StopRaid(ply, false, "ChangedTeam")
		end
	end
	hook.Add("OnPlayerChangedTeam", "RaidModePlayerChange", RaidMode.ChangedTeam)
	
	function RaidMode.Disconnected( ply )
		if ply:IsRaiding() then
			RaidMode.StopRaid(ply, false, "Disconnected")
		end
	end
	hook.Add("PlayerDisconnect", "RaidModePlayerDisconnect", RaidMode.Disconnected)
	
	function RaidMode.FailRaid(ply, reason)
		net.Start("RaidMode_Fail")
			net.WriteString(reason)
			if reason == "NoRaid"
				net.WriteString(tostring(math.Round(ply.NextRaid - CurTime())))
			end
		net.Send(ply)
	end
	
	// Consolecommands: raid start/stop
	//					raid start party/alone
	function RaidMode.ConsoleCommand( ply, cmd, args )
		if !ply:IsValid() then return end
		for k,v in pairs(args) do
			args[k] = string.lower(v)
		end
		if args[0] == "start" then
			if ply:IsRaiding() then return end
			if !ply:IsRaidJob() then return end
			if !ply.CanRaid then RaidMode.FailRaid(ply, "NoRaid") return end
			
			if args[1] == "party" then
				if !ply:HasParty() then RaidMode.FailRaid(ply, "NoParty") return end
				if !ply:IsPartyMaster() then RaidMode.FailRaid(ply, "NotMaster") return end
				RaidMode.StartPartyRaid( ply )
			end
		elseif args[0] == "stop" then
			if !ply:IsRaiding() then return end
			RaidMode.StopRaid( ply, true, "Stop" )
		end
	end
	concommand.Add("raid", RaidMode.ConsoleCommand)
	
	function RaidMode.ChatCommand( ply, text, teamchat )
		if teamchat then return "" end
		local text = string.lower(text)
		
		if !string.StartWith(text, "/raid") then return "" end
		
		ply:ConCommand("raid".. string.sub(text, 6))
		return ""
	end
	hook.Add("PlayerSay", "RaidModeChat", RaidMode.ChatCommand)
end

if CLIENT then
	net.Receive("RaidMode_Start", function()
		local type = net.ReadString()
		if type == "Party" then
			local host = net.ReadEntity()
			local partynicks = net.ReadTable()

			chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..string.Implode(" ", partynicks).." started raiding!")
		elseif type == "Alone" then
			local ply = net.ReadEntity()
			chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply:Nick().." started raiding!")
		end
	end)

	net.Receive("RaidMode_Fail", function()
		local type = net.ReadString()
		if type == "NotMaster" then
			notification.AddLegacy( "You're not the party master!", NOTIFY_ERROR, 6 )
		elseif type == "NoParty" then
			notification.AddLegacy( "You're not in a party!", NOTIFY_ERROR, 6 )
		elseif type == "NoRaid" then
			local number = net.ReadString()
			notification.AddLegacy( "You need to wait "..number.." seconds in order to raid again.", NOTIFY_ERROR, 6 )
		end
	end)

	net.Receive("RaidMode_Stop", function()
		local type = net.ReadString()
		local ply = net.ReadEntity()
		local nick = ply:Nick() or "Unknown"
		if type == "Died" then
			notification.AddLegacy( nick.." died during a raid.", NOTIFY_GENERIC, 6 )
			chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply:Nick().." died during a raid.")
		elseif type == "Disconnected" then
			notification.AddLegacy( nick.." disconnected during raiding.", NOTIFY_GENERIC, 6 )
			chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply:Nick().." disconnected during raiding.")
		elseif type == "Stop" then
			notification.AddLegacy( nick.." stopped raiding.", NOTIFY_GENERIC, 6)
			chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply:Nick().." stopped raiding.")
		elseif type == "ChangedTeam" then
			notification.AddLegacy( nick.." changed role during a raid.", NOTIFY_GENERIC, 6 )
			chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply:Nick().." changed role during a raid.")
		end
	end)
end