/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogPoliceDropMyCrimes",displayNull];
private _listCrimes = _display displayCtrl 7902;
lbClear _listCrimes;
private _crimes = param [0,[],[[]]];
if (_crimes isEqualTo []) exitWith 
{
	_listCrimes lbAdd "Вы не в розыске!";
	ctrlEnable [7901,false];
};
{
	private _index = _listCrimes lbAdd getText(missionConfigFile >> "LifeCfgCrimes" >> _x select 1 >> "displayName");
	_listCrimes lbSetTextRight [_index,format["$%1",STR(getNumber(missionConfigFile >> "LifeCfgCrimes" >> _x select 1 >> "reward"))]];
	_listCrimes lbSetData [_index,STR([_x select 0,_x select 1])];
}forEach _crimes;