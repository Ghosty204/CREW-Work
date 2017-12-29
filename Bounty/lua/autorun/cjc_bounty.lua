// Simple Bounty system for people who do naughty things

if SERVER then
	util.AddNetworkString("Bounty_Gained")
	util.AddNetworkString("Bounty_Lost")
	util.AddNetworkString("Bounty_Claimed")
	local meta = FindMetaTable( 'player' )
	
	function meta:GetBounty()
		return self:GetNWInt("Bounty")
	end
	
	function meta:HasBounty()
		return self:GetNWBool("ActiveBounty")
	end
	
	function meta:SetBounty( amt )
		self:SetNWBool("ActiveBounty", true)
		self:SetNWInt("Bounty", amt + (self:GetBounty() or 0))
		self.BountyResets = CurTime() + (900 + amt/20)
		net.Start("Bounty_Gained")
			net.WriteEntity(self)
			net.WriteString(tostring(amt))
		net.Broadcast()
	end
	
	function meta:ResetBounty(claimed)
		self:SetNWBool("ActiveBounty", false)
		self:SetNWInt("Bounty", nil)
		self.BountyResets = nil
		if !claimed then
			net.Start("Bounty_Lost")
				net.WriteEntity(self)
			net.Broadcast()
		end
	end
	
	BountySystem = BountySystem or {}
	
	function BountySystem.Spawn( ply )
		if !ply:IsValid() then return end
		ply:ResetBounty()
	end
	
	function BountySystem.Think()
		for k,ply in pairs(player.GetAll()) do
			if ply.BountyResets && ply.BountyResets <= CurTime() then
				ply.BountyResets = nil
				ply:ResetBounty()
			end
		end
	end
	hook.Add("Think", "BountySystemThink", BountySystem.Think)
	
	function BountySystem.ClaimBounty( bountykeeper, bountyhunter )
		local amt
		if bountyhunter:Team() == TEAM_BOUNTY then
			amt = bountykeeper:GetBounty()
		else
			amt = math.Round(bountykeeper:GetBounty()*0.4)
		end
		bountyhunter:addMoney(amt)
		net.Start("Bounty_Claimed")
			net.WriteEntity(bountyhunter)
			net.WriteEntity(bountykeeper)
			net.WriteString(tostring(amt))
		net.Broadcast()
		
		bountykeeper:ResetBounty(true)
	end
	
	function BountySystem.Killed( ply, inflictor, attacker )
		if !(ply:IsValid() && attacker:IsValid()) then return end
		if !attacker:IsPlayer() then return end
		if !ply:HasBounty() then return end
		
		BountySystem.ClaimBounty( ply, attacker )
	end
	hook.Add("PlayerDeath", "BountySystemKill", BountySystem.Killed)
end

if CLIENT then
	net.Receive("Bounty_Claimed", function()
		local ply1 = net.ReadEntity()
		local ply2 = net.ReadEntity()
		chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply1:Nick().." claimed the bounty of "..ply2:Nick().." worth of "..net.ReadString().."CJ$." )
	end)
	
	net.Receive("Bounty_Gained", function()
		local ply = net.ReadEntity()
		chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply:Nick().." gained a bounty of "..net.ReadString().."CJ$.")
	end)
	
	net.Receive("Bounty_Lost", function()
		local ply = net.ReadEntity()
		chat.AddText(Color(255,255,255), "[", Color(255,0,0), "ALERT", Color(255,255,255), "] "..ply:Nick().." lost his bounty.")
	end)
end