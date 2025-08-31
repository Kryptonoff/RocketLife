/*
  File: fn_hideLoadingScreen.sqf
  Function: lobo_fnc_hideLoadingScreen
  Author: LoboArdiente
*/

private _display = uiNamespace getVariable ["Loading_Display", displayNull];

if (!isNull _display) then {
	[_display] spawn {
		params ["_display"];
		
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 0.25;
		"dynamicBlur" ppEffectEnable false;
		allControls _display apply {
			_x ctrlSetFade 1;
			_x ctrlCommit 0.25;
		};
		uiSleep 0.25;
		_display closeDisplay 1;
	};
};