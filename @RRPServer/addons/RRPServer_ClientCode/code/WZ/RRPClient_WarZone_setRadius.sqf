/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND

	Description:
	Handle mouse events on the map.
	
	Parameter(s):
	_this <ARRAY> - mouse event parameters, passed as is
	`--- select 0 <CONTROL> - map control
	`--- select 1 <FLOAT> - "x" cursor coordinate relative to control
	`--- select 2 <FLOAT> - "x" cursor coordinate relative to control
*/

private["_map_ctrl","_cursor_x","_cursor_y","_wz","_wz_pos","_cursor_world_pos","_radius",
"_radius_min","_radius_max","_radius_marker"];
params [
	["_map_ctrl", controlNull, [controlNull]],
	["_cursor_x", -1, [0]],
	["_cursor_y", -1, [0]]
];

_cursor_pos = _map_ctrl ctrlMapScreenToWorld [_cursor_x,_cursor_y];

_wz = RRPClientWarZoneMarkerName;
_wz_pos = getMarkerPos _wz;

_radius_min = 500;
_radius_max = 1000;
_radius_step = 1;

_radius_marker = RRPClientWarZoneNameRadius;
if (markerType _radius_marker == "") then
{
	createMarkerLocal [_radius_marker, _cursor_pos];
	_radius_marker setMarkerTypeLocal "mil_join";
	_radius_marker setMarkerColorLocal "ColorWhite";
	_radius_marker setMarkerTextLocal (str _radius_min);
}
else
{
	_radius_marker setMarkerPosLocal (_map_ctrl ctrlMapScreenToWorld [_cursor_x,_cursor_y]);
};

_cursor_world_pos = _map_ctrl ctrlMapScreenToWorld [_cursor_x,_cursor_y];

// //////////////////////////////////////////////////////////////////////

_radius = _radius_step * round ((_wz_pos distance _cursor_world_pos)/_radius_step);
if (_radius <= _radius_min) then
{
	_radius = _radius_min;
}
else
{
	if (_radius > _radius_max) then
	{
		_radius = _radius_max;
	};
};

if (((getMarkerSize _wz) select 0) != _radius) then
{
	_wz setMarkerSizeLocal [_radius,_radius];
	_radius_marker setMarkerTextLocal (str _radius);
};

// radius indicator position
private["_d_x","_d_y","_angle","_r_x","_r_y"];
_angle = ((_cursor_pos select 1) - (_wz_pos select 1)) atan2 ((_cursor_pos select 0) - (_wz_pos select 0));
_r_x = _radius * (cos _angle);
_r_y = _radius * (sin _angle);
_radius_marker setMarkerPosLocal [((_wz_pos select 0) + _r_x), ((_wz_pos select 1) + _r_y)];
if (_radius isEqualTo 0) then {_radius = _radius_min};
RRPClientWarZones set [2, _radius];

true;
