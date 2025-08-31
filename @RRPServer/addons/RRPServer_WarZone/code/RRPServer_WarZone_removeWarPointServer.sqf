/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_pointID",0,[0]],
	["_pointName","",[""]]
];

if (_pointName isEqualTo "") exitWith {};

private _exists = false;
private _membersNew = [];
{
	if ((_x select 0) != _pointID) then {_membersNew pushBack _x};
	if ((_x select 0) isEqualTo _pointID) then {_exists = true};
} forEach RRPServerWarZones;

if !(_exists) exitWith {};

_pos = markerPos format ["war_zone_%1",_pointID];
missionNamespace setVariable ["RRPServerWarZones",_membersNew,true];
missionNamespace setVariable [format["RRPPublicWarZoneChat_war_zone_%1",_pointID],nil,true];
missionNamespace setVariable [format["RRPublicImpulseZone_war_zone_%1",_pointID],nil,true];
deleteMarker format ["war_marker_%1",_pointID];
deleteMarker format ["war_zone_%1",_pointID];

["Военное положение",format["Было снято военное положение %1",_pointName]] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];