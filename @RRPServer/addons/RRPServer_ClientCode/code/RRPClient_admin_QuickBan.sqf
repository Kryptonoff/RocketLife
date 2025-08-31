/*

	Filename: 	RRPClient_admin_QuickBan.sqf
	Project: 	Rimas Altis Life RPG
	Author:		FairyTale
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"

disableSerialization;
private["_unit"];
_unit = call compile format["%1", CONTROL_DATA(2902)];
_display = uiNamespace getVariable ["RRPDialogAdmin",displayNull];
_timeCtrl = _display displayCtrl 2928;
_time = ctrlText _timeCtrl;
try
{
	if((call life_adminlevel) == 0) throw "Ахуел чтоли";
	if(isNil "_unit" OR isNull _unit) throw "unit is null";
	if (RRPClient_BanReason isEqualTo "") throw "Выберите причину бана!";
	if (count _time > 4) throw "Только 4 символа!";
	_forbiddenCharacter = [_timeCtrl, ["0123456789"]] call RRP_util_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) throw "ТОЛЬКО ЦИФРЫ!";
		
	[RRPClient_BanReason,_time,netId _unit,netId player] remoteExecCall ["RRPServer_system_banToDatabase",2];
	
}catch{
	[_exception] call hints;
	closeDialog 0;
};