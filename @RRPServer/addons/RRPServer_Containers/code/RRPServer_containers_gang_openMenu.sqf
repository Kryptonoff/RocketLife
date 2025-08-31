/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_sessionId","_box"];

try
{
	_player = _sessionId call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вы существуете?";
	if (isNull _box) throw "Ящик не определен";
	if !(owner _player isEqualTo remoteExecutedOwner) throw "Чего чего чего?";
	if ([_box,_player] call RRPClient_system_isTrunkInUse) throw "Хранилище уже используется.";
	
	if (isNull _box OR (typeOf _box != getText(missionConfigFile >> "LifeCfgSettings" >> "life_trunkClass"))) throw "Ящик не определен";
	if (_box getVariable ["locked",false]) throw "Закрыто";
	_db = _box getVariable ["VarDB","Error"];
	if (_db isEqualTo "Error") throw (format ["Ящик не определен в БД, обратитесь к администратору. Переменная объекта %1",vehicleVarName _box]);
	_box setVariable ["trunk_inUseBy",getPlayerUID _player,true];
	["response",_box] remoteExecCall ["RRPClient_containers_gang_openMenu",remoteExecutedOwner];
}catch{
	["error",objNull,_exception] remoteExecCall ["RRPClient_containers_gang_openMenu",remoteExecutedOwner];
};
true
