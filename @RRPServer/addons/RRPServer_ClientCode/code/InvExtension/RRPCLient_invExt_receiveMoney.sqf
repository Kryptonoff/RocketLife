/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
params [
  ["_unit",Objnull,[Objnull]],
  ["_val","",[""]],
  ["_from",Objnull,[Objnull]]
];

if (isNull _unit or isNull _from or _val isEqualTo "") exitWith {};
if !(player isEqualTo _unit) exitWith {};
if !([_val] call RRPClient_system_isnumber) exitWith {};
if (_unit isEqualTo _from) exitWith {};

["SuccessTitleAndText", ["+ деньги", format["%1 передал вам $%2",_from call getNickName,[(parseNumber _val)] call RRPClient_util_numberText]]] call SmartClient_gui_toaster_addTemplateToast;
[player,"cash","add",_val,[format ["Получил деньги: %4 (%5) ($%3) от %1 (%2)",name _from,getPlayerUID _from,_val,name _unit,getPlayerUID _unit],"TransferLog"]] remoteExecCall ["RRPServer_system_moneyChange",2];
if !(isNull(findDisplay 602)) then {call RRPClient_invExt_updateStatus};
