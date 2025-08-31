/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

params [["_trunk",objNull,[objNull,""]]];
try {
    if (life_action_inUse) throw "Вы уже выполняете действие";
    life_action_inUse = true;

    private _complete = ["Открываем ящик",{((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") AND life_action_inUse AND (alive player)},true,6 * RRPClientBuffs_CoefFarmTime,false,true,{}] call RRPClient_system_newProgressBar;
    if (isNil "_complete") throw "";
    if !(_complete) throw "";
    private _pos = getPosWorld diving_point;
    deleteVehicle diving_point;
    ["items",_pos] call RRPClient_diving_generateLoot;
    life_action_inUse = false;
    diving_point = nil;
} catch {
    life_action_inUse = false
};
