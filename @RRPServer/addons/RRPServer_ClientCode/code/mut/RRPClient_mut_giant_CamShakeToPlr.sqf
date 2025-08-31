
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR {!alive _mutant}) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};
	if ((animationState _mutant == "Pseudogiant_walk") and {((player distance _mutant) <= 25)}) then {
		enableCamShake true;  
		addCamShake [1, 1, 30];
	};
}, 0.3, _this select 0] call CBA_fnc_addPerFrameHandler;
