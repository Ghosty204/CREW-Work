--[[---------------------------------------------------------------------------
Group chats
---------------------------------------------------------------------------
Team chat for when you have a certain job.
e.g. with the default police group chat, police officers, chiefs and mayors can
talk to one another through /g or team chat.

HOW TO MAKE A GROUP CHAT:
Simple method:
GAMEMODE:AddGroupChat(List of team variables separated by comma)

Advanced method:
GAMEMODE:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This is for people who know how to script Lua.

---------------------------------------------------------------------------]]
-- Example: GAMEMODE:AddGroupChat(TEAM_MOB, TEAM_GANG)
-- Example: GAMEMODE:AddGroupChat(function(ply) return ply:isCP() end)
GAMEMODE:AddGroupChat(TEAM_POLICE, TEAM_CHIEF, TEAM_SHERIFF, TEAM_MAYOR, TEAM_SSH, TEAM_SS, TEAM_MILITARY, TEAM_MILITARYJUG, TEAM_MILITARYMEDIC, TEAM_MILITARYENGINEER, TEAM_MILITARYSNIPER, TEAM_MILITARYCOMMANDER, TEAM_MILITARYPILOT, TEAM_APLHALEADER, TEAM_ALPHABREACHER, TEAM_ALPHAHUNTER, TEAM_ALPHATECH)
GAMEMODE:AddGroupChat(TEAM_MOB, TEAM_GANG, TEAM_GANGSNIPER, TEAM_GANGHEAVY, TEAM_GANGMEDIC, TEAM_GANGCOOK, TEAM_GANGPYRO, TEAM_GANGSCOUT, TEAM_GANGPOTW, TEAM_GANGDOTW, TEAM_GANGBOMB, TEAM_GANGJUGNAUT, TEAM_GANGLORD)