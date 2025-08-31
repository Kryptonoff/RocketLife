/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
	RRPClientLTDsData params ["_id","_name"];
	private _dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
	_dataCompany params ["_owner","_name","_bank","_members"];
	if !((getPlayerUID player) isEqualTo _owner) throw "Вы не можете этого сделать!";
	if !(_bank isEqualTo 0) throw "Банковский счет компании не пуст. Вы должны обналичить средства прежде чем упразднить компанию!";
	_action = ["Вы уверены что хотите удалить компанию? Все магазины и товары продаваемые в нем, будут безвозвратно удалены и средства затраченные на установку магазинов не будут возвращены!","Удалить?","Да","Не надо"] call BIS_fnc_guiMessage;
	if(_action) then
	{
		[player,_id] remoteExecCall ["RRPServer_ltd_removeLtd",2];
		closeDialog 0;
	}else{};
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
