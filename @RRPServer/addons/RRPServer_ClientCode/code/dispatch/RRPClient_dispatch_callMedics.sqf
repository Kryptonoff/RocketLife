/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
private _toNum = getNumber (missionConfigFile >> "Max_Settings_Phone" >> "num_med");

private _data = [(player call getFullName),(getpos player),"",servertime,"",player,1];
RRPClient_waiting_med_calls pushBack _data;
publicVariable "RRPClient_waiting_med_calls";
player setVariable ["call_status",0,true];

{
   if ('_x select 1' isEqualTo _toNum) exitWith {
      _toNum = _x select 0;
   };
} foreach RRPClient_contact;

player setVariable ["calling_number",_toNum];
[1,"Поступил срочный вызов! Дайте ответ!"] remoteExecCall ["RRPClient_system_broadcast",allPlayers select {_x call getSide == "med"}];
["Ваш вызов зафиксирован, ожидайте ответа от сотрудника EMS!"] call hints;

uiSleep 30;
if !((player getVariable "call_status") isEqualTo 0) exitWith {};
["Ваш вызов зафиксирован, ожидайте ответа от сотрудника EMS!"] call hints;

uiSleep 30;
if ((player getVariable "call_status") isEqualTo 0) then {
    player setVariable ["calling_number",0];
    [format ["Нет ответа от %1, попробуйте связаться с ним!",_toNum]] call hints;

    RRPClient_waiting_med_calls deleteat (RRPClient_waiting_med_calls find _data);
    publicVariable "RRPClient_waiting_med_calls";
};
