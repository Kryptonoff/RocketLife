/*
    Filename:   RRPClient_system_freezePlayer.sqf
    Project:    Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_admin"];
_admin =  param [0,ObjNull,[ObjNull]];

if(life_frozen) then {
    [1,format["Вы разморозили %1",GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",_admin];
    disableUserInput false;
    life_frozen = false;
} else {
    [1,format["Вы заморозили %1",GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",_admin];
    disableUserInput true;
    life_frozen = true;
};