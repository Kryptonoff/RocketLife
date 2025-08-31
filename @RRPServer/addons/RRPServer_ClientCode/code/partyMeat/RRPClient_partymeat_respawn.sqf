/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
    player addWeapon "srifle_DMR_02_snipeX_zerg_hunter";
*/
private ["_pos"];

LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
LIFE_PPE_DAMAGE05 ppEffectCommit 0;
LIFE_PPE_DAMAGE05 = -1;

[1, "Black", 1, 1] spawn BIS_fnc_fadeEffect;


removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
player forceAddUniform "U_I_Protagonist_VR";



_pos = [getArray(missionConfigFile >> "party_meat" >> "startPos"), 5, 100, 0, 0, 0.7, 0, [], [getPos player, getPos player]] call BIS_fnc_findSafePos;
player setPos _pos;
true call RRPClient_partyMeat_hudUpdate;
if (!(isNull (uiNamespace getVariable ["Death_Screen_V2",displayNull]))) then {
    [player] spawn RRPClient_system_revived;
    player switchmove "";
};

[] spawn {
    partMeatRespawn = true;
    for "_i" from 1 to 3 do {
        [(str _i), 3, 1, [1,0,0,1], true] spawn BIS_fnc_WLSmoothText;
        uiSleep 1;
    };
    if (player getVariable ["RRPVariablePartyMeatActive",false]) then {
        call RRPClient_partymeat_generateEquipment;
    };
    player switchmove "";
    uiSleep 0.5;
    player setVariable ["RRPVariablePartyMeatRespawn",nil,true];
    partMeatRespawn = nil;
};
