
params [
	["_pos", [], [[]]],
	["_class", "", [""]]
];
private _grp = createGroup west;
private _mutant = _grp createUnit ["BS_Ex_Mutant_01", [0,0,0], [], 0, "FORM"]; 
_mutant setPos _pos;
life_mutants pushBack _mutant;

removeAllWeapons _mutant; 
removeAllItems _mutant; 
removeAllAssignedItems _mutant; 
removeVest _mutant; 
removeBackpack _mutant; 
removeHeadgear _mutant; 
removeGoggles _mutant; 

_mutant setSpeaker "NoVoice";

_mutant setVariable ["MUT_Zone", _class];
_mutant setVariable ["canMakeAttack", 0];
_mutant setVariable ["AI_CanTurn", 0];
_mutant setVariable ["IMS_IsAnimPlayed", 0];
_mutant setVariable ["AI_CanGrab", 0];
_mutant setVariable ["AI_CanScream", 0];
_mutant setVariable ["AI_GrabbedPerson", objNull];
_mutant setVariable ["UnitPos_MUT", _pos];
_mutant setVariable ["RRPSide","BloodSucker",true];

[_mutant, "KROVOSOS_IDLE"] remoteExecCall ["switchMove",-2];

_mutant call RRPHC_mut_bloodsucker_handlers;
_mutant call RRPHC_mut_bloodsucker_idle;
_mutant call RRPHC_mut_bloodsucker_pathFind;

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
			if (!(_ifInter)) then {
				_mutant reveal [_x, 4]; 
			};
		};
	} forEach nearestObjects [_mutant, ["Man"], 200];  

	_myNearestEnemy = _mutant findNearestEnemy _mutant;

	if (!(isNull _myNearestEnemy) AND (alive _mutant) AND !(animationState _mutant in ["krovosos_catch_start_main", "krovosos_catch_loop_main", "krovosos_catch_end_main", "krovosos_catch_end_suck_main"])) then {
		_notAlone = ((nearestObjects [_mutant, ["Man"], 50]) - [_myNearestEnemy]) findIf {isPlayer _x} != -1;
		_insideBuilding = _myNearestEnemy call RRPHC_mut_inHouse; 
		_insideBuilding_mutant = _mutant call RRPHC_mut_inHouse; 
		_pos = (_myNearestEnemy modelToWorld [0,-10,0]);
		_actPos = ATLToASL [_pos select 0,_pos select 1, 0];
		_ifInter = lineIntersectsSurfaces [ eyePos _mutant, _actPos, _mutant, _myNearestEnemy, true, 1, "GEOM", "NONE"];
		_dir = _mutant getRelDir _myNearestEnemy;

		if (_dir > 270 OR _dir < 90) then {
			if ((isPlayer _myNearestEnemy) AND !(uniform _myNearestEnemy in mutantsForms) AND (count _ifInter == 0) AND _notAlone AND (_mutant getVariable "AI_CanGrab" == 0) AND (_mutant getVariable "canMakeAttack" == 0) AND !(_insideBuilding) AND !(_insideBuilding_mutant) AND !(animationState _myNearestEnemy in sr_mutants_catchAnims)) then {
				if ((_mutant distance _myNearestEnemy) <= 3.5) then {
					[_mutant, _myNearestEnemy] call RRPHC_mut_bloodsucker_attackCatch;
				};
			} else {
				if (speed _myNearestEnemy >= 11) then {
					if ((_mutant distance _myNearestEnemy) <= 3.5) then {
						[_mutant, 1] call RRPHC_mut_bloodsucker_attack;
					};
				} else {
					if ((_mutant distance _myNearestEnemy) <= 3.1) then {
						[_mutant, 0] call RRPHC_mut_bloodsucker_attack;
					};
				};
			};
		};
	};
	if (!(isNull _myNearestEnemy) AND (_mutant getVariable "AI_CanScream" == 0) AND (alive _mutant) AND !(animationState _mutant in ["krovosos_catch_start_main", "krovosos_catch_loop_main", "krovosos_catch_end_main", "krovosos_catch_end_suck_main"])) then {
		[_mutant, "KROVOSOS_roar"] remoteExec ["switchMove",-2];
		_mutant setVariable ["AI_CanScream", 1];
		[_mutant, selectRandom ["player_scared_breathe","player_scared_breathe_2"], 320] remoteExecCall ["RRPClient_mut_chimera_playerSob", -2];

		_soundCache = "Land_HelipadEmpty_F" createVehicle (position _mutant);
		_soundCache attachTo [_mutant,[0,0,0]];
		[_soundCache, ["bloodsucker_distant_growl_1", 400]] remoteExecCall ["say3D",-2];
		[{deleteVehicle _this}, _soundCache, 8] call CBA_fnc_waitAndExecute;
		[{_this setVariable ["AI_CanScream", 0]}, _mutant, 128] call CBA_fnc_waitAndExecute;
		
		removeUniform _mutant; 
		_mutant forceAddUniform "BS_Ex_Mutant_01";
		[{if ((animationState _this == "KROVOSOS_roar") AND (alive _this)) then {[_this, "KROVOSOS_IDLE"] remoteExec ["switchMove",-2]}}, _mutant, 1.8] call CBA_fnc_waitAndExecute;
	};
}, 0.18, _mutant] call CBA_fnc_addPerFrameHandler;

_mutant