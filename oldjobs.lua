--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------]]
// #NoSimplerr#
local AdminzRanks = {"moderator", "owner", "superadmin", "admin", "headadmin", "Trial-Mod", "mapper"}
local MemberzRanks = {"member", "donator", "donator2", "moderator", "owner", "superadmin", "admin", "headadmin", "Trial-Mod"}
local TrustedzRanks = {"trusted", "member", "moderator", "donator", "donator2", "owner", "superadmin", "admin", "headadmin", "Trial-Mod"}
local VIPzRanks = {"donator", "donator2", "owner", "moderator", "superadmin", "admin", "headadmin", "Trial-Mod"}
local VIP2zRanks = {"donator2", "owner", "moderator", "superadmin", "admin", "headadmin", "Trial-Mod"}

//Normal
TEAM_CITIZEN = DarkRP.createJob("Survivor", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/half-dead/metroll/a1b1.mdl",
		"models/half-dead/metroll/a2b1.mdl",
		"models/half-dead/metroll/a3b1.mdl",
		"models/half-dead/metroll/a5b1.mdl",
		"models/half-dead/metroll/a6b1.mdl",
		"models/half-dead/metroll/f1b1.mdl",
		"models/half-dead/metroll/f2b1.mdl",
		"models/half-dead/metroll/f4b1.mdl",
		"models/half-dead/metroll/f7b1.mdl",
		"models/half-dead/metroll/m2b1.mdl",
		"models/half-dead/metroll/m4b1.mdl",
		"models/half-dead/metroll/m6b1.mdl",
		"models/half-dead/metroll/m7b1.mdl",
		"models/half-dead/metroll/a4b1.mdl"
	},
	description = [[During the events in Black Mesa, Portal Storms have accured all around the globe spreading panic and death. People rushed out from infected towns and small cities for a better life in secured megacities, however not many managed to reach the goal.]],
	weapons = {},
	command = "Survivor",
	max = 0,
	salary = 20,
	category = "Normal",
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = true,
	candemote = false,
	label = "Survivor" -- Optional: the text on the button in the F4 menu
})

TEAM_HOBO = DarkRP.createJob("Homeless", {
	color = Color(80, 45, 0, 255),
	model = {
		"models/player/group02/male_02.mdl",
		"models/player/group02/male_04.mdl",
		"models/player/group02/male_06.mdl",
		"models/player/group02/male_08.mdl"
	},
	description = [[The lowest member of society. All people see you laugh.
		Beg for your food and money, and if people refuse to do so
		spam their face with bugbait!
		Make your own wooden home somewhere in a corner or
		outside someone else's door]],
	weapons = {"weapon_bugbait"},
	command = "hobo",
	max = 2,
	salary = 0,
	admin = 0,
	category = "Normal",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = false
})

TEAM_MEDIC = DarkRP.createJob("Medic", {
	color = Color(47, 79, 79, 255),
	model = "models/player/hostage/hostage_04.mdl",
	description = [[After the apocalypse these became one of the most
		important persons in this civilization.
		You take care of those who are in need of medical attention.]],
	weapons = {"fas2_ifak"},
	command = "medic",
	max = 2,
	salary = 75,
	admin = 0,
	category = "Normal",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true
})

TEAM_FISHER = DarkRP.createJob("Fisher", {
	color = Color(158, 158, 158, 255),
	model = "models/player/odessa.mdl",
	description = [[You fish up resources that got wasted into the water.]],
	weapons = {},
	command = "fisher",
	max = 2,
	salary = 50,
	category = "Normal",
	admin = 0,
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
	Fisher = true
})

TEAM_PGUARD = DarkRP.createJob("Personal Guard", {
	color = Color(27, 209, 48, 120),
	model = "models/player/guard_pack/guard_02.mdl",
	description = [[As a Personal Guard you can be hired to protect people or their shop.
		If they hire you as their personal guard, you NEED to protect them.
		If you don't, that's breaking the rules, good luck!]],
	weapons = {"stunstick", "cw_p99", "weaponchecker"},
	command = "pguard",
	max = 2,
	salary = 50,
	category = "Normal",
	admin = 0,
	vote = true,
	hasLicense = true,
	mayorCanSetSalary = false,
	candemote = true,
	Guard = true
})

TEAM_ENGINEER = DarkRP.createJob("Engineer", {
	color = Color(255, 161, 0, 255),
	model = {"models/player/hostage/hostage_03.mdl"},
	description = [[The Engineer provides defence solutions, such as
	AI turrets which can track raiders and zombies. He can also 
	repair vehicles.  
	
	How to properly use AI turrets:
	Equip a battery to the turret and open it's menu, 
	then select "Authorise" - this will make you an owner of the turret.
	
	To lock/unlock the turret come close to it
	and type the following commands in the chat
	"sentry lock password"
	"sentry unlock password".]],
	weapons = {"vc_repair"},
	command = "engineer",
	max = 2,
	salary = 50,
	category = "Normal",
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = false
})

TEAM_GUN = DarkRP.createJob("Arms Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/csgobalkan1pm.mdl",
	description = [[A gundealer is the person who can sell guns to other
		people. This member of the clan is crucial to survival.]],
	weapons = {},
	command = "gundealer",
	max = 2,
	salary = 50,
	admin = 0,
	vote = false,
	category = "Normal",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true
})

TEAM_ARMOR = DarkRP.createJob("Armor Merchant", {
	color = Color(255, 140, 0, 255),
	model = "models/csgobalkan3pm.mdl",
	description = [[Bullet proof vests, helmets and hazmat equipment, everything for surviving! 
	
	Impact armor protects from hits and crashes, 
	Stab vest/riot helmet protect from melee weapons and zombie's claws, 
Ballistic vest/Steel helmet protect from explosions, 
Soft Kevlar Vest/Polyethylene Helmet protect from small arms
Kevlar vest/Kevlar Helmet protect from heavy arms,
HASMAT suit protects from chemical exhausts,
Faraday suit protects from fire,

To drop the vest type *drop vest* (with stars)
To drop the helmet type *drop helmet* (with stars)
To drop the suit type *drop suit* (with stars)   	]],
	weapons = {},
	command = "armordealer",
	max = 2,
	salary = 50,
	admin = 0,
	vote = false,
	category = "Normal",
	hasLicense = false,
	mayorCanSetSalary = true,
	candemote = true
})


//Government
TEAM_MAYOR = DarkRP.createJob("Governor", {
	color = Color(150, 20, 20, 255),
	model = "models/splinks/kf2/characters/player_albert.mdl",
	description = [[The governor is the one who took the lead in the civilization.
		He said that with order, we can survive for decades.
		With his police force under him, he is ready to lead this. 
		
	To place laws type /placelaws 
	To add laws type /addlaw 
	To remove laws type /removelaw 
	To start lottery do /lottery 150
	]],
	weapons = {"khr_gsh18"},
	command = "mayor",
	max = 1,
	salary = 125,
	category = "Government",
	admin = 0,
	vote = true,
	hasLicense = true,
	mayorCanSetSalary = false,
	candemote = true,
    	mayor = true,
    	customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)"
})

