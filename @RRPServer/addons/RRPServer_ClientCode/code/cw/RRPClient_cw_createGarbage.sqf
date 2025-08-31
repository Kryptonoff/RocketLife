/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_objectCount","_radiusZone","_arrayNearRoads","_arrayRandomRoads","_objectRoad","_tmpArray","_objectRoadPos","_type","_object"];
_objectCount = param [0,0,[0]];
if (_objectCount <= 0) exitWith {};

_radiusZone = getNumber(missionConfigFile >> "LifeCfgSettings" >> "radiusCW");
_arrayNearRoads = (getMarkerPos (getText(missionConfigFile >> "LifeCfgSettings" >> "startMarkerCW"))) nearRoads _radiusZone;
_arrayRandomRoads = +[];

life_garbage_action_status = false;
life_cw_object_array = [];

for "_i" from 1 to _objectCount do {
	_objectRoad = (selectRandom _arrayNearRoads);
	if !(_objectRoad in _arrayRandomRoads) then {
		_arrayRandomRoads pushBack _objectRoad;
		_tmpArray = +[];
		_tmpArray = _arrayNearRoads - [_objectRoad];
		_arrayNearRoads = _tmpArray;
	};
};

{
	_objectRoad = _x;
	_objectRoadPos = getPosATL _objectRoad;
	_type = selectRandom ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F"];
	_object = _type createVehicleLocal [_objectRoadPos select 0, _objectRoadPos select 1, 0];
	_object setVariable ["garbageCW",true];
	life_cw_object_array pushBack _object;
} forEach _arrayRandomRoads;
