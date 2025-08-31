/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogPoliceDropMyCrimes",displayNull];
private _listBox = _this select 0;
private _index = _this select 1;
private _data = _listBox lbData _index;
private _selectedCrime = call compile _data;
if (getNumber(missionConfigFile >> "LifeCfgCrimes" >> _selectedCrime select 1 >> "easy") isEqualTo 1) then
{
	ctrlEnable [7901,true];
}else{ctrlEnable [7901,false];};