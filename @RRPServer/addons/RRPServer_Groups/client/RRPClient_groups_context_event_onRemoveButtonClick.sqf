/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_markerInfo", "_marker"];
_markerInfo = [RRPClientMapPositionClick,100] call RRPClient_groups_getMarkerPosition;
if ((count RRPClientGroupInfo) isNotEqualTo 0) exitWith {false};
if !("canMarker" call RRPClient_groups_util_permCheck) exitWith {false};
if(!(_markerInfo isEqualTo ["",-1]))then
{
	switch (_markerInfo select 0) do
	{
		case "Marker" :
		{
			_marker = (RRPClientGroupInfo get "markers") select (_markerInfo select 1);
			["removeMarkerRequest", ["markers",_marker select ((count _marker) -1)]] call RRPClient_system_send;
		};
		case "Polygon" :
		{
			_marker = (RRPClientGroupInfo get "polys") select (_markerInfo select 1);
			["removeMarkerRequest", ["polys",_marker select ((count _marker) -1)]] call RRPClient_system_send;
		};
		default {};
	};
};
