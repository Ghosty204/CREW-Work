--[[---------------------------------------------------------------------------
DarkRP custom shipments and guns
---------------------------------------------------------------------------

This file contains your custom shipments and guns.
This file should also contain shipments and guns from DarkRP that you edited.

Note: If you want to edit a default DarkRP shipment, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the shipment to this file and edit it.

The default shipments and guns can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomShipmentFields


Add shipments and guns under the following line:
---------------------------------------------------------------------------]]
// #NoSimplerr#

// Arms Dealer

--Pistols

DarkRP.createShipment("P220", {
	model = "models/weapons/w_pist_p228.mdl",
	entity = "cw_p220",
	price = 8000,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("P99", {
	model = "models/weapons/w_pist_p228.mdl",
	entity = "cw_p99",
	price = 9600,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Five-Seven", {
	model = "models/weapons/w_pist_fiveseven.mdl",
	entity = "cw_fiveseven",
	price = 8000,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("PM | Makarov", {
	model = "models/cw2/pistols/w_makarov.mdl",
	entity = "cw_makarov",
	price = 9600,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("M1911", {
	model = "models/weapons/cw_pist_m1911.mdl",
	entity = "cw_m1911",
	price = 10000,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Glock 18", {
	model = "models/weapons/cw_pist_m1911.mdl",
	entity = "heretic_cw2_glock",
	price = 10800,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("MAC-11", {
	model = "models/weapons/w_cst_mac11.mdl",
	entity = "cw_mac11",
	price = 24000,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("MR96 revolver", {
	model = "models/weapons/w_357.mdl",
	entity = "cw_mr96",
	price = 14000,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Raging Bull", {
	model = "models/weapons/raging/w_pist_raging.mdl",
	entity = "cw_ragingbull",
	price = 16000,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Desert Eagle .50", {
	model = "models/weapons/w_pist_deagle.mdl",
	entity = "cw_deagle",
	price = 12800,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Taurus public defender", {
	model = "models/weapons/raging/w_pist_raging.mdl",
	entity = "khr_410jury",
	price = 14400,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("CZ-52", {
	model = "models/khrcw2/v_khri_cz52.mdl",
	entity = "khr_cz52",
	price = 13600,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Ruger MK3", {
	model = "models/khrcw2/v_khri_rugermark.mdl",
	entity = "khr_rugermk3",
	price = 9200,
	category = "Pistol & Heavy Pistols",
	amount = 10,
	allowed = {TEAM_GUN}
})

--Shotguns

DarkRP.createShipment("Serbu Shorty", {
	model = "models/weapons/cw2_super_shorty.mdl",
	entity = "cw_shorty",
	category = "Shotguns",
	price = 30000,
	amount = 10,
	allowed = {TEAM_GUN}
})
DarkRP.createShipment("MP 153", {
	model = "models/khrcw2/v_khri_bmp153.mdl",
	entity = "khr_mp153",
	category = "Shotguns",
	price = 102000,
	amount = 10,
	allowed = {TEAM_GUN}
})
DarkRP.createShipment("M3 Super 90", {
	model = "models/weapons/w_cstm_m3super90.mdl",
	entity = "cw_m3super90",
	price = 36000,
	category = "Shotguns",
	amount = 10,
	allowed = {TEAM_GUN}
})
DarkRP.createShipment("Neostead 2000", {
	model = "models/khrcw2/v_shot_neostead2.mdl",
	entity = "khr_ns2000",
	price = 38000,
	category = "Shotguns",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Saiga 12g", {
	model = "models/weapons/w_cw20_saiga2.mdl",
	entity = "heretic_cw2_saiga12k",
	price = 126000,
	category = "Shotguns",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("KSG-12", {
	model = "models/weapons/w_shot_ksg12.mdl",
	entity = "cw_ksg12",
	price = 56000,
	category = "Shotguns",
	amount = 10,
	allowed = {TEAM_GUN}
})

--SMGs

DarkRP.createShipment("VZ61 Scorpion", {
	model = "models/weapons/krycek/w_vz61_m9k.mdl",
	entity = "cw_vz61_kry",
	category = "SMGs",
	price = 30000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("MAC11", {
	model = "models/weapons/w_cst_mac11.mdl",
	entity = "cw_mac11",
	category = "SMGs",
	price = 52000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("MP5", {
	model = "models/weapons/w_smg_mp5.mdl",
	entity = "cw_mp5",
	category = "SMGs",
	price = 36000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("MP40", {
	model = "models/weapons/w_smg_mp5.mdl",
	entity = "khr_mp40",
	category = "SMGs",
	price = 34000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("UMP 45", {
	model = "models/weapons/w_smg_ump45.mdl",
	entity = "cw_ump45",
	category = "SMGs",
	price = 30000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("PP19 Vityaz", {
	model = "models/weapons/w_smg_ppv.mdl",
	entity = "cw_pp19vityaz",
	category = "SMGs",
	price = 50000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("FMG-9", {
	model = "models/weapons/w_smg_tmp.mdl",
	entity = "khr_fmg9",
	category = "SMGs",
	price = 60000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("FN-90", {
	model = "models/weapons/w_smg_p90.mdl",
	entity = "khr_p90",
	category = "SMGs",
	price = 62000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("SR-2 Veresek", {
	model = "models/weapons/w_smg_mac10.mdl",
	entity = "khr_veresk",
	category = "SMGs",
	price = 64000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("KRISS Vector", {
	model = "models/weapons/w_smg_mp5.mdl",
	entity = "khr_vector",
	category = "SMGs",
	price = 112000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Sterling L2A3", {
	model = "models/weapons/w_smg_mp5.mdl",
	entity = "khr_l2a3",
	category = "SMGs",
	price = 36000,
	amount = 10,
	allowed = {TEAM_GUN}
})

--Assault Rifles

DarkRP.createShipment("L85A2", {
	model = "models/weapons/w_rif_ak47.mdl",
	entity = "cw_l85a2",
	price = 84000,
	category = "Rifles",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("G36C", {
	model = "models/weapons/cw20_g36c.mdl",
	entity = "cw_g36c",
	price = 68000,
	category = "Rifles",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("AR15", {
	model = "models/weapons/w_rif_m4a1.mdl",
	entity = "cw_ar15",
	price = 86000,
	category = "Rifles",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("AK-74", {
	model = "models/weapons/w_rif_ak47.mdl",
	entity = "cw_ak74",
	category = "Rifles",
	price = 68000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("AK-103", {
	model = "models/weapons/w_rif_ak47.mdl",
	entity = "khr_ak103",
	category = "Rifles",
	price = 72000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("SCAR-H", {
	model = "models/cw2/rifles/w_scarh.mdl",
	entity = "cw_scarh",
	price = 80000,
	category = "Rifles",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("G3A3", {
	model = "models/weapons/w_snip_g3sg1.mdl",
	entity = "cw_g3a3",
	price = 68000,
	category = "Rifles",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("EBR M14", {
	model = "models/weapons/w_cstm_m14.mdl",
	entity = "cw_m14",
	price = 102000,
	category = "Rifles",
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("VSS Vintorez", {
	model = "models/cw2/rifles/w_vss.mdl",
	entity = "cw_vss",
	price = 60000,
	category = "Rifles",
	amount = 10,
	allowed = {TEAM_GUN}
})

--Sniper Rifles
DarkRP.createShipment("L115", {
	model = "models/weapons/w_cstm_l96.mdl",
	entity = "cw_l115",
	category = "Sniper Rifles",
	price = 84000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("SVD", {
	model = "models/weapons/drag/w_snip_dragn.mdl",
	entity = "cw_dragnov",
	category = "Sniper Rifles",
	price = 108000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("M40A5", {
	model = "models/weapons/w_snip_m40a5.mdl",
	entity = "cw_m40a5",
	category = "Sniper Rifles",
	price = 82000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Orsis T-5000", {
	model = "models/weapons/w_cstm_l96.mdl",
	entity = "khr_t5000",
	category = "Sniper Rifles",
	price = 80000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("M82A3", {
	model = "models/weapons/w_snip_m82a3.mdl",
	entity = "cw_m82a3",
	category = "Sniper Rifles",
	price = 114000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("M95", {
    model = "models/khrcw2/w_snip_m95.mdl",
    entity = "khr_m95",
    category = "Sniper Rifles",
    price = 88000,
    amount = 10,
    allowed = {TEAM_GUN}
})

DarkRP.createShipment("SR-338", {
	model = "models/khrcw2/v_snip_sr338.mdl",
	entity = "khr_sr338",
	category = "Sniper Rifles",
	price = 125000,
	amount = 10,
	allowed = {TEAM_GUN}
})

--LMGs

DarkRP.createShipment("M249", {
	model = "models/weapons/w_mach_m249para.mdl",
	entity = "cw_m249_official",
	category = "LMGs",
	price = 190000,
	amount = 10,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("M240B", {
	model = "models/kali/weapons/fn mag.mdl",
	entity = "cw_240b",
	category = "LMGs",
	price = 160000,
	amount = 10,
	allowed = {TEAM_GUN}
})

// Black Market Dealer
DarkRP.createShipment("Frag Grenades", {
	model = "models/Items/grenadeAmmo.mdl",
	entity = "cw_frag_grenade",
	price = 12500,
	category = "Illegal",
	amount = 5,
	allowed = {TEAM_BMDEALER}
})

//DarkRP.createShipment("Hitman Silenced Rifle", {
//	model = "models/weapons/w_snip_g3sg1.mdl",
//	entity = "ls_sniper",
//	price = 82000,
//	category = "Illegal",
//	amount = 5,
//	allowed = {TEAM_BMDEALER}
//})

DarkRP.createShipment("SLAM", {
	model = "models/weapons/w_slam.mdl",
	entity = "weapon_slam",
	price = 17500,
	category = "Illegal",
	amount = 5,
	allowed = {TEAM_BMDEALER}
})

DarkRP.createShipment("Kidnapping restraints", {
	model = "models/props_c17/SuitCase001a.mdl",
	entity = "weapon_cuff_rope",
	price = 8000,
	category = "Illegal",
	amount = 1,
	allowed = {TEAM_BMDEALER}
})


// Engineer

DarkRP.createShipment("Chainsaw", {
	model = "models/weapons/doom3/w_chainsaw.mdl",
	entity = "weapon_doom3_chainsaw",
	price = 6000,
	category = "Melee",
	amount = 1,
	allowed = {TEAM_ENGINEER}
})

DarkRP.createShipment("Tesla Nade", {
	model = "models/weapons/w_eq_teslabang.mdl",
	entity = "cw_teslagrenade",
	price = 25000,
	category = "Explosives",
	amount = 10,
	allowed = {TEAM_ENGINEER}
})

DarkRP.createShipment("Rusty Crossbow", {
	model = "models/weapons/w_crossbow.mdl",
	entity = "weapon_crossbow",
	category = "Sniper Rifles",
	price = 80000,
	amount = 1,
	allowed = {TEAM_ENGINEER}
})

DarkRP.createShipment("Rusty Crossbow Ammo", {
	model = "models/items/crossbowrounds.mdl",
	entity = "item_ammo_crossbow",
	category = "Sniper Rifles",
	price = 2000,
	amount = 10,
	allowed = {TEAM_ENGINEER}
})

DarkRP.createShipment("Stunstick", {
	model = "models/weapons/w_stunbaton.mdl",
	entity = "weapon_stunstick",
	category = "Melee",
	price = 1500,
	amount = 1,
	allowed = {TEAM_ENGINEER}
})

DarkRP.createShipment("Crowbar", {
	model = "models/weapons/w_crowbar.mdl",
	entity = "weapon_crowbar",
	category = "Melee",
	price = 1000,
	amount = 1,
	allowed = {TEAM_ENGINEER}
})
