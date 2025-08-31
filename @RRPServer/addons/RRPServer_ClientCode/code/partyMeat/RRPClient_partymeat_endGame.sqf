/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

[format["%1 покинул игру с депозитом %2",(getPlayerUID player), (player getVariable ["RRPVariablePartyMeatDeposit",0])],"party_meat_log"] remoteExecCall ["RRPServer_system_logIt",2];
[[player,"atm","add",player getVariable ["RRPVariablePartyMeatDeposit",0]],"system_moneyChange"] call RRPClient_system_hcExec;
player setVariable ["RRPVariablePartyMeatDeposit",nil, true];

[
    player getVariable ["RRPVariablePartyMeatKills",0],
    player getVariable ["RRPVariablePartyMeatDeaths",0],
    player getVariable ["RRPVariablePartyMeatLvl",0],
    getPlayerUID player
] remoteExecCall ["RRPServer_partyMeat_gameFinish"];


player setVariable ["RRPVariablePartyMeatActive", nil, true];
player setVariable ["RRPVariablePartyMeatLvl",nil];
player setVariable ["RRPVariablePartyMeatKills",nil];
player setVariable ["RRPVariablePartyMeatDeaths",nil];
RRPClientPartyRespawn = nil;


false call RRPClient_partyMeat_hudUpdate;
player remoteExecCall ["RRPServer_system_loadPlayerLoot",2];
[player] spawn RRPClient_system_revived;
player switchmove "";
player setPos (getArray(missionConfigFile >> "party_meat" >> "finishPos"));
player enableStamina  true;
[] spawn {
    uiSleep 4;
    player setVariable ["RRPVariablePartyMeatRespawn",nil,true];
}
