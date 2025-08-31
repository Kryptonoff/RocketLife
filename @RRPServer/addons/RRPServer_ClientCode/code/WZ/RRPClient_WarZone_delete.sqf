/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try {

	if (RRPServerWarZones isEqualTo []) exitWith {};

	private _text = "";
	{
		if ((_x select 0) isEqualTo RRPClientMarkerCountLocal) then {
			_text = _x select 2;
			if ((_x select 3) isEqualTo "Server") throw "Это ВП нельзя снять!";
		};
	} forEach RRPServerWarZones;
	if (_text isEqualTo "") exitWith {};

	private _impulse = missionNamespace getVariable [format["RRPublicImpulseZone_war_zone_%1",RRPClientMarkerCountLocal],0];
	if (_impulse > (time - (10 + getNumber(getMissionConfig "CfgWarZone" >> "impulseTime")))) throw "Невозможно снять ВП пока активен импульс!";

	[RRPClientMarkerCountLocal,player,_text] remoteExecCall ["RRPServer_WarZone_removeWarPoint",2];
	[false] call RRPClient_WarZone_mapControl;
} catch {
	["ErrorTitleAndText", ["Военное положение", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
