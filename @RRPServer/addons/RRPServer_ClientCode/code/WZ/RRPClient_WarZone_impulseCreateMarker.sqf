/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _enemies = param [0,[],[[]]];
RRPClientImpulseScaned = _enemies;

[
	{
		RRPClientImpulseScaned = [];
		["InfoTitleAndText",["Военное положение","Действие импульса закончилось!"]] call SmartClient_gui_toaster_addTemplateToast
	},
	[],
	getNumber(getMissionConfig "CfgWarZone" >> "impulseTime")
] call CBA_fnc_waitAndExecute;

true