TEAM_SSH = DarkRP.createJob("Head of Security", {
    color = Color(105, 225, 220, 255),
    model = {"models/player/meryl_servicedress.mdl"},
    description = [[In charge of the governer's personal bodyguards and a bodyguard himself. Only to be used when a governer is present!]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cuff_police", "khr_mp5a5"},
	command = "hos",
	max = 1,
	salary = 100,
	category = "Government",
	admin = 0,
	vote = true,
	hasLicense = true,
	customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
	PlayerSpawn = function(ply) ply:SetArmor(55) end,
	CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)"
})

TEAM_SS = DarkRP.createJob("Secret Service", {
    color = Color(105, 225, 220, 255),
    model = {"models/player/barney.mdl"},
    description = [[The governer's personal bodyguards
    	only to be used when a governer is present]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cuff_police", "khr_mp5a4"},
	command = "secretservice",
	max = 2,
	salary = 75,
	category = "Government",
	admin = 0,
	vote = true,
	hasLicense = true,
	customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
	PlayerSpawn = function(ply) ply:SetArmor(55) end,
	CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)"
})

TEAM_FBI = DarkRP.createJob("FBI Agent", {
    color = Color(105, 225, 220, 255),
    model = {"models/player/fbi/fbi_02.mdl",
	"models/player/fbi/fbi_03.mdl"},
    description = [[Deployed as part of a secret FBI investigation to uncover information
	relating to Black Mesa and the reasons/information behind the HECU's sudden
	unauthorized military movements in the areas around the facility,
	when the portal storms came their OHQ was destoried forcing them
	to communicate and remain on good terms with HECU and the local 
	Goverment (Survival Protection).]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cuff_police", "prokeypadcracker", "weaponchecker", "climb_swep2", "khr_p226"},
	command = "fbi",
	max = 1,
	salary = 75,
	category = "Government",
	admin = 0,
	vote = true,
	hasLicense = true,
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) end,
	customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
	PlayerSpawn = function(ply) end,
	CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)"
})

