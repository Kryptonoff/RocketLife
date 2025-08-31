/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_marker_name","_marker_name_2","_radius_marker"];
_marker_name = RRPClientWarZoneMarkerName;
_marker_name_2 = RRPClientWarZoneMarkerName2;
_radius_marker = RRPClientWarZoneNameRadius;

deleteMarkerLocal _marker_name;
deleteMarkerLocal _marker_name_2;
deleteMarkerLocal _radius_marker;

RRPClientWarZones = [[0,0],"",0,false];

[false] call RRPClient_WarZone_mapControl;