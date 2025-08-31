
params ["_mutant","_sound","_seconds"];
if (isNull _mutant) exitWith {objNull};

if ((isNil {_mutant getVariable "CanMakeSoundPath"})) then {
    _mutant setVariable ["CanMakeSoundPath", 0];
	[_mutant, [_sound, 60]] remoteExecCall ["say3D",-2];
	
	[{_this setVariable ["CanMakeSoundPath", nil]}, _mutant, _seconds] call CBA_fnc_waitAndExecute;
};