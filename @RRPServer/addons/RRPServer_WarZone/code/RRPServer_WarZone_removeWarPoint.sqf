/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

params [
	["_pointID",0,[0]],
	["_player",objNull,[objNull]],
	["_pointName","",[""]]
];

try {
	private _playerName = _player call getNickName;
	if (_pointName isEqualTo "" || {_playerName isEqualTo ""}) exitWith {};

	private _membersNew = [];
	{
		if ((_x select 0) != _pointID) then {_membersNew pushBack _x};
		if ((_x select 3) isEqualTo "Server" AND (_x select 0) isEqualTo _pointID) throw "Это военное положение нельзя снять!";
	} forEach RRPServerWarZones;
	_pos = markerPos format ["war_zone_%1",_pointID];
	missionNamespace setVariable ["RRPServerWarZones",_membersNew,true];
	missionNamespace setVariable [format["RRPPublicWarZoneChat_war_zone_%1",_pointID],nil,true];
	missionNamespace setVariable [format["RRPublicImpulseZone_war_zone_%1",_pointID],nil,true];
	deleteMarker format ["war_marker_%1",_pointID];
	deleteMarker format ["war_zone_%1",_pointID];

	["Военное положение",format["%1 снял военное положение %2",_playerName,_pointName]] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];

	private _uid = getPlayerUID _player;
	[
		"Warzone","","","",false,
		[
			[
				"Steam профиль",
				[
					"**"+_playerName+" Убрал ВП с позиции**: "+ str _pos,
					"**Рядом с локацией:** " + str ([_pos] call mav_taxi_fnc_nearestLocation),
					"**Название:** "+ _pointName
				] joinString "\n",
				"https://steamcommunity.com/profiles/" + _uid,
				"fde910",false,"","",[],[]
			]
		]
	] call DiscordEmbedBuilder_fnc_buildSqf;
} catch {};
