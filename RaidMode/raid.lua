if SERVER then
	util.AddNetworkString("RaidMode_Start")
	util.AddNetworkString("RaidMode_Fail")
	util.AddNetworkString("RaidMode_Stop")
	RaidModeFuncs = {}
	function RaidModeFuncs.Think()
		for k,ply in pairs(player.GetAll()) do
			if not (ply.NextRaid == nil) && CurTime() >= ply.NextRaid then
				ply.NextRaid = nil
				ply.CanRaid = true
			end

			if not (ply.RaidTime == nil) && CurTime() >= ply.RaidTime then
				ply.RaidTime = nil
				net.Start("RaidMode_Stop")
					net.WriteString("Stop")
					net.WriteEntity(ply)
				net.Broadcast()
				ply:SetNWBool("Raiding", false)
				ply.NextRaid = CurTime() + 300
				ply.CanRaid = false
				ply:wanted(nil, "Raiding", 300)
			end
		end
	end
	hook.Add("Think", "RaidModeThink", RaidModeFuncs.Think)

	function RaidModeFuncs.Spawn( ply )
		ply:SetNWBool("Raiding", false)
		if ply.NextRaid == nil then
			ply.CanRaid = true
		end
	end
	hook.Add("PlayerSpawn", "RaidModeSpawn", RaidModeFuncs.Spawn)

	function RaidModeFuncs.Death( ply )
		if ply:GetNWBool("Raiding") then
			net.Start("RaidMode_Stop")
				net.WriteString("Died")
				net.WriteEntity(ply)
			net.Broadcast()
			ply:SetNWBool("Raiding", false)
			ply.NextRaid = CurTime() + 300
			ply.CanRaid = false
			ply.RaidTime = nil
			ply:unWanted()
		end
	end
	hook.Add("PlayerDeath", "RaidModeDeath", RaidModeFuncs.Death)

	function RaidModeFuncs.ChangedTeam( ply )
		if ply:GetNWBool("Raiding") then
			net.Start("RaidMode_Stop")
				net.WriteString("ChangedTeam")
				net.WriteEntity(ply)
			net.Broadcast()
			ply:SetNWBool("Raiding", false)
			ply.NextRaid = CurTime() + 300
			ply.CanRaid = false
			ply.RaidTime = nil
		end
	end
	hook.Add("OnPlayerChangedTeam", "RaidModePlayerChange", RaidModeFuncs.ChangedTeam)

	function RaidModeFuncs.Disconnected( ply )
		if ply:GetNWBool("Raiding") then
			net.Start("RaidMode_Stop")
				net.WriteString("Disconnected")
				net.WriteEntity(ply)
			net.Broadcast()
			ply:SetNWBool("Raiding", false)
			ply.NextRaid = CurTime() + 300
			ply.CanRaid = false
			ply.RaidTime = nil
		end
	end
	hook.Add("PlayerDisconnected", "RaidModeDisconnect", RaidModeFuncs.Disconnected)

	function RaidModeFuncs.StartRaid( ply, text, teamchat )
		local text = string.lower(text)
		if string.StartWith(text, "/raid") then
			if teamchat then return end

			if not (table.HasValue(RaidMode.RaidJobs, ply:Team())) then return end

			if not ply:GetNWBool("Raiding") then
				if not (ply.CanRaid == nil) && ply.CanRaid then
					if string.EndsWith(text, " party") then
						if ply:HasParty() then
							if ply:IsPartyMaster() then
								local RaidTeamNicks = {}
								local RaidModeGrammar = {}
								for k,tgt in pairs(ply:GetCurrentParty().Players) do
									if not table.HasValue(RaidMode.RaidJobs, tgt:Team()) then return end

									table.insert(RaidTeamNicks, tgt:Nick())

									tgt:SetNWBool("Raiding", true)
									tgt:wanted(nil, "Raiding", 1500)
									tgt.RaidTime = CurTime() + 1200
								end

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
								return ""
							else
								net.Start("RaidMode_Fail")
									net.WriteString("NotMaster")
								net.Send(ply)
								return ""
							end
						else
							net.Start("RaidMode_Fail")
								net.WriteString("NoParty")
							net.Send(ply)
							return ""
						end
					elseif string.EndsWith(text, " alone") or text == "/raid" then
						ply:SetNWBool("Raiding", true)
						net.Start("RaidMode_Start")
							net.WriteString("Alone")
							net.WriteEntity(ply)
						net.Broadcast()
						ply.RaidTime = CurTime() + 1200
						ply:wanted(nil, "Raiding", 1500)
						return ""
					end
				else
					net.Start("RaidMode_Fail")
						net.WriteString("NoRaid")
						net.WriteString(tostring(math.Round(ply.NextRaid - CurTime())))
					net.Send(ply)
					return ""
				end
			elseif ply:GetNWBool("Raiding") then
				ply:SetNWBool("Raiding", false)
				net.Start("RaidMode_Stop")
					net.WriteString("Stop")
					net.WriteEntity(ply)
				net.Broadcast()
				ply.NextRaid = CurTime() + 300
				ply.CanRaid = false
				ply.RaidTime = nil
				ply:wanted(nil, "Raiding", 300)
				return ""
			end
		end
	end
	hook.Add("PlayerSay", "RaidModeStartRaid", RaidModeFuncs.StartRaid)
end

local meta = FindMetaTable('Player')
function meta:IsRaidJob()
	return table.HasValue(RaidMode.RaidJobs, self:Team())
end

function meta:IsRaiding()
	return self:GetNWBool("Raiding")
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
print("[JENSEN] Raid Mode loaded.")
