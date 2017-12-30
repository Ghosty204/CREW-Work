--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua#L111

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]
// #NoSimplerr#

local AdminzRanks = {"moderator", "owner", "superadmin", "admin", "headadmin", "Trial-Mod", "mapper"}
local MemberzRanks = {"member", "donator", "donator2", "moderator", "owner", "superadmin", "admin", "headadmin", "Trial-Mod"}
local TrustedzRanks = {"trusted", "member", "moderator", "donator", "donator2", "owner", "superadmin", "admin", "headadmin", "Trial-Mod"}
local VIPzRanks = {"donator", "donator2", "owner", "moderator", "superadmin", "admin", "headadmin", "Trial-Mod"}
local VIP2zRanks = {"donator2", "owner", "moderator", "superadmin", "admin", "headadmin", "Trial-Mod"}

AddEntity("Bandages", {
	ent = "fas2_ammo_bandages",
	model = "models/Items/BoxMRounds.mdl",
	price = 90,
	category = "Medical",
	max = 9000,
	cmd = "/buybandage",
	allowed = {TEAM_MEDIC, TEAM_MILITARYMEDIC, TEAM_GANGMEDIC}
})

AddEntity("Universal Ammo Kit", {
	ent = "cw_ammo_kit_small",
	model = "models/Items/BoxMRounds.mdl",
	price = 5000,
	category = "Tools",
	max = 90000,
	cmd = "/buyammobox",
})

AddEntity("Quickcloths", {
	ent = "fas2_ammo_quikclots",
	model = "models/Items/BoxMRounds.mdl",
	price = 120,
	category = "Medical",
	max = 9000,
	cmd = "/buycloths",
	allowed = {TEAM_MEDIC, TEAM_MILITARYMEDIC, TEAM_GANGMEDIC}
})

AddEntity("Fishing Rod", {
	ent = "fishing_rod",
	model = "models/props_junk/harpoon002a.mdl",
	price = 30,
	category = "Fishing",
	max = 2,
	cmd = "/buyrod",
	allowed = {TEAM_FISHER}
})

AddEntity("Fishing Hook", {
	ent = "fishing_hook",
	model = "models/props_junk/meathook001a.mdl",
	price = 30,
	category = "Fishing",
	max = 2,
	cmd = "/buyhook",
	allowed = {TEAM_FISHER}
})

AddEntity("Bait", {
	ent = "fishing_bait",
	model = "models/weapons/w_bugbait.mdl",
	price = 30,
	category = "Fishing",
	max = 9999,
	cmd = "/buybait",
	allowed = {TEAM_FISHER}
})

AddEntity("Hemostats", {
	ent = "fas2_ammo_hemostats",
	model = "models/Items/BoxMRounds.mdl",
	price = 150,
	category = "Medical",
	max = 9000,
	cmd = "/buyhemo",
	allowed = {TEAM_MEDIC, TEAM_MILITARYMEDIC, TEAM_GANGMEDIC}
})


AddEntity("Blackhawk", {
	ent = "wac_hc_uh60lau61ca",
	model = "models/wac/uh60_lau61ca.mdl",
	price = 35000,
	category = "Helicopters",
	max = 1,
	cmd = "/hawk",
	allowed = TEAM_MILITARYPILOT
})

AddEntity("Apache", {
	ent = "wac_hc_ah64d_longbow",
	model = "models/sentry/apache.mdl",
	price = 50000,
	category = "Helicopters",
	max = 1,
	cmd = "/apache",
	allowed = TEAM_MILITARYPILOT
})

AddEntity("7.62x39mm Turret (Machine-Gun)", {
	ent = "turret_bullets",
	model = "models/reach/weapons/turret/hmg_fix.mdl",
	price = 15000,
	category = "Turrets",
	max = 50,
	cmd = "/machineturret",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})
