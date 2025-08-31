/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

_object = player getVariable ["dragObject", objNull];
_height = _object getVariable ["height", 0.5];

if(life_dragKeyDown) then {
	if ((_this select 1) > 0) then {
		_height = _height + 0.3;
	} else {
		_height = _height - 0.3;
	};
	
	_object setVariable ["height", (_height min 2) max 0];
} else {
	_dir = 0;
	if ((_this select 1) > 0) then {
		_dir = ((getDir _object) + 10);
	} else {
		_dir = ((getDir _object) - 10);
	};	
	_object setDir _dir;
};