TEAM_CHIEF = DarkRP.createJob("Survival Protection Chief", {
	color = Color(20, 20, 255, 255),
	model = "models/gta5/player/deputypm.mdl",
	PlayerSpawn =function(ply) ply:SetArmor(25) ply:SetBodygroup(0, 0) ply:SetBodygroup(1, 0) ply:SetBodygroup(2, 0) ply:SetBodygroup(3, 0)end,
	description = [[The chief, the leader or commander of the Survival Protection Program.
		You coordinate your forces, give them things to do.
		Protect your people from criminal activity.
		The 

		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cuff_police", "cw_p99", "stunstick", "weapon_doorbreak"},
	command = "chief",
	max = 1,
	salary = 100,
	admin = 0,
	NeedToChangeFrom = TEAM_POLICE,
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	cp = true,
	category = "Government"
})

TEAM_SHERIFF = DarkRP.createJob("Survival Protection Sheriff", {
	color = Color(20, 20, 255, 255),
	model = "models/gta5/player/deputypm.mdl",
	PlayerSpawn =function(ply) ply:SetArmor(50) ply:SetBodygroup(0, 1) ply:SetBodygroup(1, 1) ply:SetBodygroup(2, 1) ply:SetBodygroup(3, 1)end,
	description = [[New Mexico Sheriff.

		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cuff_police", "khr_410jury", "stunstick", "weapon_doorbreak"},
	command = "sheriff",
	max = 1,
	salary = 75,
	admin = 0,
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	cp = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	category = "Government"
})

TEAM_POLICE = DarkRP.createJob("Survival Protection", {
	color = Color(25, 25, 170, 255),
	model = "models/gta5/player/armoredcitycoppm.mdl",
	PlayerSpawn =function(ply) ply:SetArmor(25) ply:SetBodygroup(0, 0) ply:SetBodygroup(1, 0) ply:SetBodygroup(2, 0) ply:SetBodygroup(3, 0)end,
	description = [[You're part of the Survival Protection Program.
		You defend the Survivors from criminal activity and zombies.
		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "cw_m1911", "weapon_cuff_police", "stunstick", "weapon_doorbreak"},
	command = "cp",
	max = 4,
	salary = 50,
	admin = 0,
	vote = true,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	cp = true,
	police = true
})

TEAM_MILITARYCOMMANDER = DarkRP.createJob("Marine Commander", {
	color = Color(160, 200, 220, 255),
	model = "models/player/pmc_6/pmc__01.mdl",
	PlayerSpawn =function(ply) ply:SetArmor(75) end,
	description = [[ As a Marine Commander you lead the marine forces in the mojave desert to keep order throughout the wasteland. ]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cuff_police", "cw_g3a3", "cw_deagle", "stunstick", "weapon_doorbreak"},
	command = "marinecommander",
	max = 1,
	salary = 100,
	admin = 0,
	category = "Government",
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)"
})

TEAM_MILITARY = DarkRP.createJob("Marine Soldier", {
	color = Color(160, 200, 220, 255),
	model = {"models/player/pmc_6/pmc__06.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(50) end,
	description = [[ A US Marine soldier in the mojave desert when the portal storms hit. Keep the order with other military forces. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "cw_ar15", "cw_m1911", "stunstick", "weapon_doorbreak"},
	command = "marine",
	max = 4,
	salary = 50,
	admin = 0,
	category = "Government",
	vote = false,
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true
})

TEAM_MILITARYMEDIC = DarkRP.createJob("Marine Medic", {
	color = Color(166, 166, 166, 255),
	model = {"models/player/pmc_6/pmc__06.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(50) end,
	description = [[ As a Marine Medic you provide medical care to all government forces and have the choice to offer care to the civilans of the wasteland. You are also fully trained as a soldier. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "cw_mp5", "cw_m1911", "fas2_ifak", "stunstick", "weapon_doorbreak"},
	command = "militarymedic",
	max = 1,
	salary = 75,
	admin = 0,
	vote = true,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

TEAM_MILITARYSNIPER = DarkRP.createJob("Marine Sniper", {
	color = Color(160, 200, 220, 255),
	model = {"models/player/pmc_6/pmc__03.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(50) ply:SetRunSpeed(245) end,
	description = [[ As a Marine Sniper you use your athletic and climbing abilities to get to vantage points to provide cover from a distance. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "khr_sr338", "cw_m1911", "stunstick", "weapon_doorbreak", "climb_swep2"},
	command = "militarysniper",
	max = 1,
	salary = 75,
	admin = 0,
	vote = true,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

TEAM_MILITARYJUG = DarkRP.createJob("Marine Heavy", {
	color = Color(160,  200, 220, 255),
	model = {"models/player/pmc_6/pmc__14.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(150) end,
	description = [[ As a Marine Heavy Weapons Operative you use your heavy armour and weaponry to take point in raids and efficiently take down enemies. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "cw_m249_official", "cw_m1911", "stunstick", "weapon_doorbreak", "fas2_ammobox"},
	command = "militaryjuggernaut",
	max = 1,
	salary = 75,
	admin = 0,
	vote = true,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

TEAM_MILITARYENGINEER = DarkRP.createJob("Marine Engineer", {
	color = Color(166, 166, 166, 255),
	model = {"models/player/pmc_6/pmc__06.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(50) end,
	description = [[An engineer that is dedicated to assisting their fellow marines in protecting what is rightfully theirs.]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_cuff_police", "cw_mp5", "fas2_ammobox"},
	command = "militaryengineer",
	max = 1,
	salary = 150,
	admin = 0,
	vote = true,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!"
})

TEAM_MILITARYPILOT = DarkRP.createJob("Air Force Pilot", {
	color = Color(160, 160, 160, 255),
	model = {"models/player/pmc_2/pmc__05.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(100) end,
	description = [[ As an Air Force Pilot you fly attack helicopters and troop transports to prove support for the government. Be careful of invisible walls around the map and the map ceiling. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "cw_deagle", "stunstick"},
	command = "militarypilot",
	max = 1,
	salary = 404,
	admin = 0,
	vote = false,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = true,
	candemote = true,
	customCheck = function(ply) return table.HasValue(AdminzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "DISABLED, Air Force Pilot will be fixed in the future"
})

TEAM_ALPHALEADER = DarkRP.createJob("Alpha Squad Leader", {
	color = Color(160, 160, 160, 255),
	model = {"models/player/pmc_1/pmc__01.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(100) end,
	description = [[ As the Alpha Squad leader you lead you team of special operatives to take out high threat enemies. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "cw_scarh", "cw_deagle", "stunstick", "weapon_doorbreak"},
	command = "alphaleader",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!"
})

TEAM_ALPHAHUNTER = DarkRP.createJob("Alpha Squad Hunter", {
	color = Color(160, 160, 160, 255),
	model = {"models/player/pmc_1/pmc__03.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(75) ply:SetRunSpeed(260) end,
	description = [[ As the Alpha Squad Sniper, nicknamed Hunter, you use elite training to take out distance from distance and persue fast enemies. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "khr_m95", "khr_m92fs", "stunstick", "weapon_doorbreak", "climb_swep2"},
	command = "alphahunter",
	max = 1,
	salary = 200,
	admin = 0,
	vote = false,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!"
})

TEAM_ALPHABREACHER = DarkRP.createJob("Alpha Squad Breacher", {
	color = Color(160,  160, 160, 255),
	model = {"models/player/pmc_1/pmc__14.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(200) end,
	description = [[ As the Alpha Squad Heavy, nicknamed Breacher, you use your heavy firepower  to tank for your squad]],
	weapons = {"arrest_stick", "weapon_cuff_police", "khr_m60", "cw_jackhammer", "khr_m92fs", "stunstick", "weapon_doorbreak"},
	command = "alphabreacher",
	max = 1,
	salary = 200,
	admin = 0,
	vote = false,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!"
})

TEAM_ALPHATECH = DarkRP.createJob("Alpha Squad Tech", {
	color = Color(160, 160, 160, 255),
	model = {"models/player/pmc_1/pmc__06.mdl"},
	PlayerSpawn =function(ply) ply:SetArmor(75) end,
	description = [[ As the Alpha Squad Technician you use your medical and engineering expertise to aid your squad against enemies. ]],
	weapons = {"arrest_stick", "weapon_cuff_police", "khr_p90", "khr_m92fs", "fas2_ifak", "fas2_ammobox", "stunstick", "vc_repair", "weapon_doorbreak"},
	command = "alphatech",
	max = 1,
	salary = 200,
	admin = 0,
	vote = false,
	category = "Government",
	hasLicense = true,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!"
})


//Outlaw
TEAM_MOB = DarkRP.createJob("Bandit Leader", {
	color = Color(25, 25, 25, 255),
	model = "models/csgoleet4pm.mdl",
	description = [[With the most feared group of people stands a leader.
		Someone which brings fear to town.
		A true gangster before the apocalypse,
		now leader of the bandits of mojave.]],
	weapons = {"unarrest_stick", "cw_shorty", "khr_microdeagle"},
	command = "banditleader",
	max = 1,
	category = "Outlaw",
	salary = 80,
	admin = 0,
	NeedToChangeFrom = TEAM_BANDIT,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	PlayerSpawn = function(ply) ply:SetLockpickCount(5) end,
	customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)",
	candemote = true
})

TEAM_GANG = DarkRP.createJob("Bandit", {
	color = Color(75, 75, 75, 255),
	model = "models/csgoanarchist4pm.mdl",
	description = [[The most feared group of people in this new civilization.
		You're reputation is low yet neutral.
		You're known for mugging and stealing things from people,
		mainly for your own survival.]],
	weapons = {khr_microdeagle},
	command = "bandit",
	max = 4,
	salary = 50,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true
})

TEAM_GANGCOOK = DarkRP.createJob("Bandit Cook", {
	color = Color(75, 75, 75, 255),
	model = {"models/dpfilms/jetropolice/playermodels/pm_police_bt.mdl",
	"models/csgoanarchist4pm.mdl"
	},
	description = [[Water, food and drugs have always had a big demand. Cook high quality meth and then sell it. The higher the quality, the bigger the price.]],
	weapons = {},
	command = "cooker",
	max = 2,
	salary = 50,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true
})

TEAM_GANGMEDIC = DarkRP.createJob("Bandit Medic", {
	color = Color(75, 75, 75, 255),
	model =	"models/csgoleet2pm.mdl",
	description = [[The medic is an important part of the group.  
	He can assist you with healing and spare bandages.]],
	weapons = {"khr_microdeagle", "fas2_ifak"},
	command = "banditmedic",
	max = 1,
	salary = 75,
	category = "Outlaw",
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

TEAM_GANGHEAVY = DarkRP.createJob("Bandit Heavy", {
	color = Color(75, 75, 75, 255),
	model =	"models/csgopheonix3pm.mdl",
	description = [[Heavy promvides ammunation and suppressive fire for his team.]],
	weapons = {"heretic_cw2_saiga12k", "khr_microdeagle", "fas2_ammobox"},
	command = "banditheavy",
	max = 1,
	salary = 75,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)",
	PlayerSpawn = function(ply) ply:SetArmor(125) end
})

TEAM_GANGSNIPER = DarkRP.createJob("Bandit Sniper", {
	color = Color(75, 75, 75, 255),
	model =	"models/csgoleet1pm.mdl",
	description = [[Long distance engagement is always good for backing up your teammates from a far.]],
	weapons = {"cw_dragnov", "khr_microdeagle"},
	command = "banditsniper",
	max = 1,
	salary = 75,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

TEAM_GANGPYRO = DarkRP.createJob("Bandit Pyromaniac", {
	color = Color(75, 75, 75, 255),
	model = {"models/dpfilms/jetropolice/playermodels/pm_policetrench.mdl"
	},
	description = [[Fire - most primitive yet most effective tool for cleaning up an entire forest from abominations, as well as the forest itself.]],
	weapons = {"cw_flamethrower_anh", "khr_makarov"},
	command = "pyro",
	max = 1,
	salary = 75,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!"
})

TEAM_GANGSCOUT = DarkRP.createJob("Bandit Scout", {
	color = Color(75, 75, 75, 255),
	model =	"models/stalkertnb/bandit_female6.mdl",
	description = [[The Bandit Scout is a very stealthy, well organised woman. Watch out as she is always watching.]],
	weapons = {"khr_t5000", "khr_rugermk3", "weapon_sh_keypadcracker_deploy", "climb_swep2"},
	command = "banditscout",
	max = 1,
	salary = 250,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(15) ply:SetArmor(75) end
})

TEAM_GANGBOMB = DarkRP.createJob("Bandit Bomber", {
	color = Color(75, 75, 75, 255),
	model =	"models/stalkertnb/bandit_hour.mdl",
	description = [[The bomber is a ruthless person who likes to play with explosives.]],
	weapons = {"khr_m620", "weapon_slam", "weapon_sh_keypadcracker_deploy", "khr_ots33"},
	command = "banditbomber",
	max = 1,
	salary = 250,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(75) end
})

TEAM_GANGJUGNAUT = DarkRP.createJob("Bandit Juggernaut", {
	color = Color(75, 75, 75, 255),
	model =	"models/player/mgstps_sovietsoldier.mdl",
	description = [[The Bandit Juggernaut is the most feared of them all, he is the most powerful. Come face to face with this monster and you have no chance of surviving.]],
	weapons = {"khr_pkm", "weapon_sh_keypadcracker_deploy", "khr_deagle"},
	command = "banditjuggernaut",
	max = 1,
	salary = 250,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(250) end
})

TEAM_GANGLORD = DarkRP.createJob("Bandit Overlord", {
	color = Color(75, 75, 75, 255),
	model =	"models/stalkertnb/bandit_overwatch.mdl",
	description = [[This is the Overlord of the wastelands. He is Leader of leaders, Do not get on his wrong side!]],
	weapons = {"khr_410jury", "weapon_sh_keypadcracker_deploy", "khr_cz858"},
	command = "banditoverlord",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(125) end
})

TEAM_GANGCULTL = DarkRP.createJob("Cult Leader", {
	color = Color(75, 75, 75, 255),
	model =	"models/player/plague_doktor/player_plague_doktor.mdl",
	description = [[You're the leader of your very own cult, you rage chaos across the wasteland for your own ideals and believes.]],
	weapons = {"khr_sks", "weapon_sh_keypadcracker_deploy", "khr_swr8"},
	command = "cultleader",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(100) end
})

TEAM_GANGCULT = DarkRP.createJob("Cult Member", {
	color = Color(75, 75, 75, 255),
	model =	"models/player/doktor_haus/plague_doctor.mdl",
	description = [[You're a part of the feared cult and you obey the cult leader.]],
	weapons = {"khr_mp40", "weapon_sh_keypadcracker_deploy", "khr_p345", "fas2_ifak"},
	command = "cultmember",
	max = 3,
	salary = 200,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(5) ply:SetArmor(75) end
})

TEAM_GANGPOTW = DarkRP.createJob("Protector of the Wastes", {
	color = Color(75, 75, 75, 255),
	model =	"models/wheatleymodels/soma/simon_divingsuit.mdl",
	description = [[The Protector, a man dedicating his life to protect the wasteland and it's people. 
	You kill zombies or protect other people to make the wasteland a safer place.]],
	weapons = {"khr_t5000", "weapon_sh_keypadcracker_deploy", "cw_mr96", "fas2_ifak"},
	command = "potw",
	max = 1,
	salary = 250,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetArmor(100) end
})

TEAM_GANGDOTW = DarkRP.createJob("Destroyer of the Wastes", {
	color = Color(75, 75, 75, 255),
	model =	"models/player/demon_violinist/demon_violinist.mdl",
	description = [[This demon was created during one of the unfortunate Portal Storms 
	when a survivor of the zombie apocalypse had come to a sad and drastic end. 
	The portal storm transformed his body and made him a demon, 
	he now seeks vengance on all who did him wrong as he now has the power to do whatever he pleases, 
	no-one can get in his way... no-one]],
	weapons = {"cw_ksg12", "weapon_sh_keypadcracker_deploy", "khr_ragingbull", "fas2_ifak"},
	command = "dotw",
	max = 1,
	salary = 200,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetArmor(100) end
})

TEAM_THIEF = DarkRP.createJob("Thief", {
	color = Color(25, 25, 25, 255),
	model = "models/player/arctic.mdl",
	description = [[Steal, mug people is your priority]],
	weapons = {"weapon_sh_keypadcracker_deploy"},
	command = "thief",
	max = 2,
	salary = 50,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	PlayerSpawn = function(ply) ply:SetLockpickCount(5) end,
	thief = true
})

TEAM_PROTHIEF = DarkRP.createJob("Professional Thief", {
	color = Color(25, 25, 25, 255),
	model = "models/csgoprofessional1pm.mdl",
	description = [[A very experienced thief, has advanced equipment and is always prepared.]],
	weapons = {"weapon_procracker", "khr_veresk", "khr_tokarev"},
	command = "prothief",
	max = 2,
	salary = 75,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(55) end
})

TEAM_MERCENARYLEADER = DarkRP.createJob("Mercenary Leader", {
	color = Color(78, 217, 65, 255),
	model = "models/player/tfa_kz_helghast_assault.mdl",
	description = [[You command your fellow mercenaries into battle, with your experience in the field,
	You're sure to be a a hard target to deal with.]],
	weapons = {"fas2_dv2", "weapon_sh_keypadcracker_deploy", "cw_ws_scifi_aug", "khr_gsh18"},
	command = "mercenaryleader",
	max = 1,
	salary = 200,
	admin = 0,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	hitman = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(100) end
})

TEAM_MERCENARY = DarkRP.createJob("Mercenary", {
	color = Color(78, 217, 65, 255),
	model = "models/blacklist/spy1.mdl",
	description = [[You work independantly taking jobs from anyone,
		this can be to guard bases or raid others.]],
	weapons = {"fas2_dv2","cw_ump45"},
	command = "mercenary",
	max = 2,
	salary = 50,
	admin = 0,
	vote = true,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	hitman = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

TEAM_HITMAN = DarkRP.createJob("Hitman", {
	color = Color(84, 34, 94, 255),
	model = "models/player/mgs4_bigboss.mdl",
	description = [[A hitman gets payed to kill people,
		but be carefull, if you accept a hit you will become AOS!]],
	weapons = {"fas2_dv2", "cw_ws_mosin"},
	command = "hitman",
	max = 1,
	salary = 50,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	hitman = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

TEAM_ASSASSIN = DarkRP.createJob("Assassin", {
	color = Color(0, 10, 0, 255),
	model = "models/player/archer.mdl",
	description = [[A former servant of secret Black Ops agency that was responsible for thermonuclear catastrophe in Black Mesa. Just like HECU Marines, they were abandoned by the government and executed by the CIA to keep the secrets of the incedent in their tombs. Some members of Black Ops survived the purge and now serve another role undercove, as always, professionally dealing with people.]],
	weapons = {"sbs_stealthboy_infiniteuse", "climb_swep2", "fas2_dv2", "khr_p345", "cw_m40a5"},
	command = "Assassin",
	max = 1,
	salary = 75,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	assassin = true,
	customCheck = function(ply) return table.HasValue(VIPzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to donate in order to become this job!",
	PlayerSpawn = function(ply) ply:SetArmor(55) end
})

TEAM_RUNNER = DarkRP.createJob("Contrabandist", {
	color = Color(255, 0, 0, 255),
	model = {"models/mark2580/dmc/dmc_kat.mdl"},
	description = [[You are searched from every spot in the world.
		Everybody knows you, what you've done.
		You might be agile but they'll never stop hunting you down.
		Every police force will arrest you on sight.
		(AOS)]],
	weapons = {"climb_swep2"},
	command = "runner",
	max = 2,
	category = "Outlaw",
	salary = 50,
	admin = 0,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = false
})

TEAM_DRUG = DarkRP.createJob("Drug Dealer", {
	color = Color(75, 75, 75, 255),
	model = "models/h-d/2sg/simonplayer.mdl",
	description = [[Sell drugs but be carefull, it is illegal and you can get arrested.
	
    Different drugs give different effects that have advantages and disadvantages. You should also remember that if you consume any drug way too much you can die because of overdose.
Heroin gives you 200 health but after a short period of time you'll need another does or you will die.
Cocaine makes you faster but takes some of your health as an exchange. 
LSD makes you shine.
PCP makes you flashy.
Mushrooms make your screen sharpy and takes some of your health.
Meth take 2/3 of your health and creates increadible visual effects.
Weed makes you feel smooth and regenerates health each time you use it.

Bong regenerates your health but makes your visuals terrible.
Joint regenerates health by 1 each consume but makes your screen visuals terrible.
]],
	weapons = {"sent_tablet"},
	command = "drugdealer",
	max = 2,
	salary = 50,
	admin = 0,
	vote = false,
	category = "Outlaw",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true
})

TEAM_BMDEALER = DarkRP.createJob("Black Market Dealer", {
	color = Color(0, 0, 0, 255),
	model = "models/csgopirate3pm.mdl",
	description = [[As a Black Market Dealer you sell illegal explosive weaponry,
		so be careful, you can be arrested by the police on sight!]],
	weapons = {},
	command = "BMD",
	max = 1,
	salary = 50,
	admin = 0,
	category = "Outlaw",
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	BMD = true,
	customCheck = function(ply) return table.HasValue(TrustedzRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be Trusted to play this job! (Play 8h)"
})

//customjobs

TEAM_GANGJASON = DarkRP.createJob("Jason Voorhees", {
	color = Color(75, 75, 75, 255),
	model =	"models/models/konnie/jasonpart3/jasonpart3.mdl",
	description = [[I like worms -Suggested by Jaguarzz]],
	weapons = {"tfa_nmrih_machete", "tfa_nmrih_pickaxe"},
	command = "customjason",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Custom Jobs",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(5) end
})

TEAM_GANG2B = DarkRP.createJob("2B", {
	color = Color(75, 75, 75, 255),
	model =	"models/player/tuubiii.mdl",
	description = [[2B is an all-purpose battle android, deployed to battle any resistance. She is equipped with a multitude of weapons for close quarters combat and can attack from range using the Pod support system. Her eyes are obscured beneath her standard-issue military visor, which she rarely removes.]],
	weapons = {"weapon_mad_2b"},
	command = "custom2B",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Custom Jobs",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return (ply:SteamID() == "STEAM_0:1:46950093") end,
	CustomCheckFailMsg = "You need to be Hunted to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(5) end
})

TEAM_GANGGHOST = DarkRP.createJob("Ghost", {
	color = Color(75, 75, 75, 255),
	model =	"models/ghost/diver.mdl",
	description = [[Ghost is an ex special forces killing machine. he went rogue after the many battles he had which changed him into the way he is now. he is now one of the most feared thieves ever to live in the wastelands.]],
	weapons = {"cw_kk_hk416","climb_swep2","yetanother3dmg"},
	command = "customghost",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Custom Jobs",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return (ply:SteamID() == "STEAM_0:1:62045533") end,
	CustomCheckFailMsg = "You need to be ghost to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(150) end
})

TEAM_GANGJACK = DarkRP.createJob("Jack of all Trades", {
	color = Color(75, 75, 75, 255),
	model =	"models/player/n7legion/killingfloor2/horzine_sec_suit_male.mdl",
	description = [[A young boy, named Maverick, was trained in every way. But bow, he is a hero, a man looking for work and helping people.]],
	weapons = {"khr_t5000", "khr_p90", "climb_swep2", "weapon_cuff_rope"},
	command = "customjack",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Custom Jobs",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return table.HasValue(VIP2zRanks, ply:GetUserGroup()) end,
	CustomCheckFailMsg = "You need to be permanent donator in order to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(5) ply:SetArmor(100) end
})

TEAM_GANGAGNOR = DarkRP.createJob("Agnor The Berserker", {
	color = Color(75, 75, 75, 255),
	model =	"models/mailer/characters/beserkerarmor.mdl",
	description = [[Before the Combine invaded the Earth Agnor was a simple hard-working man, but everything changed when the seven war began. 
	He was captured by the combine and experimented on with technology unknown to the Conbine, this unknown artifact was placed upon his body, 
	and as a result he gained superhuman strength and speed. But at the cost of any sense of mercy and a constant urge to kill, 
	now he wonders the wasteland searching for someone or something that can restore his former life and humanity. But at what cost?
	The cost of lore ya toss pots, staph breaking it.]],
	weapons = {"weapon_re5executioner", "scifi_el10", "weapon_procracker", "fas2_ifak", "scifi_pistol"},
	command = "customagnor",
	max = 1,
	salary = 300,
	admin = 0,
	vote = false,
	category = "Custom Jobs",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return (ply:SteamID() == "STEAM_0:1:48841208") end,
	CustomCheckFailMsg = "You need to be Bearoni or Inf3cted to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(200) end
})

//orderofvalour

TEAM_OOVMASTER = DarkRP.createJob("O.O.V Grand Master", {
	color = Color(97, 115, 130),
	model =	"models/ninja/raidenmgr.mdl",
	description = [[Leader of O.O.V, the Grand Master oversees everything within his group. Elden is a cyborg who has the eternal conflict of good and bad. 
	He will extend his reach to help others, and also bring down his wrath upon those he condemn. 
	Due to his cybernetics, Elden is more mobile and can also harness new technological equipment.]],
	weapons = {"climb_swep2", "weapon_roach_fury", "cw_blackops3_dlc4_mnwr","weapon_procracker", "fas2_ifak", "weapon_cuff_police"},
	command = "oovmaster",
	max = 1,
	salary = 200,
	admin = 0,
	vote = false,
	category = "Order of Valour",
	hasLicense = false,
	mayorCanSetSalary = false,
	candemote = true,
	customCheck = function(ply) return (ply:SteamID() == "STEAM_0:1:23346947") end,
	CustomCheckFailMsg = "You need to be the Grand Master to become this job!",
	PlayerSpawn = function(ply) ply:SetLockpickCount(1) ply:SetArmor(200) ply:SetBodygroup (0, 0) ply:SetBodygroup (1, 1) end,
})

TEAM_OOVJUSTICIAR = DarkRP.createJob("O.O.V Justiciar", {
    color = Color(97, 115, 130),
    model = {"models/player/bobert/mknoob.mdl"},
    description = [[The judge, the Justiciar is tasked with identifying corrupt targets and then dealing with them appropriately. 
	This could vary from simply giving a warning or marking them for death, either way. 
	This faceless man is not someone you want to get on the wrong side of, not to mention he is also a trained assassin. 
	Justiciars can also make political group decisions with outside parties, but must keep the Grand Master up to date. 
	You do not have authority over the Sentinel or Grand Master.]],
    weapons = {"climb_swep2", "sbs_stealthboy_infiniteuse", "tfa_kf2_ddeagle", "tfa_l4d2_kfkat", "weapon_procracker", "fas2_ifak", "weapon_cuff_police"},
    command = "oovjusticiar",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    category = "Order of Valour",
    hasLicense = false,
    mayorCanSetSalary = false,
    candemote = false,
    customCheck = function(ply) return (ply:SteamID() == "STEAM_0:0:138586095") end,
    CustomCheckFailMsg = "You need to be Jaqen H'ghar to become this job!",
    PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(200) end
})

TEAM_OOVSENTINEL = DarkRP.createJob("O.O.V Sentinel", {
    color = Color(97, 115, 130),
    model = {"models/player/n7legion/killingfloor2/horzine_sec_suit_male.mdl"}, {"models/player/n7legion/killingfloor2/horzine_sec_suit_female.mdl"},
    description = [[The second-in-command, tasked with organising and maintaining the O.O.V – this includes setting up raids against the corrupt, recruiting members and making group decisions with other factions. 
	You do not have authority over the Justiciar or Grand Master. 
	Wearing an advanced plated suit, you are more mobile than the average person. Any group decisions must be reported to the Grand Master.]],
    weapons = {"weapon_procracker", "weapon_cuff_police", "cw_blackops3_dlc4_m8a7", "tfa_l4d2_falcon2", "fas2_ifak"},
    command = "oovsentinel",
    max = 1,
    salary = 200,
    admin = 0,
    vote = false,
    category = "Order of Valour",
    hasLicense = false,
    mayorCanSetSalary = false,
    candemote = false,
    customCheck = function(ply) return (ply:SteamID() == "STEAM_0:1:23346947") end,
    CustomCheckFailMsg = "You need to be a Sentinel to become this job!",
    PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(200) Entity:SetBodygroup (0 , 10) end
})
local SteamID = {"STEAM_0:1:23346947", "STEAM_0:1:90147877","STEAM_0:1:49668614"}
TEAM_OOVDEATHMARK = DarkRP.createJob("O.O.V Deathmark", {
    color = Color(97, 115, 130),
    model = {"models/ninja/mgs4_haven_trooper.mdl"},
    description = [[Spec-ops units, their stealth and marksman skills are unrivalled in the field, tasked with eliminating enemy threats.
	You take orders from the Grand Master or Justiciar. If the Justiciar marks someone for death, you will act as his hands and put the target down.
	/advert Deathmark launched
	/advert Deathmark failed
	/advert Deathmark fulfilled
	/advert Deathmark abandoned]],
    weapons = {"climb_swep2", "sbs_stealthboy_infiniteuse", "cw_snip_awsm", "cw_pist_m9a1", "fas2_ifak"},
    command = "oovdeathmark",
    max = 2,
    salary = 150,
    admin = 0,
    vote = false,
    category = "Order of Valour",
    hasLicense = false,
    mayorCanSetSalary = false,
    candemote = false,
	customCheck = function(ply) return table.HasValue(SteamID,  ply:SteamID()) end,
    CustomCheckFailMsg = "You need to be member of OOV to become this job!",
    PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(100) end
})
local SteamID = {"STEAM_0:1:23346947", "STEAM_0:0:114289483"}
TEAM_OOVPALADIN = DarkRP.createJob("O.O.V Paladin", {
    color = Color(97, 115, 130),
    model = {"models/player/ai_soldiers.mdl"},
    description = [[The shock troopers of O.O.V, their task is to protect O.O.V towns, higher ranking members and to also act as a vanguard during assaults against opposing forces.
	These units are well trained. You take orders from the Sentinel, Justiciar and Grand Master.]],
    weapons = {"weapon_cuff_police", "tfa_blr_ar", "cw_m1911", "weapon_sh_keypadcracker_deploy", "fas2_ifak"}, 
    command = "oovpaladin",
    max = 3,
    salary = 150,
    admin = 0,
    vote = false,
    category = "Order of Valour",
    hasLicense = false,
    mayorCanSetSalary = false,
    candemote = false,
	customCheck = function(ply) return table.HasValue(SteamID,  ply:SteamID()) end,
    CustomCheckFailMsg = "You need to be a member of OOV to become this job!",
    PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(150) ply:SetBodyGroups( "2000000" ) end
})
local SteamID = {"STEAM_0:0:73526436", "STEAM_0:1:23346947"}
TEAM_OOVKNIGHTC = DarkRP.createJob("O.O.V Knight-Captain", {
    color = Color(97, 115, 130),
    model = {"models/player/fear2/atc_heavy.mdl"},
    description = [[You are the leader of a squad of knights, take them on patrols through the wastelands and enforce peace.
	You can order apothecary’s and knights.]],
    weapons = {"weapon_cuff_police", "weapon_doorbreak", "cw_blackops3_xr2", "cw_fiveseven", "fas2_ifak"},
    command = "oovknightc",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    category = "Order of Valour",
    hasLicense = false,
    mayorCanSetSalary = false,
    candemote = false,
	customCheck = function(ply) return table.HasValue(SteamID,  ply:SteamID()) end,
    CustomCheckFailMsg = "You need to be a member of OOV to become this job!",
    PlayerSpawn = function(ply) ply:SetLockpickCount(10) ply:SetArmor(120) end
})

TEAM_OOVAPOTHECARY = DarkRP.createJob("O.O.V Apothecary", {
    color = Color(97, 115, 130),
    model = {"models/fear3/atcspecops.mdl"},
    description = [[The medics of the Order, highly knowledgeable in first aid, they serve the O.O.V –
	mainly through the use of keeping its members alive and treating innocents. Even if that means you are to send enemies 6 feet under.]],
    weapons = {"cw_blackops3_spartan", "fas2_ifak"},
    command = "oovapothecary",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    category = "Order of Valour",
    hasLicense = false,
    mayorCanSetSalary = false,
    candemote = false,
    customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
    CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)",
    PlayerSpawn = function(ply) ply:SetLockpickCount(5) ply:SetArmor(75) end
})

TEAM_OOVKNIGHT = DarkRP.createJob("O.O.V Knight", {
    color = Color(97, 115, 130),
    model = {"models/player/fear2/atc_merc.mdl"},
    description = [[Foot-soldier of the O.O.V, tasked to protect the innocent and uphold peace. You must listen to your superiors and follow the moral code.]],
    weapons = {"f3ar_penetrator", "fas2_ifak", "cw_fiveseven", "weapon_cuff_police", "weapon_doorbreak"},
    command = "oovknight",
    max = 4,
    salary = 100,
    admin = 0,
    vote = false,
    category = "Order of Valour",
    hasLicense = false,
    mayorCanSetSalary = false,
    candemote = false,
    customCheck = function(ply) return table.HasValue(MemberzRanks, ply:GetUserGroup()) end,
    CustomCheckFailMsg = "You need to be Member to play this job! (Play 24h)",
    PlayerSpawn = function(ply) ply:SetLockpickCount(5) ply:SetArmor(100) end
})

//Admin on Duty
local corvogroups = {"owner", "headadmin", "superadmin"}
TEAM_ADMIN = DarkRP.createJob("Staff on Duty", {
    color = Color(210, 210, 210, 153),
    model = "models/nikout/dishonored/assassin1.mdl",
    description = [[Don't rp as this job.]],
    weapons = {"weapon_electron", "fas_dv2"},
    command = "admin",
    max = 64,
    salary = 45,
    admin = 0,
    cp = true,
    vote = false,
    hasLicense = false,
    mayorCanSetSalary = false,
    customCheck = function(ply) return table.HasValue(AdminzRanks, ply:GetUserGroup()) end,
    PlayerSpawn = function(ply)
        if table.HasValue(corvogroups, ply:GetUserGroup()) then
            timer.Simple(0.2, function()
                ply:SetModel("models/player/corvo.mdl")
            end)
        end
    end,
    candemote = false
})

// Hunter
TEAM_HUNTER = DarkRP.createJob("Hunter", {
	color = Color(8, 64, 0, 255),
	model = "models/player/john_marston.mdl",
	description = [[The World is flooded with a varaty of abomination that are barely studied. Scientists as well as poachers are ready to pay big price for these materials. A hunter can kill creatures and collect their limbs, which he can later sell to the Poacher and get some money. He also has a bigger bag than other jobs to store more items. Hunt Antlionguards and Poison zombies to get most expensive items]],
	weapons = {},
	command = "hunter",
	max = 2,
	salary = 45,
	admin = 0,
	vote = false,
	category = "Normal",
	hasLicense = false,
	mayorCanSetSalary = true,
	candemote = true
})


/*TEAM_EVENT1 = DarkRP.createJob("Team 1", {
	color = Color(150, 20, 20, 255),
	model = {
		"models/humans/group02/player/tale_01.mdl",
		"models/humans/group02/player/tale_03.mdl",
		"models/humans/group02/player/tale_04.mdl",
		"models/humans/group02/player/tale_05.mdl",
		"models/humans/group02/player/tale_07.mdl",
		"models/humans/group02/player/tale_08.mdl",
		"models/humans/group02/player/tale_09.mdl",
		"models/humans/group02/player/temale_01.mdl",
		"models/humans/group02/player/temale_02.mdl",
		"models/humans/group02/player/temale_07.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	PlayerSpawn = function(ply) ply:SetHealth(100) end,
	description = [[Don't rp as this job.]],
	weapons = {},
	command = "team1",
	max = 64,
	salary = 25,
	admin = 0,
	cp = true,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	customCheck = function(ply) return table.HasValue(AdminzRanks, ply:GetUserGroup()) end,
	candemote = false
})

TEAM_EVENT2 = DarkRP.createJob("Team 2", {
	color = Color(20, 20, 255, 255),
	model = {
		"models/humans/group02/player/tale_01.mdl",
		"models/humans/group02/player/tale_03.mdl",
		"models/humans/group02/player/tale_04.mdl",
		"models/humans/group02/player/tale_05.mdl",
		"models/humans/group02/player/tale_07.mdl",
		"models/humans/group02/player/tale_08.mdl",
		"models/humans/group02/player/tale_09.mdl",
		"models/humans/group02/player/temale_01.mdl",
		"models/humans/group02/player/temale_02.mdl",
		"models/humans/group02/player/temale_07.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	PlayerSpawn = function(ply) ply:SetHealth(100) end,
	description = [[Don't rp as this job.]],
	weapons = {},
	command = "team2",
	max = 64,
	salary = 25,
	admin = 0,
	cp = true,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	customCheck = function(ply) return table.HasValue(AdminzRanks, ply:GetUserGroup()) end,
	candemote = false
})*/


	--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN


--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_CHIEF] = true,
	[TEAM_MAYOR] = true,
	[TEAM_SHERIFF] = true,
	[TEAM_MILITARY] = true,
	[TEAM_MILITARYCOMMANDER] = true,
	[TEAM_MILITARYJUG] = true,
	[TEAM_MILITARYSNIPER] = true,
	[TEAM_MILITARYMEDIC] = true,
	[TEAM_MILITARYPILOT] = true,
	[TEAM_ALPHALEADER] = true,
    [TEAM_ALPHAHUNTER] = true,
    [TEAM_ALPHABREACHER] = true,
    [TEAM_ALPHATECH] = true,
}


--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_HITMAN)
DarkRP.addHitmanTeam(TEAM_ASSASSIN)