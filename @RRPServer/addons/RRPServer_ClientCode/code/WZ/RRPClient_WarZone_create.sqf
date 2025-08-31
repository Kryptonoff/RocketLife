/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if ((RRPClientWarZones select 2) isEqualTo 0) then {
	["ErrorTitleAndText",["Военное положение!","Ошибка! Радиус военного положения не может быть равен нулю!"]] call SmartClient_gui_toaster_addTemplateToast;
} else {
	
	RRPClientWarZones params ["_pos","_nameMark","_rad"];
	_name = ctrlText 25003;
	ctrlEnable [25006,false];
	[_pos#0,_pos#1,_rad,_name,player] remoteExecCall ["RRPServer_WarZone_addWarPoint",2];	
	deleteMarkerLocal RRPClientWarZoneMarkerName;
	deleteMarkerLocal RRPClientWarZoneMarkerName2;
	deleteMarkerLocal RRPClientWarZoneNameRadius;
	[false] call RRPClient_martiallaw_mapControl;
};