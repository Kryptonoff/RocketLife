
params [
	["_pos", [], [[]]],
	["_class", "", [""]]
];
private _grp = createGroup west;
private _mutant = _grp createUnit ["Burer_RIMAS", [0,0,0], [], 0, "FORM"];
life_mutants pushBack _mutant;
_mutant setPos _pos;
_mutant setVariable ["UnitPos_MUT", _pos];

_mutant setSpeaker "NoVoice";

_mutant setVariable ["MUT_Zone", _class];
_mutant setVariable ["canMakeAttack", 0];
_mutant setVariable ["AI_CanTurn", 0];
_mutant setVariable ["IMS_IsAnimPlayed", 0];
_mutant setVariable ["AI_CanMakePushAttack", 0];
_mutant setVariable ["AI_CanMakeTakeAttack", 0];
_mutant setVariable ["AI_CanMakeShieldAttack", 0];
_mutant setVariable ["RRPSide","Burer",true];

_mutant call RRPHC_mut_burrer_handlers;
_mutant call RRPHC_mut_burrer_idle;
_mutant call RRPHC_mut_burrer_pathFind;

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
	
	if (_mutant getVariable "canMakeAttack" == 0) then {
		_dir = _mutant getRelDir _myNearestEnemy;
		if (_dir > 270 OR _dir < 90) then {
			_ifInter = lineIntersectsSurfaces [ eyePos _myNearestEnemy, getPosASL _mutant, _myNearestEnemy, _mutant, true, 1, "GEOM", "FIRE"];
			if (_ifInter isEqualTo []) then {
				if (speed _myNearestEnemy >= 9) then {
					if (
						((_mutant distance _myNearestEnemy) <= 15 and 
						((_mutant getVariable "AI_CanMakePushAttack" == 0) OR (_mutant getVariable "AI_CanMakeTakeAttack" == 0 AND _mutant getVariable "AI_CanMakeShieldAttack" == 1))) OR 
						((_mutant distance _myNearestEnemy) <= 2)
						) then {
						[_mutant] call RRPHC_mut_burrer_attack;
					};
				} else {
					if (((_mutant distance _myNearestEnemy) <= 25 and ((_mutant getVariable "AI_CanMakePushAttack" == 0) OR (_mutant getVariable "AI_CanMakeTakeAttack" == 0 AND _mutant getVariable "AI_CanMakeShieldAttack" == 1))) OR ((_mutant distance _myNearestEnemy) <= 2.5)) then {
						[_mutant] call RRPHC_mut_burrer_attack;
					};
				};
			};
		};
	};

}, 0.18, _mutant] call CBA_fnc_addPerFrameHandler;

_mutant