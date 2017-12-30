--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields
---------------------------------------------------------------------------]]
--[[
My job for you is to import jobs and edit them.
There are some new tags for you to use now which leaves most customCheck things obsolete.

Do not import every job, I will be wanting mostly the jobs that were here from the start.
Do not know, ask me.

Custom Tags (Some may not work, but will in the future, none of these tags are required and can be ignored completely):
hp = 150, (but it's for setting a custom HP value)
armor = 100, (setting an armor value on spawn)
suit = "EOD", (Can set that the player spawns with suit on spawn)
helmet = "NVG", (Will apply a helmet on spawn)
body = "Kevlar Vest", (Will apply a bodyarmor on spawn)
util = "Green Backpack", (Will apply a backpack on spawn)
IsVIP = true, (Makes this Job VIP-Only)
IsGVIP = true, (Makes this job GVIP-Only)
Raid = true, (Makes a job able to raid or not)
--]]
// #NoSimplerr#

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
	label = "Survivor",
})

//Govenor
TEAM_GOVENOR = DarkRP.createJob("Govenor", {
color = Color(255, 000, 000, 000),
model = "models/player/breen.mdl",
description = [[You are the govenor of the town. You control the police and citizens.]],
weapons = {},
command = "govenor",
max = 1,
salary = 50,
category = "Law",
admin = 0,
vote = true
mayorCanSetSalary = false,
candemote = true,
Govenor = true
})

//Police
TEAM_POLICE = DarkRP.createJob("Survival Protection", {
color = Color(0,0,153),
model = {"models/player/police.mdl", "models/player/policefem.mdl"}
description = [[You are the main law enforcement of the city, protect the people from criminals and zombies]]
weapons = "khr_p226",
command = "sp",
max = 4,
salary = 20,
category = "Law"
admin = false,
vote = false
mayorCanSetSalary = true,
candemote = false,
})

//Police Cheif
TEAM_POLICE CHEIF = DarkRP.createJob("Survival Protection Chief", {
color = Color(0,0,255),
model = "models/player/police.mdl", "models/player/policefem.mdl",
description = [[You command the police and order them to do things.You are slightly better equipped than regular police.]]
weapons = "khr_p226", "khr_toz194"
command = "Chief",
max = 1,
salary = 30,
category = "Law"
admin = false,
vote = true
mayorCanSetSalary = true,
Trusted = true,
})


//Marine Soldier
TEAM_MARINE = DarkRP.createJob("HECU Soldier", {
color = Color(66,66,66),
model = "models/jessev92/soldier_bms/marine1_poser.mdl",
description = [[ You are a Marine Soldier, you protect the city and have more firepower than regualar police.]]
weapons = {"khr_p90", "khr_m92fs"},
command = "hecu",
max = 3,
salary = 25,
category = "Normal"
admin = false,
vote = false,
mayorCanSetSalary = true,
Trusted = true
})

//Marine Sniper
TEAM_MARINE_SNIPER = DarkRP.createJob("HECU Sniper", {
color = Color(66,66,66),
model = "models/player/PMC_5/PMC__03.mdl",
description = [[You are a Marine Soldier,you snipe your enimies from afar and scout.]]
weapons = {"khr_t5000", "khr_ots33"},
command = "hecusniper",
max = 2,
salary = 25,
category = "Normal"
admin = false,
vote = false,
mayorCanSetSalary = true,
IsVIP = true
})

	--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN

--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
}


--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
//DarkRP.addHitmanTeam(TEAM_HITMAN)
