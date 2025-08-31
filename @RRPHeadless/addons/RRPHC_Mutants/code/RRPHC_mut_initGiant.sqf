
params [
	["_pos", [], [[]]],
	["_class", "", [""]]
];
private _grp = createGroup west;
private _mutant = _grp createUnit ["Pseudo_RIMAS", [0,0,0], [], 0, "FORM"]; 
life_mutants pushBack _mutant;
_mutant setPos _pos;
_mutant setVariable ["UnitPos_MUT", _pos];

removeAllWeapons _mutant; 
removeAllItems _mutant; 
removeAllAssignedItems _mutant; 
removeVest _mutant; 
removeBackpack _mutant; 
removeHeadgear _mutant; 
removeGoggles _mutant; 

_mutant setSpeaker "NoVoice";

_mutant setVariable ["MUT_Zone", _class];
_mutant setVariable ["AI_CanTurn", 0];
_mutant setVariable ["IMS_IsAnimPlayed", 0];
_mutant setVariable ["canMakeAttack", 0];
_mutant setVariable ["AI_CanMakePushAttack", 0];
_mutant setVariable ["AI_CanScream", 0];
_mutant setVariable ["RRPSide","Giant",true];

[_mutant] remoteExecCall ["RRPClient_mut_giant_CamShakeToPlr", -2];

_mutant call RRPHC_mut_giant_handlers;
_mutant call RRPHC_mut_giant_idle;
_mutant call RRPHC_mut_giant_pathfind;

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
	} forEach nearestObjects [_mutant, ["Man"], 150];  

	_myNearestEnemy = _mutant findNearestEnemy _mutant;
	
	if (_mutant getVariable "canMakeAttack" == 0) then {
		if (((_mutant distance _myNearestEnemy) <= 50) AND (_mutant getVariable "AI_CanScream" == 0) AND (_mutant getVariable "AI_CanMakePushAttack" == 0)) then {
			_mutant setVariable ["AI_CanScream", 1];
			_mutant setVariable ["canMakeAttack", 1];
			_mutant setVariable ["AI_CanMakePushAttack", 1];
			[_mutant, "PSEUDOGIANT_scream"] remoteExec ["switchMove",-2];
			[_mutant] remoteExecCall ["RRPClient_mut_giant_ScreamEffect", -2];
			_soundCache = "Land_HelipadEmpty_F" createVehicle (position _mutant);
			_soundCache attachTo [_mutant,[0,0,0]];
			[_soundCache, ["giant_underground_0", 200]] remoteExecCall ["say3D",-2];
			[{
				[_this, "Pseudogiant_idle_1"] remoteExec ["switchMove",-2];
				_this setVariable ["canMakeAttack", 0];
				_this setVariable ["AI_CanMakePushAttack", 0];
			}, _mutant, 3.2] call CBA_fnc_waitAndExecute;
			[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;
			[{_this setVariable ["AI_CanScream", 0]}, _mutant, 40] call CBA_fnc_waitAndExecute;
		} else {
			_dir = _mutant getRelDir _myNearestEnemy;
			if (_dir > 270 OR _dir < 90) then {
				if (speed _myNearestEnemy >= 9) then {
					if (((_mutant distance _myNearestEnemy) <= 4) AND (_mutant getVariable "AI_CanMakePushAttack" == 0)) then {
						[_mutant] call RRPHC_mut_giant_attack;
					} else {
						if ((_mutant distance _myNearestEnemy) <= 2.3) then {
							[_mutant] call RRPHC_mut_giant_attack;
						};
					};
				} else {
					if (((_mutant distance _myNearestEnemy) <= 6) AND (_mutant getVariable "AI_CanMakePushAttack" == 0)) then {
							[_mutant] call RRPHC_mut_giant_attack;
					} else {
						if ((_mutant distance _myNearestEnemy) <= 2.3) then {
							[_mutant] call RRPHC_mut_giant_attack;
						};
					};
				};
			};
		};
	};

}, 0.18, _mutant] call CBA_fnc_addPerFrameHandler;

_mutant