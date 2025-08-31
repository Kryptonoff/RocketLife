/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogPoliceDropMyCrimes",displayNull];
createDialog "RRPDialogPoliceDropMyCrimes";
private _listCrimes = _display displayCtrl 7902;
lbClear _listCrimes;
_listCrimes lbAdd "Загружаем...";
[player] remoteExecCall ["RRPServer_police_crimesRequest",2];