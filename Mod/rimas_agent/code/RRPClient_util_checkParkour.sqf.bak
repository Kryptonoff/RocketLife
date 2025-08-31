/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _allow = true;
{
	if (([player,_x#0] call CBA_fnc_getDistance < _x#1)) exitWith {
		_allow = false;
	};
}forEach (getArray(getMissionConfig "LifeCfgSettings" >> "parkourBlackList"));
_allow