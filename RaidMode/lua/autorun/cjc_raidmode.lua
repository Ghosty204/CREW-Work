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
			net.BroadCast()
		end
	end
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