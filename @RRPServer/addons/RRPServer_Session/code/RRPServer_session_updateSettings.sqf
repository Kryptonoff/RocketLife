/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND

	in type send only params in RRPClientSettingsArray
*/

format ["Sessions: UpdateSettings: Parameters - %1 #1111",_this] call RRPServer_util_debugConsole;

params [
	["_type",""],
	["_value",0,[[],0,false,""]],
	["_uid",""]
];

try
{
	if (_type isEqualTo "") throw "Тип пуст";
	if (_uid isEqualTo "") throw "UID пуст";
	if !(_type in RRPClientSettingsArray) throw format ["%1 нет в списке массива настроек",_type];
	if (_value isEqualType false) then {_value = [_value] call RRPServer_util_tinyIntConverter};
	format ["updatePlayerSettings:%1:%2:%3",_type,_value,_uid] call RRPServer_DB_fireAndForget;
}catch{
	format ["RRPServer_Session: Update settings: Error: %1",_exception] call RRPServer_util_log;
	format ["RRPServer_Session: Update settings: Error: %1 #1001",_exception] call RRPServer_util_debugConsole;

};
true
