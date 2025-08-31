/*	
	Filename: 	RRPClient_system_insurancePay.sqf
	Project: 	Rimas Altis Life RPG
*/

private["_vehicle","_vid","_price","_displayName"];

disableSerialization;

try
{
	_display = uiNamespace getVariable ["RRPDialogGarage",displayNull];
	_vehicle = _display getVariable ["value",-1];
	if (_vehicle isEqualTo -1) throw "Вы не выбрали технику";
	
	closeDialog 0;
	["InfoTitleAndText",["Гараж!","Отправка запроса в страховую..."]] call SmartClient_gui_toaster_addTemplateToast;
	[	_vehicle,
		getPlayerUID player,
		player,
		life_garage_type] remoteExecCall ["RRPServer_garage_insurancePayRequest",2];
}catch{
	["ErrorTitleAndText",["Гараж!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
