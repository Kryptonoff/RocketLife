
private _mutant = _this select 0;

private _objAttach = _mutant getVariable "AI_GrabbedPerson";
if (!isNull _objAttach) then {
	detach _objAttach;
	[_objAttach, true] remoteExecCall ["setUnconscious", _objAttach];
	[_objAttach, false] remoteExecCall ["setCaptive", _objAttach];
};

removeUniform _mutant; 
_mutant forceAddUniform "BS_Ex_Mutant_01";

private _soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
_soundCache attachTo [_mutant, [0, 0, 0.2], "Spine3"]; 
[_soundCache, [selectRandom ["bloodsucker_die_0","bloodsucker_die_1","bloodsucker_die_2","bloodsucker_die_3"], 120]] remoteExecCall ["say3D",-2];

[{removeUniform _this; _this forceAddUniform "BS_Ex_Mutant_01"}, _mutant, 2] call CBA_fnc_waitAndExecute;
[{removeUniform _this; _this forceAddUniform "BS_Ex_Mutant_01"}, _mutant, 4] call CBA_fnc_waitAndExecute;
[{deleteVehicle _this;}, _soundCache, 6] call CBA_fnc_waitAndExecute;
[{[_this, false] remoteExecCall ["setUnconscious", _this]}, _objAttach, 11] call CBA_fnc_waitAndExecute;