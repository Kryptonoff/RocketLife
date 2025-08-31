
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {"vehicleNull" call RRPServer_util_log;};
private _oldInfos = param [1,[],[[]]];
if (count _oldInfos isEqualTo 0) exitWith {"count _oldInfos" call RRPServer_util_log;};
private _player = param [2,objNull,[objNull]];
private _toPlayer = param [3,objNull,[objNull]];
private _price = param [4,0,[0]];
private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {"_dbInfo" call RRPServer_util_log;};
private _uid = _dbInfo select 0;
private _plate = _dbInfo select 1;
_id = _vehicle getVariable ["RRPDatabaseID",-1];
format ["swapVehicleOwner:%1:%2",_uid,_id] call RRPServer_DB_fireAndForget;

private _log = format ["PLAYER %1 (%2) swaped vehicle %3 for %4 to %5 (%6)",name _player,getPlayerUID _player,typeOf _vehicle,_price,name _toPlayer,getPlayerUID _toPlayer];
["SwapVehicleLog",_log] call FNC_A3_CUSTOMLOG;
["traderCar",1] remoteExecCall ["RRPClient_ach_gateway",_player];
private _discord = format ["%1 (%2) передал %3 (%4) за %5 игроку %6 (%7), Номерной знак: %8",(name _player),(getPlayerUID _player),(getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")),typeOf _vehicle,([_price] call RRPClient_util_numberText),name _toPlayer,getPlayerUID _toPlayer,_plate];
['Vehicle swap!','swapVehicle','FF0000',_discord] call RRPServer_discord_sendMessage;
[_player] call RRPServer_garage_refreshCountGarage;
[_toPlayer] call RRPServer_garage_refreshCountGarage;