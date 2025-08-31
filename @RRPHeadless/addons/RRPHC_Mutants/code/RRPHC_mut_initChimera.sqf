
params [
	["_pos", [], [[]]],
	["_class", "", [""]]
];
private _grp = createGroup west;
private _mutant = _grp createUnit ["Chimera_RIMAS", [0,0,0], [], 0, "FORM"]; 
life_mutants pushBack _mutant;
_mutant setPos _pos;

_mutant setSpeaker "NoVoice";

_mutant setVariable ["MUT_Zone", _class];
_mutant setVariable ["canMakeAttack", 0];
_mutant setVariable ["AI_CanTurn", 0];
_mutant setVariable ["IMS_IsAnimPlayed", 0];
_mutant setVariable ["ContinueAttack", 0];
_mutant setVariable ["UnitPos_MUT", _pos];
_mutant setVariable ["RRPSide","Chimera",true];

private _trees = count nearestTerrainObjects [_mutant, ["TREE","SMALL TREE","BUSH"], 30];   
[_mutant, ["chimera_distant_roar", 720]] remoteExecCall ["say3D",-2];
[_mutant, "player_scared_breathe_2", 500] remoteExecCall ["RRPClient_mut_chimera_playerSob", -2];
if (_trees > 1) then {
	_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
	[_soundCache, ["chimera_roar_birdsFly", 620]] remoteExecCall ["say3D",-2];
	[{deleteVehicle _this}, _soundCache, 12] call CBA_fnc_waitAndExecute;
};

_mutant call RRPHC_mut_chimera_handlers;
_mutant call RRPHC_mut_chimera_idle;
_mutant call RRPHC_mut_chimera_pathfind;

[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	_mutant allowDamage false;
	_mutant disableAI "MINEDETECTION";
	_mutant disableAI "WEAPONAIM";
	_mutant disableAI "SUPPRESSION";
	_mutant disableAI "COVER";
	_mutant disableAI "AIMINGERROR";
	_mutant disableAI "TARGET";
	_mutant disableAI "AUTOCOMBAT";
	_mutant disableAI "FSM";
	_mutant setBehaviour "CARELESS";  
 
	{ 
		if (isPlayer _x AND (_mutant knowsAbout _x != 4)) then {
			_ifInter = lineIntersects [getPosASL _mutant, eyePos _x, _mutant, _x];
			if (!(_ifInter) OR (speed _x > 8)) then {
				_mutant reveal [_x, 4]; 
			};
		};
	} forEach nearestObjects [_mutant, ["Man"], 300];  

	_myNearestEnemy = _mutant findNearestEnemy _mutant;

	if (_mutant getVariable "canMakeAttack" == 0) then {
		_dir = _mutant getRelDir _myNearestEnemy;
		if (_dir > 270 OR _dir < 90) then {
			_ifInter = lineIntersectsSurfaces [ eyePos _myNearestEnemy, getPosASL _mutant, _myNearestEnemy, _mutant, true, 1, "GEOM", "FIRE"];
			if (_ifInter isEqualTo []) then {
				if (speed _myNearestEnemy >= 9) then {
					if ((_mutant distance _myNearestEnemy) <= 9) then {
						[_mutant] call RRPHC_mut_chimera_attack;
					};
				} else {
					if ((_mutant distance _myNearestEnemy) <= 13) then {
						[_mutant] call RRPHC_mut_chimera_attack;
					};
				};
			};
		};
	};
}, 0.1, _mutant] call CBA_fnc_addPerFrameHandler;

_mutant