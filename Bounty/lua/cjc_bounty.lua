// Simple Bounty system for people who do naughty things

if SERVER then
	util.AddNetworkString("Bounty_Gained")
	util.AddNetworkString("Bounty_Collected")
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
	end
	
	function meta:ResetBounty()
		self:SetNWBool("ActiveBounty", false)
		self:SetNWInt("Bounty", nil)
		self.BountyResets = nil
	end
	
	BountySystem = BountySystem or {}
	
	function BountySystem.Spawn( ply )
		if !ply:IsValid() then return end
		ply:ResetBounty()
	end
	
	function BountySystem.ClaimBounty( bountykeeper, bountyhunter )
	
		
		bountykeeper:ResetBounty()
		if bountyhunter:Team() == TEAM_BOUNTY then
			
		else
			
		end
	end
	
	function BountySystem.Killed( ply, inflictor, attacker )
		if !(ply:IsValid() && attacker:IsValid()) then return end
		if !attacker:IsPlayer() then return end
		if !ply:HasBounty() then return end
		
		if attacker:Team() == TEAM_BOUNTY then
			
		else
		
		end
	end
	hook.Add("PlayerDeath", "BountySystemKill", BountySystem.Killed)
end

if CLIENT then

end