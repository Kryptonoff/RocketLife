/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
params [
	["_player",objNull,[objNull]],	
	"_id"
];

private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_id],[]];
_companyOwner params ["_owner","_name","_bank","_members"];
private _uid = getPlayerUID _player;

try
{
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";
	if !(_uid isEqualTo _owner) throw "Обналичить средства может только руководитель компании";
	if (_bank < 1000) throw "Обналичить средства можно от $1000";
	
	_companyOwner set [2,0];
	missionNamespace setVariable [format["ltdData_%1",_id],_companyOwner,true];
	
	[_player,"atm","add",STR(_bank)] call RRPServer_system_moneyChange;
	["SuccessTitleOnly", [format ["Вы сняли со счета компании $%1. Средства переведены на ваш банковский счет!",_bank]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	[] remoteExec ["RRPClient_ltd_updateLtdMenu",_player];
	format ["withdrawMoneyFromLTD:%1",_id] call RRPServer_DB_fireAndForget;
	[format ["Игрок %1 (%2) обналичил %3 с фирмы %4 (%5)",name _player, _uid, _bank, _name, _id],"LTD_Logs"] call RRPServer_system_logIt;
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
