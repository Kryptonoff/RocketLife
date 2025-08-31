/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

params [
	["_pointX",0,[0]],
	["_pointY",0,[0]],
	["_radius",0,[0]],
	["_pointName","",[""]]
];

//Stop bad data being passed.
if (_pointX isEqualTo 0 || {_pointY isEqualTo 0} || {_radius isEqualTo 0} || {_pointName isEqualTo ""}) exitWith {};

private _pointID = round(random(1000));
RRPServerWarZones pushBack [_pointID, _radius, _pointName, "Server"];
publicVariable "RRPServerWarZones";

private _warn = createMarker [format ["war_zone_%1",_pointID],[_pointX,_pointY]];
_warn setMarkerShape "ELLIPSE";
_warn setMarkerSize [_radius,_radius];
_warn setMarkerColor "ColorEAST";
_warn setMarkerBrush "Solid";
_warn setMarkerAlpha 0.5;

private _marker = createMarker [format ["war_marker_%1",_pointID],[_pointX,_pointY]];
_marker setMarkerColor "ColorWhite";
_marker setMarkerTypeLocal "KIA";
_marker setMarkerText "Не входить! Ведётся военное положение!";

["Военное положение",format["Объявлено военное положение %1",_pointName],10] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];

_pointID