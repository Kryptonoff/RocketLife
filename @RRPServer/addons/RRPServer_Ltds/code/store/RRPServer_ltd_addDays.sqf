/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
params ["_store","_player"];
private _curPayed = 	_store getVariable ["ltdPayedUntil",false];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;

try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";

	_date = (parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[%2,0,0,0]",_curPayed,30]) select 1);
	format ["Date: %1",_date] call RRPServer_util_log;
	_store setVariable ["ltdPayedUntil",_date,true];	
	["SuccessTitleOnly", ["Вы продлили магазину аренду на 30 дней"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	format ["updateAddDaysStore:%1",_id] call RRPServer_DB_fireAndForget;
	[_player,"point","take",STR(6600)] call RRPServer_system_moneyChange;
	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"ltd",6600,format ["Оплатил магазин %1 (ID %2)",_store getVariable ["ltdName",""],_id]] call RRPServer_DB_lk_fireAndForget;

	[] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
