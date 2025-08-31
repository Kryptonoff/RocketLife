/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/

params [
  ["_slave",objNull,[objNull]],
  ["_rate",0,[0]]
];

if (isNull _slave) exitWith {life_action_inUse = false};

if (call RRPClient_groups_inGroup) then {
  _tax = (RRPClientGroupInfo get "taxes") get "slave";
  if (_tax > 0) then {
    _tax = _rate * (_tax / 100);
    _rate = _rate - _tax;
    [player getVariable ["GroupId",-1],"add",_tax] remoteExecCall ["RRPServer_groups_moneyChange",2];
  };
};

[player,"cash","add",_rate,[format["%1 (%2) продал %3 (%4) в рабство за: %5",player call getFullName,getPlayerUID player,_slave call getFullName,getPlayerUID _slave,_rate],"SlaveLog"]] remoteExecCall ["RRPServer_system_moneyChange",2];
["jango",1] call RRPClient_ach_gateway;

[
  "Рабство",
  (format ["Вы заработали $%1 продав %2 в рабство",[_rate] call RRPClient_util_numberText,_slave call getFullName])
] call toastSuccess;

life_action_inUse = false;
RRPClientWaitingSlaveResponse = false;
