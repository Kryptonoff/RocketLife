/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

waitingProgressPartyMeat = false;
closeDialog 0;
params [
    ["_pid", "", [""]],
    ["_lvl", 0, [0]],
    ["_kills", 0, [0]],
    ["_deaths", 0, [0]],
    ["_active", false, [false]],
    ["_deposit", 0, [0]]
];
try {
    if !(_pid isEqualTo getPlayerUID player) throw "Ошибка при установке статистики!";
    player setVariable ["RRPVariablePartyMeatActive", true,true];
    player setVariable ["RRPVariablePartyMeatLvl",_lvl];
    player setVariable ["RRPVariablePartyMeatKills",_kills];
    player setVariable ["RRPVariablePartyMeatDeaths",_deaths];
    player setVariable ["RRPVariablePartyMeatDeposit",_deposit];
    player enableStamina  false;

    missionNamespace setVariable ["partyMeatOnline", missionNamespace getVariable ["partyMeatOnline",0], true];
    [format["%1 начал игру с депозитом %2",(getPlayerUID player), _deposit],"party_meat_log"] remoteExecCall ["RRPServer_system_logIt",2];
    call RRPClient_partymeat_respawn;
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
