/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
try
{
	private _zone = player call RRPClient_WarZone_util_getZoneInside;
	if (_zone isEqualTo []) throw "Нужно быть в зоне военных действий";
	if !((_zone # 0) isEqualTo (format["war_zone_%1",RRPClientMarkerCountLocal])) throw "Вызвать импульс можно находясь внутри этой зоны";
	private _id = player getVariable ["GroupId",-1];
	private _delay =missionNamespace getVariable [format["ImpulseDelay_%1",_id],0];
	if ((time - _delay) < (getNumber(getMissionConfig "CfgWarZone" >> "cooldownImpulse") * 60))  throw "Импульс в куллдауне";
	private _cost = getNumber(getMissionConfig "CfgWarZone" >> "costImpulse") * (missionNamespace getVariable [format["ImpulseCount_%1_%2",_id,((RRPServerWarZones select RRPClientMarkerIndexLocal) select 0)],1]);
	if (_cost > (RRPClientGroupInfo get "bank")) throw (format ["На счету организации недостаточно средств! Стоимость импульса $%1",[_cost] call RRPClient_util_numberText]);
	[
		(uiNamespace getVariable ["RRPDialogWarZone",displayNull]),
		{
			["request",[player]] remoteExecCall ["RRPServer_WarZone_impulse",2];
		},[],
		"Запустить сканирующий импульс?",
		format["Запуск сканирующего импульса обойдеться вам в $%1 со счета организации!",[_cost] call RRPClient_util_numberText]
	] call RRPClient_util_prompt;
}catch{
	["ErrorTitleAndText",["Военное положение",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
