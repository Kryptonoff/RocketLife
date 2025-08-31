/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable [(_this # 0), displayNull];
private _controls = _this # 1;
{
	private _ctrl = _display displayCtrl _x;
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 0.4;
	_ctrl ctrlEnable false;
} forEach _controls;
uiSleep 0.4;
{
	private _ctrl = _display displayCtrl _x;
	_ctrl ctrlShow false;
} forEach _controls;

true