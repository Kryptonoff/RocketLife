params [
	["_pos", [], [[]]],
	["_mainDog", true, [true]],
	["_mainDogObject", objNull, [objNull]]
];
private _grp = createGroup west;
private _mutant = _grp createUnit ["Dog_02", [0,0,0], [], 0, "FORM"]; 
life_mutants pushBack _mutant;
_mutant setPos _pos;

_mutant setSpeaker "NoVoice";

_mutant setVariable ["IMS_IsAnimPlayed", 0];
_mutant setVariable ["canMakeAttack", 0];
_mutant setVariable ["AI_CanTurn", 0];
_mutant setVariable ["AI_CanGrab", 0];
_mutant setVariable ["AI_IsDogAngry", 0];
_mutant setVariable ["AI_IsCanHollow", 0];
_mutant setVariable ["UnitPos_MUT", _pos];
_mutant setVariable ["RRPSide","Dog",true];

_mutant call RRPHC_mut_dog_handlers;
_mutant call RRPHC_mut_dog_pathFind;

if (_mainDog) then {
	_mutant call RRPHC_mut_dog_idle;
	[_mutant, (selectRandom ["bdog_distant_0","bdog_distant_1","bdog_distant_2","bdog_distant_3"]), 620] call CBA_fnc_globalSay3d;
	_pos = getPos _mutant;
	[[(_pos select 0) + random 10, (_pos select 1) + random 10, (_pos select 2)], false, _mutant] call RRPHC_mut_initDog;
	[[(_pos select 0) + random 10, (_pos select 1) + random 10, (_pos select 2)], false, _mutant] call RRPHC_mut_initDog;
	[[(_pos select 0) + random 10, (_pos select 1) + random 10, (_pos select 2)], false, _mutant] call RRPHC_mut_initDog;
} else {
	[_mutant, _mainDogObject] call RRPHC_mut_dog_idle_puppet;
};

[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	_mutant action ["SwitchWeapon", _mutant, _mutant, 100]; 
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
			if !(_ifInter) then {
				_mutant reveal [_x, 4]; 
			};
		};
	} forEach nearestObjects [_mutant, ["Man"], 20];  

	_myNearestEnemy = _mutant findNearestEnemy _mutant;
	if (((_myNearestEnemy distance _mutant) < 8) or (animationState _myNearestEnemy in ["psina_victim_out_killpes", "psina_victim_out", "psina_victim_loop", "psina_victim_in"])) then {
		_mutant setVariable ["AI_IsDogAngry", 1];
	};
	
	_rndHollow = random 100;
	if (_mainDog and (_rndHollow < 90) and (_mutant getVariable "canMakeAttack" == 0) and (_mutant getVariable "AI_IsDogAngry" == 1) and (_mutant getVariable "AI_IsCanHollow" == 0) and !(animationState _mutant in ["psina_victim_out_killpes", "psina_victim_out", "psina_victim_loop", "psina_victim_in"])) then {
		_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
		_soundCache attachTo [_mutant, [0, 0, 0.2]]; 
		_mutant setVariable ["AI_IsCanHollow", 1];
		{
			if (uniform _x in ["Dog_01","Dog_02","Dog_03","Dog_04"]) then {
				_nearEnemy = _x findNearestEnemy _x;
				group _x setSpeedMode "FULL";
				_x doMove [(getPos _nearEnemy select 0),(getPos _nearEnemy select 1), 0];
				_x reveal [_nearEnemy, 4]; 
				if (animationState _x in ["psina_idle_dig", "psina_idle_smellaround", "psina_idle_smell"]) then {
					[_x, "Psina_idle_1"] remoteExec ["switchMove",-2];
				};
				if (animationState _x in ["psina_sit_to_lie", "psina_lie_idle"]) then {
					[_x, "Psina_lie_to_idle"] remoteExec ["switchMove",-2];
	
					[{
						if (alive _this) then {[_this, "Psina_idle_1"] remoteExec ["switchMove",-2]}
					}, _x, 1] call CBA_fnc_waitAndExecute;
				};
				if ((animationState _x == "Psina_sit_idle") or (animationState _x == "Psina_idle_to_sit")) then {
					[_x, "Psina_sit_to_idle"] remoteExec ["switchMove",-2];

					[{
						if (alive _this) then {[_this, "Psina_idle_1"] remoteExec ["switchMove",-2]}
					}, _x, 0.8] call CBA_fnc_waitAndExecute;
				};
			};
		} forEach nearestObjects[_mutant, ["Man"], 50];

		[_mutant, "Psina_idle_howl"] remoteExec ["switchMove",-2];
		[_soundCache, (selectRandom ["bdog_howl_0","bdog_howl_1","bdog_howl_2"]), 320] call CBA_fnc_globalSay3d;
		[{

			if ((alive _this) and (animationState _this == "Psina_idle_howl")) then {
				[_this, "Psina_run"] remoteExec ["switchMove",-2];
				[{_this setVariable ["AI_IsCanHollow", 0]}, _this, 17] call CBA_fnc_waitAndExecute;
			};
		}, _mutant, 3.5] call CBA_fnc_waitAndExecute;
		[{deleteVehicle _this}, _soundCache, 7.5] call CBA_fnc_waitAndExecute;
	};
	
	_ifInter = lineIntersectsSurfaces [
		AGLToASL (_mutant modelToWorld [0,0,0.1]), 
		AGLToASL (_myNearestEnemy modelToWorld [0,0,0.1]), 
		_mutant,
		_myNearestEnemy,
		true,
		1,
		"GEOM",
		"NONE"
	];
	_dir = _mutant getRelDir _myNearestEnemy;
	if (_dir > 270 OR _dir < 90) then {
		if (((_mutant distance _myNearestEnemy) <= 4.2) and (_mutant getVariable "AI_CanGrab" == 0) and (_ifInter isEqualTo [])) then {
			[_mutant, _myNearestEnemy] call RRPHC_mut_dog_attackCatch;
			_mutant setVariable ["AI_IsDogAngry", 1];
		} else {
			if ((_mutant distance _myNearestEnemy) <= 2.2) then {
				_mutant call RRPHC_mut_dog_attack;
				_mutant setVariable ["AI_IsDogAngry", 1];
			};
		};
	};
}, 0.18, _mutant] call CBA_fnc_addPerFrameHandler;

_mutant
