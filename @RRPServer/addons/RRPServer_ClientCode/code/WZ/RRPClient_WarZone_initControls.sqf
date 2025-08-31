/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
if (life_is_arrested) exitWith {};
createDialog "RRPDialogWarZone";
private _display = uiNamespace getVariable ["RRPDialogWarZone",displayNull];
{ctrlEnable [_x,false]}forEach [25003,25004,25006,25007,25009,25011];
[false] call RRPClient_WarZone_mapControl;
