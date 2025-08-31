/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND

{
	_p1 = _x select _forEachIndex;
	_p2 = _x select (_j + 1) % _forEachIndex;
	_cotrol drawTriangle [
		[_p1,_p2,_flagPos],
		_colorTerritory,
		"#(rgb,1,1,1)color(" + str(_colorTerritory select 0) + "," + str(_colorTerritory select 1) + "," + str(_colorTerritory select 2) + "," + str(_colorTerritory select 3) + ")"				];
}forEach _polygons;

*/

/*
params ["_control"];

private _mapOpened = visiblemap;
private _zoomHideAll = 0.62;

private _posMouseScreen = getMousePosition;
private _posMouse = _control ctrlMapScreenToWorld _posMouseScreen;
private _scale = round( 100 * (ctrlMapScale _control));
private _minPos = _control ctrlMapScreenToWorld [safeZoneX, safeZoneY + safeZoneH];
private _maxPos = _control ctrlMapScreenToWorld [safeZoneX + safeZoneW, safeZoneY];
private _allAlpha = player getVariable ["AllAlpha",[]];

_allFlags = RRPPublicZonesFlags;

comment "//-- Sort all flags";
private ["_id","_zone","_group_id","_groupName","_radius","_borders","_polygons","_phase","_tax","_last_capture","_patern","_poly"];
{
	_flag = _x;

	_id = 			_flag getVariable ["ZoneId",-1];
	_zone = 		_flag getVariable ["ZoneName","Zone 1"];
	_group_id = 	_flag getVariable ["ZoneGroup",-1];
	_groupName = 	_flag getVariable ["ZoneGroupName",""];
	_radius = 		_flag getVariable ["ZoneRadius",500];
	_borders = 		_flag getVariable ["ZoneBorders",[]];
	_polygons = 	_flag getVariable ["ZonePoly",[]];
	_color = 		_flag getVariable ["ZoneColor",[0,0,0,1]];
	_phase = 		_flag getVariable ["ZonePhase",1];
	_tax = 			_flag getVariable ["ZoneTax",1];
	_last_capture = _flag getVariable ["ZoneCaptured",[]];
	_flagPos = 		getPosWorld _flag;
	_mouseIsIn = [_posMouse#0,_posMouse#1,0] inPolygon _polygons;

	if (_group_id isEqualTo (player getVariable "GroupId")) then
	{
		_patern = [];
		{
			_poly = _x;
			_patern pushBack [(_poly select 0) ,(_poly select 1), 0];
		}forEach _polygons; 
		_control drawPolygon [_patern,[0,0,0,1]];
	};

	systemChat format [
		"%1 %2 %3 %4 %5",
		_flagPos select 0 > _minPos select 0,
		_flagPos select 1 > _minPos select 1,
		_flagPos select 0 < _minPos select 0,
		_flagPos select 1 < _minPos select 1,
		!(_zone isEqualTo "")
	];
	
		_color params ["_r","_g","_b",["_a",0]];
		_neutral = _group_id isEqualTo -1;
		systemChat "23";

		if (_neutral) then 
		{
			_a = linearConversion [_zoomHideAll, 1, _scale / 100, 0.25, 0.75];
		};
		private _colorTerritory = [[_r, _g, _b, _a], [1 - _r, 1 - _g, 1 - _b, 0.25]] select _mouseIsIn;
		
		private _n1 = count _polygons;
		for "_j" from 0 to (_n1 - 1) do {
			_p1 = _polygons select _j;
			_p2 = _polygons select (_j + 1) % _n1;
			_control drawTriangle [
				[_p1,_p2,_flagPos],
				_colorTerritory,
				format ["#(rgb,1,1,1)color(%1,%2,%3,%4)", 1,1,1,0.25]
			];
			comment "(_colorTerritory select 0),(_colorTerritory select 1),(_colorTerritory select 2),(_colorTerritory select 3)";
		};

		systemChat str _polygons;
		
	
	comment "//-- TODO: Make description for Zone";
	if (_mouseIsIn) then
	{
		
	};
	if !(_group_id isEqualTo (player getVariable "GroupId")) then 
	{
		_patern = [];
		{
			_patern pushBack [(_x select 0),(_x select 1), 0];
		}forEach _polygons; 
		_control drawPolygon [_patern,[_color#0,_color#1,_color#2,1]];
	};
}forEach _allFlags;
*/