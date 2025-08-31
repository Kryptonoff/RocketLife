private ["_unit","_bad","_id","_ret"];
_playeruid = param [0,"",[""]];
_time = param [1,0,[0]];
if (_playeruid == "") exitWith {};
format ["updateJailTime:%1:%2", _time,_playeruid] call RRPServer_DB_fireAndForget;