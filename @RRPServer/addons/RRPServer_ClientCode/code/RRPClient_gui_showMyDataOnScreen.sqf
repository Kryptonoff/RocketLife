/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPClient_gui_showMyDataOnScreen};
disableSerialization;
private _display = findDisplay 46;
private _ctrlText = _display ctrlCreate ["RscStructuredText",462589];
_ctrlText ctrlSetBackgroundColor [1,1,1,0];
_ctrlText ctrlSetTextColor [0.945,0.016,0.016,0.2];
while {true} do
{
	_ctrlText ctrlSetPosition [(random[0.2, 0.5, 0.9]) * safezoneW + safezoneX,(random[0.2, 0.5, 0.9]) * safezoneH + safezoneY,0.5,0.3];
	_ctrlText ctrlCommit 0;
	_ctrlText ctrlSetStructuredText parseText format ["<t size='1.1' align='center' font='PuristaSemiBold'>%1<br/> %5:%6 <br/>%4-%3-%2</t>",call RRPClientPlayerID,RRPPublicTime select 0,RRPPublicTime select 1,RRPPublicTime select 2,RRPPublicTime select 3,RRPPublicTime select 4];
	uiSleep 5;
};
