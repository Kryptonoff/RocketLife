enableCamShake true;
addCamShake [6, 3, 30];
if (isSprintAllowed player) then {
	player allowSprint false;
	[{_this allowSprint true}, player, 1] call CBA_fnc_waitAndExecute;
};
