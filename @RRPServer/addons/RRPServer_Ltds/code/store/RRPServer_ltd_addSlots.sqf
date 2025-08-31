/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
params ["_store","_player"];
private _curGds = 	_store getVariable ["ltdMaxGds",false];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;

try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";

	_newGds = _curGds + 5;
	_store setVariable ["ltdMaxGds",_newGds,true];
	["SuccessTitleOnly", ["Вы добавили магазину 5 слотов"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	format ["updateAddSlotsStore:%1",_id] call RRPServer_DB_fireAndForget;
	[_player,"point","take",STR(660)] call RRPServer_system_moneyChange;
	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"ltd",660,format ["Добавил 5 слотов в магазине %1 (ID %2)",_store getVariable ["ltdName",""],_id]] call RRPServer_DB_lk_fireAndForget;
	[] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
