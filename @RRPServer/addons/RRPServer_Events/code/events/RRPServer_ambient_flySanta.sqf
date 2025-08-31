/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private["_targetPlayer", "_flyHeight", "_speed", "_direction", "_targetPosition", "_distance", "_endPosition", "_planeClass", "_i", "_startPosition", "_pilot", "_plane", "_waypoint"];
_group = createGroup independent;
_targetPlayer = selectRandom allPlayers;
format ["Ambient Fly Over - Heading to %1...", _targetPlayer] call RRPServer_util_log;
_flyHeight = 75;
_speed = 200;
_direction = random 360;
_targetPosition = 
[
	(getPosWorld _targetPlayer) select 0, 
	(getPosWorld _targetPlayer) select 1, 
	_flyHeight
];
_distance = worldSize * 0.75;
_endPosition = 
[
	(_targetPosition select 0) - (sin _direction) * _distance,
	(_targetPosition select 1) - (cos _direction) * _distance,
	_flyHeight
];
_planeClass = "jean_sleigh";
for "_i" from 1 to (1 + (floor (random 3))) do 
{
	_distance = 4000 + (_i * 400);
	_startPosition = 
	[
		(_targetPosition select 0) + (sin _direction) * _distance,
		(_targetPosition select 1) + (cos _direction) * _distance,
		800 
	];
	_pilot = _group createUnit ["I_helicrew_F", _startPosition, [], 100, "NONE"];
	_pilot setSkill 1;
	[_pilot] joinSilent _group;
	clearBackpackCargoGlobal _pilot;
	clearWeaponCargoGlobal _pilot;
	clearMagazineCargoGlobal _pilot;
	clearItemCargoGlobal _pilot;
	_pilot forceAddUniform (selectRandom ["xmas_santa_blufor_uniform","xmas_santa_ind_uniform","xmas_santa_opfor_uniform","xmas_santa_uniform"]);
	_plane = createVehicle [_planeClass, _startPosition, [], 100, "FLY"];
	clearBackpackCargoGlobal _plane;
	clearWeaponCargoGlobal _plane;
	clearMagazineCargoGlobal _plane;
	clearItemCargoGlobal _plane;
	_plane setVehicleAmmo 0;
	_plane setFuel 1;
	_pilot assignAsDriver _plane;
	_pilot moveInDriver _plane;
	_pilot allowDamage false;
	_plane allowDamage false;
	_plane flyInHeight _flyHeight;
	_plane disableAI "TARGET";
	_plane disableAI "AUTOTARGET";
	_plane setDir _direction;
	_plane setVelocity [(sin _direction) * _speed, (cos _direction) * _speed, 0];
};
_group allowFleeing 0;
_group setBehaviour "CARELESS";
_group setSpeedMode "FULL";
_group setFormation "WEDGE";
_group setCombatMode "BLUE";
_waypoint = _group addWaypoint [getPosWorld _targetPlayer, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 800;
_waypoint setWaypointStatements ["true", "'Ambient Fly Over - Reached player...' call RRPServer_util_log;"];
_waypoint = _group addWaypoint [_endPosition, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 800;
_waypoint setWaypointStatements ["true", "'Ambient Fly Over - Reached end...' call RRPServer_util_log; { deleteVehicle (vehicle _x); deleteVehicle _x; } forEach thisList;"];
