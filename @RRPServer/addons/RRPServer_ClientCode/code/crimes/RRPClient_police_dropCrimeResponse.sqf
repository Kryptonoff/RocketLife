/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogPoliceDropMyCrimes",displayNull];
private _list = _display displayCtrl 7902;
_list lbDelete (lbCurSel 7902);