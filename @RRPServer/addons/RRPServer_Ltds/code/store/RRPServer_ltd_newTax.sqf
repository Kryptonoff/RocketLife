/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_store","_newTax","_player"];
private _curTax = 		_store getVariable ["ltdTax",0];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;

try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";
	if !(_uid isEqualTo (_companyOwner select 0)) throw "Менять пошлину магазина может только руководитель компании";
	
	_store setVariable ["ltdTax",_newTax,true];
	format ["updateStoreTax:%1:%2",_newTax,_id] call RRPServer_DB_fireAndForget;
	["SuccessTitleOnly", [format ["Вы успешно установили пошлину магазина на '%1%2'",_newTax,"%"]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	[] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