AddEntity("14mm Turret (AA)", {
	ent = "turret_bullets2",
	model = "models/turret/mg_turret.mdl",
	price = 15000,
	category = "Turrets",
	max = 50,
	cmd = "/machineaa",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("Pistol AI Turret", {
	ent = "ent_jack_turret_pistol",
	model = "models/Combine_turrets/Floor_turret.mdl",
	price = 5000,
	category = "AI turrets and equipment",
	max = 3,
	cmd = "/aipistol",
	spawn = function(ply, tr)
		local SpawnPos=tr.HitPos + tr.HitNormal*16
		local ent=ents.Create("ent_jack_turret_pistol")
		ent:SetPos(SpawnPos)
		ent:SetNetworkedEntity("Owenur",ply)
		ent.TargetingGroup={0,4,2,5,9}
		ent:Spawn()
		ent:Activate()
		local effectdata=EffectData()
		effectdata:SetEntity(ent)
		util.Effect("propspawn",effectdata)
		return ent
		end,
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})
AddEntity("Shotgun AI Turret", {
	ent = "ent_jack_turret_shotty",
	model = "models/Combine_turrets/Floor_turret.mdl",
	price = 8000,
	category = "AI turrets and equipment",
	max = 3,
	cmd = "/aishotty",
	spawn = function(ply, tr)
		local SpawnPos=tr.HitPos + tr.HitNormal*16
		local ent=ents.Create("ent_jack_turret_shotty")
		ent:SetPos(SpawnPos)
		ent:SetNetworkedEntity("Owenur",ply)
		ent.TargetingGroup={0,4,2,5,9}
		ent:Spawn()
		ent:Activate()
		local effectdata=EffectData()
		effectdata:SetEntity(ent)
		util.Effect("propspawn",effectdata)
		return ent
		end,
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})
AddEntity("SMG AI Turret", {
	ent = "ent_jack_turret_smg",
	model = "models/Combine_turrets/Floor_turret.mdl",
	price = 10000,
	category = "AI turrets and equipment",
	max = 3,
	cmd = "/aismg",
	spawn = function(ply, tr)
		local SpawnPos=tr.HitPos + tr.HitNormal*16
		local ent=ents.Create("ent_jack_turret_smg")
		ent:SetPos(SpawnPos)
		ent:SetNetworkedEntity("Owenur",ply)
		ent.TargetingGroup={0,4,2,5,9}
		ent:Spawn()
		ent:Activate()
		local effectdata=EffectData()
		effectdata:SetEntity(ent)
		util.Effect("propspawn",effectdata)
		return ent
		end,
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})
AddEntity("Rifle AI Turret", {
	ent = "ent_jack_turret_rifle",
	model = "models/Combine_turrets/Floor_turret.mdl",
	price = 13000,
	category = "AI turrets and equipment",
	max = 3,
	cmd = "/airifle",
	spawn = function(ply, tr)
		local SpawnPos=tr.HitPos + tr.HitNormal*16
		local ent=ents.Create("ent_jack_turret_rifle")
		ent:SetPos(SpawnPos)
		ent:SetNetworkedEntity("Owenur",ply)
		ent.TargetingGroup={0,4,2,5,9}
		ent:Spawn()
		ent:Activate()
		local effectdata=EffectData()
		effectdata:SetEntity(ent)
		util.Effect("propspawn",effectdata)
		return ent
		end,
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("Turret Repair Kit", {
	ent = "ent_jack_turretrepairkit",
	model = "models/props_junk/cardboard_box003a.mdl",
	price = 500,
	category = "AI turrets and equipment",
	max = 50000,
	cmd = "/repairkit",
	spawn = function(ply, tr)
		local SpawnPos=tr.HitPos + tr.HitNormal*16
		local ent=ents.Create("ent_jack_turretrepairkit")
		ent:SetPos(SpawnPos)
		ent:SetNetworkedEntity("Owenur",ply)
		ent:Spawn()
		ent:Activate()
		local effectdata=EffectData()
		effectdata:SetEntity(ent)
		util.Effect("propspawn",effectdata)
		return ent
	end,
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("Power Node", {
	ent = "ent_jack_powernode",
	model = "models/props_lab/powerbox02d.mdl",
	price = 1000,
	category = "AI turrets and equipment",
	max = 9999,
	cmd = "/ainode",
	spawn = function(ply, tr)
		local SpawnPos=tr.HitPos + tr.HitNormal*16
		local ent=ents.Create("ent_jack_powernode")
		ent:SetPos(SpawnPos)
		ent:SetNetworkedEntity("Owenur",ply)
		ent:Spawn()
		ent:Activate()
		ent:CPPISetOwner(ply)
	end,
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("Diesel", {
	ent = "ent_jack_aidfuel_diesel",
	model = "models/props_junk/metalgascan.mdl",
	price = 3000,
	category = "AI turrets and equipment",
	max = 9999,
	cmd = "/aidiesel",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("Generator", {
	ent = "ent_jack_generator",
	model = "models/props_outland/generator_static01a.mdl",
	price = 7000,
	category = "AI turrets and equipment",
	max = 2,
	cmd = "/aigenerator",
	spawn = function(ply, tr)
		local SpawnPos=tr.HitPos + tr.HitNormal*16
		local ent=ents.Create("ent_jack_generator")
		ent:SetPos(SpawnPos)
		ent:SetNetworkedEntity("Owenur",ply)
		ent:Spawn()
		ent:Activate()
		ent:CPPISetOwner(ply)
	end,
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("Tesla Turret", {
	ent = "ent_jack_teslasentry",
	model = "models/props_c17/substation_transformer01d.mdl",
	price = 15000,
	category = "AI turrets and equipment",
	max = 2,
	cmd = "/aitesla",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("Battery", {
	ent = "ent_jack_turretbattery",
	model = "models/Items/car_battery01.mdl",
	price = 1000,
	category = "AI turrets and equipment",
	max = 9999,
	cmd = "/aibat",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("9mm Ammo Box", {
	ent = "ent_jack_turretammobox_9mm",
	model = "models/Items/BoxSRounds.mdl",
	price = 300,
	category = "AI turrets and equipment",
	max = 9999,
	cmd = "/ai9mm",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("12Gauge Ammo Box", {
	ent = "ent_jack_turretammobox_shot",
	model = "models/Items/BoxSRounds.mdl",
	price = 400,
	category = "AI turrets and equipment",
	max = 9999,
	cmd = "/ai12",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})

AddEntity("5.56 Ammo Box", {
	ent = "ent_jack_turretammobox_556",
	model = "models/Items/BoxSRounds.mdl",
	price = 500,
	category = "AI turrets and equipment",
	max = 9999,
	cmd = "/ai556",
	allowed = {TEAM_ENGINEER, TEAM_MILITARYENGINEER}
})


DarkRP.createEntity("Box of Basic Ingredient", {
	ent = "kjulo_druglab",
	model = "models/props/de_nuke/NuclearContainerBoxClosed.mdl",
	price = 500,
	category = "Drugs",
	max = 1,
	cmd = "buynewdrugbox",
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("Stove", {
	ent = "kjulo_drugstove",
	model = "models/props_c17/furnitureStove001a.mdl",
	price = 600,
	category = "Drugs",
	max = 1,
	cmd = "buydrugstove",
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("Large Vial", {
	ent = "kjulo_drugvial",
	model = "models/props_c17/pottery05a.mdl",
	price = 700,
	category = "Drugs",
	max = 10,
	cmd = "buydrugvial",
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("Empty Package", {
	ent = "kjulo_drug_package",
	model = "models/props_lab/box01a.mdl",
	price = 100,
	category = "Drugs",
	max = 2,
	cmd = "buydrugpackage",
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("Carbonator", {
	ent = "kjulo_drugcarbon",
	model = "models/props_c17/TrapPropeller_Engine.mdl",
	price = 4000,
	category = "Drugs",
	max = 1,
	cmd = "buykjulo_drugcarbon",
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("Ventilator", {
	ent = "kjulo_drugvent",
	model = "models/props_c17/FurnitureBoiler001a.mdl",
	price = 2000,
	category = "Drugs",
	max = 1,
	cmd = "buykjulo_drugvent",
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("CH2", {
	ent = "kjulo_drug_compound_ch2",
	model = "models/props_junk/garbage_milkcarton001a.mdl",
	price = 49,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_ch2",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("3HMa", {
	ent = "kjulo_drug_compound_3hma",
	model = "models/props_junk/garbage_plasticbottle001a.mdl",
	price = 52,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_3hma",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("BrHe", {
	ent = "kjulo_drug_compound_brhe",
	model = "models/props_junk/garbage_plasticbottle002a.mdl",
	price = 45,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_brhe",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("OZn", {
	ent = "kjulo_drug_compound_ozn",
	model = "models/props_junk/garbage_glassbottle001a.mdl",
	price = 60,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_ozn",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("CsFr", {
	ent = "kjulo_drug_compound_csfr",
	model = "models/props_junk/metal_paintcan001a.mdl",
	price = 44,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_csfr",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("KCaLi", {
	ent = "kjulo_drug_compound_kcali",
	model = "models/props_junk/plasticbucket001a.mdl",
	price = 59,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_kcali",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("LiFr", {
	ent = "kjulo_drug_compound_lifr",
	model = "models/props_junk/propane_tank001a.mdl",
	price = 42,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_lifr",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("BrO", {
	ent = "kjulo_drug_compound_bro",
	model = "models/props_junk/PropaneCanister001a.mdl",
	price = 53,
	category = "Drugs",
	max = 3,
	cmd = "buykjulo_drug_compound_bro",
	buttonColor = Color(200, 100, 100, 255),
	allowed = {TEAM_GANGCOOK},
})

DarkRP.createEntity("How to Cook Drugs", {
	ent = "kjulo_drugguide",
	model = "models/props_junk/garbage_newspaper001a.mdl",
	price = 5,
	category = "Drugs",
	max = 1,
	cmd = "buykjulo_drugguide",
	buttonColor = Color(255, 255, 255, 255),
	allowed = {TEAM_GANGCOOK},
})

// Drug dealer

DarkRP.createEntity("Heroin", {
	ent = "durgz_heroine",
	model = "models/katharsmodels/syringe_out/syringe_out.mdl",
	price = 1000,
	category = "Drugs",
	max = 999,
	cmd = "buydheroine",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("Weed", {
	ent = "durgz_weed",
	model = "models/katharsmodels/contraband/zak_wiet/zak_wiet.mdl",
	price = 150,
	category = "Drugs",
	max = 999,
	cmd = "buydweed",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("LSD", {
	ent = "durgz_lsd",
	model = "models/katharsmodels/contraband/jointjes/jointjes.mdl",
	price = 100,
	category = "Drugs",
	max = 999,
	cmd = "buydlsd",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("PCP", {
	ent = "durgz_pcp",
	model = "models/jaanus/aspbtl.mdl",
	price = 100,
	category = "Drugs",
	max = 999,
	cmd = "buydpcp",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("Cocaine", {
	ent = "durgz_cocaine",
	model = "models/cocn.mdl",
	price = 250,
	category = "Drugs",
	max = 999,
	cmd = "buydcock",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("Meth", {
	ent = "durgz_meth",
	model = "models/katharsmodels/contraband/metasync/blue_sky.mdl",
	price = 50,
	category = "Drugs",
	max = 999,
	cmd = "buydmeth",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("Mushroom", {
	ent = "durgz_mushroom",
	model = "models/weapons/w_bugbait.mdl",
	price = 25,
	category = "Drugs",
	max = 999,
	cmd = "buydshroom",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("Joint", {
	ent = "weapon_weed",
	model = "models/rottweiler/drugs/joint.mdl",
	price = 200,
	category = "Drugs",
	max = 999,
	cmd = "buydjoint",
	allowed = {TEAM_DRUG},
})

DarkRP.createEntity("Bong", {
	ent = "weapon_bong",
	model = "models/striker/nicebongstriker.mdl",
	price = 500,
	category = "Drugs",
	max = 999,
	cmd = "buydbong",
	allowed = {TEAM_DRUG},
})

AddEntity("LockPick", {
	ent = "ent_lockpick",
	model = "models/props_c17/TrapPropeller_Lever.mdl",
	price = 100,
	category = "Tools",
	max = 9999,
	cmd = "/lockpick",
	allowed = {TEAM_THIEF, TEAM_PROTHIEF, TEAM_MERCENARY},
})

AddEntity("Impact Vest", {
	ent = "ent_jack_bodyarmor_vest_im",
	model = "models/combine_vests/bluevest.mdl",
	price = 2000,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/ivest",
	allowed = TEAM_ARMOR
})

AddEntity("Stab Vest", {
	ent = "ent_jack_bodyarmor_vest_sv",
	model = "models/combine_vests/bluevest.mdl",
	price = 2500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/svest",
	allowed = TEAM_ARMOR
})

AddEntity("Ballistic Vest", {
	ent = "ent_jack_bodyarmor_vest_bn",
	model = "models/combine_vests/bluevest.mdl",
	price = 2500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/bnvest",
	allowed = TEAM_ARMOR
})

AddEntity("Soft Kevlar Vest", {
	ent = "ent_jack_bodyarmor_vest_sk",
	model = "models/combine_vests/bluevest.mdl",
	price = 3000,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/sftvest",
	allowed = TEAM_ARMOR
})

AddEntity("Kevlar Vest", {
	ent = "ent_jack_bodyarmor_vest_ks",
	model = "models/combine_vests/bluevest.mdl",
	price = 3500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/kvlvest",
	allowed = TEAM_ARMOR
})

AddEntity("Impact Helmet", {
	ent = "ent_jack_bodyarmor_helm_im",
	model = "models/dean/gtaiv/helmet.mdl",
	price = 1000,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/ihelm",
	allowed = TEAM_ARMOR
})

AddEntity("Riot Helmet", {
	ent = "ent_jack_bodyarmor_helm_ri",
	model = "models/barney_helmet.mdl",
	price = 1500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/rhelm",
	allowed = TEAM_ARMOR
})

AddEntity("Steel Helmet", {
	ent = "ent_jack_bodyarmor_helm_st",
	model = "models/player/items/scout/scout_bils.mdl",
	price = 1500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/shelm",
	allowed = TEAM_ARMOR
})

AddEntity("Polyethylene Helmet", {
	ent = "ent_jack_bodyarmor_helm_pe",
	model = "models/barney_helmet.mdl",
	price = 2000,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/phelm",
	allowed = TEAM_ARMOR
})

AddEntity("Kevlar Helmet", {
	ent = "ent_jack_bodyarmor_helm_kr",
	model = "models/barney_helmet.mdl",
	price = 2500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/khelm",
	allowed = TEAM_ARMOR
})

AddEntity("HAZMAT Suit", {
	ent = "ent_jack_suit_hazmat",
	model = "models/props_junk/cardboard_box003a.mdl",
	price = 2500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/hazm",
	allowed = TEAM_ARMOR
})

AddEntity("Faraday Suit", {
	ent = "ent_jack_suit_fire",
	model = "models/props_junk/cardboard_box003a.mdl",
	price = 2500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/faraday",
	allowed = TEAM_ARMOR
})

AddEntity("Green Backpack", {
	ent = "ent_jack_bodyarmor_util_backpack2",
	model = "models/props_junk/cardboard_box003a.mdl",
	price = 2500,
	category = "Armor and Helmets",
	max = 9999,
	cmd = "/greenbackpack",
	allowed = TEAM_ARMOR
})

--blackmarket dealer

AddEntity("Keypad Cracker", {
	ent = "weapon_sh_keypadcracker_deploy",
	model = "models/weapons/w_c4.mdl",
	price = 2000,
	category = "Illegal",
	max = 9999,
	cmd = "/claymore",
	allowed = TEAM_BMDEALER
})

AddEntity("Small Mine", {
	ent = "ent_jack_landmine_sml",
	model = "models/weapons/w_clayjore.mdl",
	price = 1000,
	category = "Illegal",
	max = 9999,
	cmd = "/smallmine",
	allowed = TEAM_BMDEALER
})
AddEntity("Medium Mine", {
	ent = "ent_jack_landmine_med",
	model = "models/weapons/w_clayjore.mdl",
	price = 3000,
	category = "Illegal",
	max = 9999,
	cmd = "/mediummine",
	allowed = TEAM_BMDEALER
})

AddEntity("Fougasse Kit", {
	ent = "ent_jack_fougassekit",
	model = "models/weapons/w_clayjore.mdl",
	price = 1000,
	category = "Illegal",
	max = 9999,
	cmd = "/fougass",
	allowed = TEAM_BMDEALER
})

AddEntity("Proxy mine", {
	ent = "ent_jack_boundingmine",
	model = "models/weapons/w_clayjore.mdl",
	price = 1000,
	category = "Illegal",
	max = 9999,
	cmd = "/proxy",
	allowed = TEAM_BMDEALER
})

AddEntity("Money Pot", {
	ent = "darkrp_moneypot",
	model = "models/props_lab/powerbox02b.mdl",
	price = 500,
	category = "Tools",
	max = 2,
	cmd = "/buymoneypot",
})