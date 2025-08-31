/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if isDedicated exitWith {};

params [["_target","",[objNull,""]],["_class","",[""]],["_selection",0,[-1]]];
if (_target in [objNull,""] || _class == "") exitWith {};

private _config = switch true do 
{
	case (isClass(missionConfigFile >> "CfgAnimatePAA" >> _class)):{missionConfigFile >> "CfgAnimatePAA" >> _class};
	case (isClass(configFile >> "CfgAnimatePAA" >> _class)):{configFile >> "CfgAnimatePAA" >> _class};
	default {configNull};
};


if (isNull _config) exitWith {};


[_target] call CAU_animate_fnc_remove;

private _type = ["object","marker"] select (_target isEqualType "");
CAU_animate_list_local pushBack [
	_type,
	_target,
	_selection,
	if (_type isEqualTo "object") then {getArray(_config >> "layers")} else {getText(_config >> "type")},
	0,
	getNumber(_config >> "frames"),
	0,
	getNumber(_config >> "delay"),
	getNumber(_config >> "mode"),
	1
];
