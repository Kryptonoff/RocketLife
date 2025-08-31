/*
	Project: BattleZone for Aurora Role Play
	
*/
params ["_player","_point","_position","_object","_name","_time"];
_target = createVehicle [_object,_position, [], 0, "CAN_COLLIDE"];
_target setPosATL _position;
_target setVariable ["BZ_Name",_name,true];
_target setVariable ["BZ_Time",time + (_time * 60),true];
_target setVariable ["BZ_UID",getPlayerUID _player,true];

_marker = createMarker ["BZ_Marker",_position];
_marker setMarkerText _name;
_marker setMarkerType "loc_CivilDefense";

FlagInCapture = false;
publicVariable "FlagInCapture";
_markerCord = getMarkerPos _marker;
["BattleGround",toUpper(_target getVariable ["BZ_Name",""]),(_markerCord select 0),(_markerCord select 1),"BattleGround"] spawn RRPServer_wz_addWarPoint;//не изменять!

_timeStamp = time;

waitUntil 
{
	(_target getVariable ["BZ_Time",0]) < _timeStamp
};

["BattleGround",toUpper(_target getVariable ["BZ_Name",""]),1234,"BattleGround"] spawn RRPServer_wz_removeWarPoint;