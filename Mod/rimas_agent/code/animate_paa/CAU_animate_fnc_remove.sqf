/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if isDedicated exitWith {};
params [["_target","",[objNull,""]]];
if (_target in [""]) exitWith {};
private _index = CAU_animate_list_local findIf {_x#1 isEqualTo _target};
if (_index > -1) then 
{
	CAU_animate_list_local deleteAt _index;
};