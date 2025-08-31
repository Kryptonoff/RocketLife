/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_store","_newName","_player"];
private _name = 		_store getVariable ["ltdName",""];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;

try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";
	if !(_uid isEqualTo (_companyOwner select 0)) throw "Менять название магазина может только руководитель компании";
	if (_newName isEqualTo "") throw "Вы ничего не ввели!";
	if (_newName isEqualTo _name) throw "Название должно отличаться!";
	private _check = [_newName,getText(missionConfigFile >> "LifeCfgSettings" >> "allowAlphabet")] call RRPClient_util_containsForbiddenCharacter;
	if !(_check isEqualTo -1) throw format ["Нельзя использовать символ '%1'",_check];
	
	_store setVariable ["ltdName",_newName,true];
	_marker = format ["LTDStore_%1",_id];
	_marker setMarkerText format["%1",_newName];
	format ["updateStoreName:%1:%2",_newName,_id] call RRPServer_DB_fireAndForget;
	["SuccessTitleOnly", [format ["Вы усмешно сменили имя магазина на '%1'",_newName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	[] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
