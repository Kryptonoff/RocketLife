/*
    Author: Vincent
    Web site: www.the-programmer.com
    Discord: https://discord.the-programmer.com

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.
*/
// Setup variables

private _player = player;
private _position = getPosWorld _player;
private _locationIndex = -1;
{
    _flag = _x;
    _polygon = _flag getVariable ["ZonePoly",[]];
    if (_position inPolygon _polygon) exitWith {
        _locationIndex = _flag getVariable ["ZoneId",-1];
    };

}forEach RRPPublicZonesFlags;

private _n = count(territorySystem_flags);
if (_n isEqualTo 0) exitWith {-1};
private _locationIndex = -1;
// Cursor
if (cursortarget in territorySystem_flags) exitWith {cursortarget getVariable["_index", -1]};
// In Polygon
for "_i" from 0 to _n - 1 do {
	private _flag = territorySystem_flags select _i;
    private _polygon = _flag getVariable "_polygon";
	if (_position inPolygon _polygon) exitWith {
		_locationIndex = _i;
	};
};
if not(_locationIndex isEqualTo -1) exitWith {_locationIndex};

// Closest
private _minDistance = worldSize;
for "_i" from 0 to _n - 1 do {
	private _flag = territorySystem_flags select _i;
    private _center = _flag getVariable "_centre";
    private _distance = _position distance _center;
    if (_distance < _minDistance) then {
        _minDistance = _distance;
        _locationIndex = _i;
    };
};
if not(_locationIndex isEqualTo -1) exitWith {_locationIndex};
