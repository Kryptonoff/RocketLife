
params ["_unit",["_tap",false]];
if !(isNull (objectParent _unit)) exitWith {}; 

if (_tap) exitWith {
	_unit playAction "tablet_idle";
};
_unit playAction "tablet_tap";
