/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !isServer exitWith 
{
	_this remoteExecCall ["CAU_animate_fnc_addGlobal",2];
};

params [["_target","",[objNull,""]],["_class","",[""]]];
if (_target in [objNull,""] || _class == "") exitWith {};

private _reID = format["%1_reID_%2","CAU_animate_fnc_addGlobal",if (_target isEqualType objNull) then {netID _target} else {_target}];
CAU_animate_list_global pushBackUnique [_target,_reID];

[_target,_class] remoteExecCall ["CAU_animate_fnc_add",[0,-2] select isDedicated,_reID];