
params [
	["_pos", [], [[]]],
	["_class", "", [""]]
];
private _grp = createGroup west;
private _mutant = _grp createUnit ["Controller_Ex_Mutant_01", [0,0,0], [], 0, "FORM"];
life_mutants pushBack _mutant; 
_mutant setPos _pos;

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
_mutant setVariable ["canMakeAttack", 0];
_mutant setVariable ["RRPSide","Controller",true];

[_mutant, "Controller_idle"] remoteExec ["switchMove",-2];  

_mutant call RRPHC_mut_controller_handlers;
_mutant call RRPHC_mut_controller_pathFind;
_mutant call RRPHC_mut_controller_idle;

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
	} forEach nearestObjects [_mutant, ["Man"], 250];  

	_myNearestEnemy = _mutant findNearestEnemy _mutant;
	
	if (((_mutant distance _myNearestEnemy) <= 100) AND (isNil {_myNearestEnemy getVariable "IsControlledBy"})) then {
		_dir = _mutant getRelDir _myNearestEnemy;
		if (_dir > 270 OR _dir < 90) then {
			if (lineIntersectsSurfaces [eyePos _myNearestEnemy, getPosASL _mutant, _myNearestEnemy, _mutant, true, 1, "GEOM", "FIRE"] isEqualTo []) then {
				[_mutant] call RRPHC_mut_controller_Attack;
			};
		};
	};

}, 0.18, _mutant] call CBA_fnc_addPerFrameHandler;

_mutant