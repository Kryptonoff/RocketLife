params ["_unit", ["_delete", false]];
if !(isNull (objectParent _unit)) exitWith {}; 
if (isObjectHidden _unit) exitWith {};

if (_delete) exitWith {
	_unit playAction "tablet_stop";
	deleteVehicle tabletObject; 
	tabletObject = nil
};

if (!isNil "tabletObject") then {deleteVehicle tabletObject; tabletObject = nil};

_unit playAction "tablet_idle";
tabletObject = createVehicle ["Land_Tablet_01_F", [0,0,0], [], 0, "CAN_COLLIDE"];
tabletObject attachto [_unit, [-0.02, 0, -0.06], "rightHand", true];
_y = 0; _p = 18; _r = 240;
tabletObject setVectorDirAndUp [[sin _y * cos _p, cos _y * cos _p, sin _p],[[sin _r, -sin _p, cos _r * cos _p], -_y] call BIS_fnc_rotateVector2D];
