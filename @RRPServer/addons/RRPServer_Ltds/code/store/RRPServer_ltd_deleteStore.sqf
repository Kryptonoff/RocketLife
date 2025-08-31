/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_store","_player"];
private _id = 			_store getVariable ["ltdID",0];
private _idOwner = 		_store getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];
private _uid = 			getPlayerUID _player;

try
{
	if (isNull _store) throw "Магазин Null - попробуйте еще раз";
	if (isNull _player) throw "Вы че Null такой то, перезайдите на сервер и попробуйте еще раз";
	if !(_uid isEqualTo (_companyOwner select 0)) throw "Вы не можете удалить магазин!";
	
	deleteVehicle _store;
	deleteMarker format ["LTDStore_%1",_id];
	format ["deleteStore:%1",_id] call RRPServer_DB_fireAndForget;
	["SuccessTitleOnly", ["Магазин был удален..."]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	[true] remoteExec ["RRPClient_ltd_updateMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
