/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _mode = param [0,"",[""]];

switch (_mode) do
{
	case "place": {
		private["_intersectingObjectArray", "_position"];
		_intersectingObjectArray = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0, 0, 0], AGLToASL positionCameraToWorld [0, 0, 1600], vehicle player, objNull, true, 1, "VIEW", "FIRE"];
		if !(_intersectingObjectArray isEqualTo []) then 
		{
			_position = (_intersectingObjectArray select 0) select 0;
			["syncGroup", [true, _position]] call RRPClient_party_pingActions;
		}
		else 
		{
			["syncGroup", [false, []]] call RRPClient_party_pingActions;
		};
	};
	case "syncGroup": {
		private _params = _this select 1;
		_update = _params select 0;
		_position = _params select 1;
		if (_update) then 
		{
			player setVariable ["PartyMarker", [_position,serverTime]];
		}
		else 
		{
			player setVariable ["PartyMarker", nil];
		};
		{
			if !(_x isEqualTo player) then 
			{
				["syncPlayers", [netId player, _update, _position]] remoteExecCall ["RRPClient_party_pingActions",_x];
			};
		}forEach (units (group player));
	};
	case "syncPlayers": {
		private["_playerNetID", "_update", "_position", "_player"];
		
		private _params = _this select 1;
		_playerNetID = _params select 0;
		_update = _params select 1; 
		_position = _params select 2;
		_player = objectFromNetId _playerNetID;
		if !(isNull _player) then 
		{
			if (_update) then 
			{
				_player setVariable ["PartyMarker", [_position,serverTime]];
			}
			else 
			{
				_player setVariable ["PartyMarker", nil];
			};
		};
	};
};
true