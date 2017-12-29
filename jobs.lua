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
	label = "Survivor"
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