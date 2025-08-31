/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !isServer exitWith 
{
	_this remoteExecCall ["CAU_animate_fnc_removeGlobal",2];
};

params [["_target","",[objNull,""]],["_reID","",[""]]];
if (_target in [""]) exitWith {};

private _index = CAU_animate_list_global findIf {_x#0 isEqualTo _target};
if (_index > -1) then 
{
	if (_reID == "") then 
	{
		_reID = CAU_animate_list_global#_index#1;
	};

	CAU_animate_list_global deleteAt _index;
	remoteExec ["",_reID];	
};

[_target] remoteExecCall ["CAU_animate_fnc_remove",[0,-2] select isDedicated];