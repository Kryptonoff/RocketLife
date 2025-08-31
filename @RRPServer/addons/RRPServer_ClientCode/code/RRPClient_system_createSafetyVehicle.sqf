params ["_vehicleClassName","_position",["_direction",0],"_isATL"];
_position set [2, (_position select 2)+0.1];
private _temporaryPositionInOuterSpace =
[
	(_position select 0) - 250 + (random 500),
	(_position select 1) - 250 + (random 500),
	1000 + (random 1000)
];
if (_vehicleClassName isKindOf "Ship") then {_isATL = false};
private _vehicleObject = createVehicle [_vehicleClassName, _temporaryPositionInOuterSpace, [], 0, "CAN_COLLIDE"];
_vehicleObject allowDamage false;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject addEventHandler["HandleDamage", {false}];
_vehicleObject setVelocity [0, 0, 0];
if (_direction isEqualType []) then
{
	_vehicleObject setVectorDirAndUp _direction;
}
else
{
	_vehicleObject setDir _direction;
};
if (_isATL) then
{
	_vehicleObject setPosATL _position;
}
else
{
	_vehicleObject setPosASL _position;
};
_vehicleObject setVelocity [0, 0, 0];
_vehicleObject allowDamage true;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject setDamage 0;
clearBackpackCargoGlobal _vehicleObject;
clearItemCargoGlobal _vehicleObject;
clearMagazineCargoGlobal _vehicleObject;
clearWeaponCargoGlobal _vehicleObject;
_vehicleObject