/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_store","_mode","_player"];
private _curDiscount = 	_store getVariable ["ltdACtive",false];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;

try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";
	if (_mode) then
	{
		["SuccessTitleOnly", ["Вы закрыли магазин"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
		_store setVariable ["ltdActive",false,true];
		format ["updateActiveStore:0:%1",_id] call RRPServer_DB_fireAndForget;
	}else{
		["SuccessTitleOnly", ["Вы открыли магазин"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
		_store setVariable ["ltdActive",true,true];
		format ["updateActiveStore:1:%1",_id] call RRPServer_DB_fireAndForget;
	};
	[] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
