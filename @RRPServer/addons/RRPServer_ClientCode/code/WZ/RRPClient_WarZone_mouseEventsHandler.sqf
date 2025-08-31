/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
	
	Description:
	Handle mouse events on the map.
	
	Parameter(s):
	_this select 0 <ARRAY> - mouse event parameters, passed as is
		`--- select 0 <CONTROL> - map control
		`--- select 1 <INTEGER> - passed button
		`--- select 2 <FLOAT> - "x" coordinate
		`--- select 3 <FLOAT> - "y" coordinate
		`--- select 4 <BOOLEAN> - "shift" state
		`--- select 5 <BOOLEAN> - "control" state
		`--- select 6 <BOOLEAN> - "alt" state
	_this select 1 <STRING> - mouse event name without "on" prefix
*/

private["_event_data","_map_ctrl","_event_button","_event_x","_event_y","_event_shift","_event_control","_event_alt","_event_name","_eh_mouse_moving_id","_marker_name"];
params [
	["_event_data", [], [[]], [7]],
	["_event_name", "", [""]]
];

if (_event_data isEqualTo 0) exitWith {};
if (_event_name isEqualTo "") exitWith {};

_event_data params [
	["_map_ctrl", controlNull, [controlNull]],
	["_event_button", -1, [0]],
	["_event_x", -1, [0]],
	["_event_y", -1, [0]],
	["_event_shift", false, [false]],
	["_event_control", false, [false]],
	["_event_alt", false, [false]]
];

_marker_name = RRPClientWarZoneMarkerName;
_marker_name_2 = RRPClientWarZoneMarkerName2;
_radius_marker = RRPClientWarZoneNameRadius;
private _inZone = false;
if !(RRPServerWarZones isEqualTo []) then {
	_inZone = false;
	{
		_marker = format["war_zone_%1",_x select 0];
		_marker_pos_tmp = markerPos _marker;
		_click_pos_world = _map_ctrl ctrlMapScreenToWorld [_event_x,_event_y];
		_distance_tmp = [_marker_pos_tmp select 0, _marker_pos_tmp select 1] distance _click_pos_world;
		if (_distance_tmp <= (_x select 1)) exitWith 
		{
			_inZone = true; 
			RRPClientMarkerCountLocal = (_x select 0);
			RRPClientMarkerIndexLocal = _forEachIndex;
		};
	} forEach RRPServerWarZones;
};

////////////////////////////////////////////////////////////////////

switch _event_name do
{
	case "mouseButtonDown":
	{
		switch _event_button do
		{
			case 0:
			{
				if (_inZone) then
				{
					[true,true] call RRPClient_WarZone_mapControl;
					call RRPClient_WarZone_deleteMarker;
				}
				else
				{
					private["_marker_pos"];
					if ((markerShape _marker_name)=="") then
					{
						[_map_ctrl,_event_x,_event_y] call RRPClient_WarZone_createMarker;
					}
					else
					{
						private["_distance","_click_pos_world"];
						_marker_pos = markerPos _marker_name;
						_click_pos_world = _map_ctrl ctrlMapScreenToWorld [_event_x,_event_y];
						_distance = [_marker_pos select 0, _marker_pos select 1] distance _click_pos_world;
						if (_distance <= ((getMarkerSize _marker_name) select 0)) then
						{
							[false] call RRPClient_WarZone_mapControl;
							_map_ctrl ctrlSetEventHandler ["mouseMoving","_this call RRPClient_WarZone_setRadius"];
						}
						else
						{
							call RRPClient_WarZone_deleteMarker;
							[_map_ctrl,_event_x,_event_y] call RRPClient_WarZone_createMarker;						
						};
					};
				};
			};
			case 1:
			{
				if (_event_control) then
				{
					if (_inZone) then
					{
						[true,true] call RRPClient_WarZone_mapControl;
						call RRPClient_WarZone_deleteMarker;
					}
					else
					{
						// delete marker if ctrl+RMB inside it
						private["_radius","_marker_pos","_click_distance","_click_world_coords"];
						_radius = (getMarkerSize _marker_name) select 0;
						_marker_pos = [(getMarkerPos _marker_name) select 0, (getMarkerPos _marker_name) select 1];
						_click_world_coords = _map_ctrl ctrlMapScreenToWorld [_event_x,_event_y];
						_click_distance = _marker_pos distance _click_world_coords;
						if (_click_distance < _radius) then
						{
							call RRPClient_WarZone_deleteMarker;
						};
					};
				};
			};
		};
	};
	case "mouseButtonUp":
	{
		if (_event_button == 0) then
		{
			_map_ctrl ctrlRemoveAllEventHandlers "mouseMoving";
			deleteMarkerLocal _radius_marker;
			[true,_inZone] call RRPClient_WarZone_mapControl;
		};
	};
};
