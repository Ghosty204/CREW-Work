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