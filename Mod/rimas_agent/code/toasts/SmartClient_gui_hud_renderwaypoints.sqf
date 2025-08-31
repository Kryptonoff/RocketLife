private["_distance","_color","_alpha","_textAlpha","_position","_color","_marker","_markerScreenPosition","_distanceToCenterOfScreen","_adjustedMarkerAlpha"];
if (alive player) then 
{
	if !(SmartClientWaypoints isEqualTo[]) then {
		{
			_distance = player distance _x;
			_color = (profileNameSpace getVariable ["PRNS_WaypointColor",[0.5,0.5,0.5,0.85]]);
			_color set [3,(linearConversion[0, 200, _distance, 0.25, 1, true])];
			drawIcon3D[
				(profileNameSpace getVariable ["PRNS_WaypointPic","\a3\ui_f\data\Map\MapControl\custommark_CA.paa"]), 
				_color,
				_x, 
				profileNamespace getVariable ["PRNS_WaypointSize",0.65], 
				profileNamespace getVariable ["PRNS_WaypointSize",0.65],
				0, 
				format["%1m", floor _distance], 
				0, 
				0.03, 
				"RobotoCondensed", "center", true];
		}
		forEach SmartClientWaypoints;
	};

	if (((count RRPClientGroupInfo) isNotEqualTo 0) OR {RRPClientPartyID isNotEqualTo ""}) then
	{
		private _clanMembers = RRPClientGroupInfo call RRPClient_groups_getMembers;
		{
			if (isPlayer _x) then
			{
				if !(_x isEqualTo player) then
				{
					_distance = cameraOn distance _x;
					_alpha = (1-(_distance/getNumber(getMissionConfig "CfgParty" >> "distanceESP")));
					_textAlpha = linearConversion [20,23,_distance,0.75,0,true];
					_position = _x modelToWorldVisual (_x selectionPosition "spine3");
					_color = profileNamespace getVariable ["PRNS_PartyESP",[1,1,1,1]]; 
					drawIcon3D
					[
						getText(getMissionConfig "CfgParty" >> "picESP"),
						[_color#0,_color#1,_color#2,_alpha],
						[_position # 0,_position # 1,(_position # 2)],
						1, 
						1, 
						0,
						"",
						false,
						(18 * pixelH), 
						"RobotoCondensed",
						"center"
					];
				};
			};
		}
		forEach _clanMembers;
	};

	{
		if ((count (units (group player))) > getNumber(missionConfigFile >> "CfgParty" >> "maxMembers")) then {continue};
		if (isPlayer _x) then
		{
			if !(_x isEqualTo player) then
			{
				_distance = cameraOn distance _x;
				_alpha = (1-(_distance/getNumber(getMissionConfig "CfgParty" >> "distanceESP")));
				_textAlpha = linearConversion [20,23,_distance,0.75,0,true];
				_position = _x modelToWorldVisual (_x selectionPosition "spine3");
				_color = profileNamespace getVariable ["PRNS_PartyESP",[1,1,1,1]]; 
				drawIcon3D
				[
					getText(getMissionConfig "CfgParty" >> "picESP"),
					[_color#0,_color#1,_color#2,_alpha],
					[_position # 0,_position # 1,(_position # 2)],
					1, 
					1, 
					0,
					"",
					false,
					(18 * pixelH), 
					"RobotoCondensed",
					"center"
				];
			};
		};
		_marker = _x getVariable ["PartyMarker", []];
		if !(_marker isEqualTo []) then 
		{
			_marker params ["_markerPosition","_time"];
			if ((_time + (getNumber(getMissionConfig "CfgParty" >> "deletePartyTag"))) - serverTime < 0) then {["syncPlayers", [netId _x, false]] remoteExecCall ["RRPClient_party_pingActions",(group player)]};
			_markerScreenPosition = worldToScreen _markerPosition;
			if !(_markerScreenPosition isEqualTo []) then 
			{
				_color = profileNamespace getVariable ["PRNS_PingColors",[1,1,1,1]];
				_distanceToCenterOfScreen = _markerScreenPosition distance2D [0.5, 0.5];
				_adjustedMarkerAlpha = linearConversion [0.1, 0.4, _distanceToCenterOfScreen, 0.15, 0.75, true];
				drawIcon3D [
					getText(getMissionConfig "CfgParty" >> "picWaypoint"),
					[_color#0, _color#1, _color#2, _adjustedMarkerAlpha],
					ASLtoAGL _markerPosition, 
					1, 
					1, 
					0,
					name _x,
					false,
					(18 * pixelH), 
					"RobotoCondensed",
					"center"
				];
			};
		};
	}forEach units (group player);
};
