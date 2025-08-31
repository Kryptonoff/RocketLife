params [
	["_pos", [], [[]]],
	["_class", "", [""]]
];
private _grp = createGroup west;
private _mutant = _grp createUnit ["Zombie_Ex_Mutant_01", [0,0,0], [], 0, "FORM"]; 
life_mutants pushBack _mutant;
_mutant setPos _pos;

private _randomuni = selectRandom ["Zombie_Ex_Mutant_01","Zombie_Ex_Mutant_02","Zombie_Ex_Mutant_03","Zombie_Ex_Mutant_04","Zombie_Ex_Mutant_05","Zombie_Ex_Mutant_06","Zombie_Ex_Mutant_07","Zombie_Ex_Mutant_08","Zombie_Ex_Mutant_09","Zombie_Ex_Mutant_10"];
_mutant forceAddUniform _randomuni;
_mutant setRandomLip true;

removeAllWeapons _mutant; 
removeAllItems _mutant; 
removeAllAssignedItems _mutant; 
removeVest _mutant; 
removeBackpack _mutant; 
removeHeadgear _mutant; 
removeGoggles _mutant; 

group _mutant setSpeedMode "FULL";
_mutant setSpeaker "NoVoice";

_mutant setVariable ["MUT_Zone", _class];
_mutant setVariable ["AI_CanGrab", 0];
_mutant setVariable ["IMS_IsAnimPlayed", 0];
_mutant setVariable ["canMakeAttack", 0];
_mutant setVariable ["AI_CanTurn", 0];
_mutant setVariable ["RRPSide","Zombie",true];

[_mutant, "Zombie_Unnarmed_idle"] remoteExec ["switchMove",-2];
 
_mutant call RRPHC_mut_zombie_handlers;
_mutant call RRPHC_mut_zombie_idle;
_mutant call RRPHC_mut_zombie_pathFind;

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
			if !(_ifInter) then {
				_mutant reveal [_x, 4]; 
			};
		};
	} forEach nearestObjects [_mutant, ["Man"], 80];  

	_myNearestEnemy = _mutant findNearestEnemy _mutant;
	
	if ((_mutant distance _myNearestEnemy) <= 1.8) then {
		_dir = _mutant getRelDir _myNearestEnemy;
		if (_dir > 270 OR _dir < 90) then {
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
			if (_ifInter isEqualTo []) then {
				if ((_mutant getVariable "AI_CanGrab" == 0) and !(uniform _myNearestEnemy in mutantsForms) AND !(animationState _myNearestEnemy in sr_mutants_catchAnims)) then {
					[_mutant, _myNearestEnemy] call RRPHC_mut_zombie_attackCatch;
				} else {
					if !((animationState _myNearestEnemy) in ["plagued_armed_melee_noweapon_catch_victim", "plagued_armed_melee_noweapon_catch_victim_behind", "plagued_armed_melee_noweapon_catch_zombie"]) then {
						[_mutant] call RRPHC_mut_zombie_attack;
					};
				};
			};
		};
	};

}, 0.18, _mutant] call CBA_fnc_addPerFrameHandler;

_mutant