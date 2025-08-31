/*
Author:	Arrra
SteamID: 76561198090549826
Discord: merkava#9745
My VK:https://vk.com/id478482025
*/

private _pointX_Start = param [0,-1,[0]];
private _pointY_Start = param [1,-1,[0]];
private _pointX_Finish = param [2,-1,[0]];
private _pointY_Finish = param [3,-1,[0]];
private _StepEventZone = param [4,-1,[0]];
private _RadiusEventZone = param [5,-1,[0]]; 
private _playerID = param [6,"",[""]];
private _posMarkersArray = param [7,[],[[]]];

if ((_pointX_Start isEqualTo -1) || (_pointY_Start isEqualTo -1) || (_pointX_Finish isEqualTo -1) || (_pointY_Finish isEqualTo -1) || (_RadiusEventZone isEqualTo -1) || (_StepEventZone isEqualTo -1) || (_playerID isEqualTo "") || (_posMarkersArray isEqualTo [])) exitWith {};
private _EventZone = createMarker [format ["event_zone_%1",_playerID],[_pointX_Start,_pointY_Start]];
_EventZone setMarkerShape "ELLIPSE";
_EventZone setMarkerSize [_RadiusEventZone,_RadiusEventZone];
_EventZone setMarkerBrush "Solid";
_EventZone setMarkerColor "ColorYellow";

private _EventZoneText = createMarker [format ["event_zoneText_%1",_playerID],[_pointX_Start,_pointY_Start]];
_EventZoneText setMarkerColor "ColorWhite";
_EventZoneText setMarkerTypeLocal "KIA";
_EventZoneText setMarkerText "Радиоактивная зона! Опасно для жизни!";

ClientEventInfo = [_EventZone, _EventZoneText,_RadiusEventZone];
publicVariable "ClientEventInfo";
[] remoteExec ["RRPClient_events_effetcEventZone",-2];
{
    if (isNil "ClientEventInfo") ExitWith {};
	_EventZone setMarkerPos _x;
	_EventZoneText setMarkerPos _x; 
	uiSleep _StepEventZone; 

} forEach _posMarkersArray;

call RRPServer_system_deleteEventZone; 
