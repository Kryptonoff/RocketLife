/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
params [["_store",objNull,[objNull]],"_player"];
private _curMode = 		_store getVariable ["ltdMode",false];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;
format ["%1 YA YEST, - %2",netID _store,_store] call RRPServer_util_log;
try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";
	if !(_uid isEqualTo (_companyOwner select 0)) throw "Режим работы магазина может менять только руководитель компании";
	
	if (_curMode) then
	{
		["SuccessTitleAndText", ["Установлен режим","Только сотрудники компании"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
		_store setVariable ["ltdMode",false,true];
		format ["updateModeStore:0:%1",_id] call RRPServer_DB_fireAndForget;
	}else{
		["SuccessTitleAndText", ["Установлен режим","Для всех игроков"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
		_store setVariable ["ltdMode",true,true];
		format ["updateModeStore:1:%1",_id] call RRPServer_DB_fireAndForget;
	};
	[] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
