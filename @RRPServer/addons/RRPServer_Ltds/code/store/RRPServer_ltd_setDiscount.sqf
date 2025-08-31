/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_store","_discount","_onDay","_player"];
private _curDiscount = 	_store getVariable ["ltdDiscount",0];
private _discountDate = _store getVariable ["ltdDiscountDate",[]];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;

try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";
	if !(_curDiscount isEqualTo 0) throw "Нельзя установить новую скидку, пока действует предыдущая";
	if !(_uid isEqualTo (_companyOwner select 0)) throw "Установить скидку магазина может только руководитель компании";
	
	_store setVariable ["ltdDiscount",_discount,true];
	_date = ["Day",_onDay] call RRPServer_util_addDate;
	_store setVariable ["ltdDiscountDate",_date,true];
	format ["updateStoreDiscount:%1:%2:%3",_discount,_onDay,_id] call RRPServer_DB_fireAndForget;
	["SuccessTitleOnly", [format ["Вы успешно установили скидку на магазин в %1%2",_discount,"%"]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	[] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
