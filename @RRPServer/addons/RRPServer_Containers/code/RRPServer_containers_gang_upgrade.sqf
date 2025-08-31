/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params [
	"_sessionId",
	"_box"
];

try{
	_player = _sessionId call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Чего-чего-чего?";
	if (isNull _box) throw "Ящика не существует!";
	_rc = _player getVariable ["RRPPoint",0];
	_cost = getNumber(getMissionConfig "ptw" >> "costUpgradeGroupBox");
	if (_rc < _cost) throw format ["Недостаточно RC для покупки, стоимость улучшения составляет %1 RC",_cost];
	_slots = _box getVariable ["slots",0];
	_varDB = _box getVariable ["VarDB",""];
	if (_varDB isEqualTo "") throw "Переменная объекта не определена";
	_slots = _slots + 1;
	_box setVariable ["slots",_slots,true];
	[_player,"point","take",_cost] call RRPServer_system_moneyChange;
	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"upgradeSlotContainer",_cost,format ["Добавлен 1 слот к ящику %1",_varDB]] call RRPServer_DB_lk_fireAndForget;
	format ["upgradeContainerSlots:%1:%2",_slots,_varDB] call RRPServer_DB_fireAndForget;
	["response"] remoteExecCall ["RRPClient_containers_gang_upgrade",remoteExecutedOwner];

}catch{
	format ["ContainersUpgrade: %1 #1001",_exception] call RRPServer_util_debugConsole;
	["error",_exception] remoteExecCall ["RRPClient_containers_gang_upgrade",remoteExecutedOwner];
};
true
