/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogPoliceDropMyCrimes",displayNull];
private _data = (lbData[7902,lbCurSel 7902]);
private _selectedCrime = call compile _data;
if !(getNumber(missionConfigFile >> "LifeCfgCrimes" >> _selectedCrime select 1 >> "easy") isEqualTo 1) exitWith {};
[(_selectedCrime select 0),(_selectedCrime select 1),player] remoteExecCall ["RRPServer_police_dropMyCrime",2];