

params ["_window", "_checked"];

str _this call debugConsole;

_togglerVar = _window getVariable ["ToggleAction",""];
if (_togglerVar isEqualTo "") exitWith {"onToggle: no action" call chat};


private _ball = (_window getVariable ["Ball", controlNull]);
private _fill = (_window getVariable ["Fill", controlNull]);
private _border = (_window getVariable ["Border", controlNull]);

(ctrlPosition _border) params ["_x", "_y", "_w"];
if (_checked in [1, true]) then {
	_fill ctrlSetTextColor [0.3, 0.3, 1, 1];
	_border ctrlSetTextColor [0.3, 0.3, 1, 1];
	_ball ctrlSetPosition [_x + _w/4, _y];
	playSound "AppSwitchOn";
} else {
	_fill ctrlSetTextColor [0.1, 0.1, 0.1, 1];
	_border ctrlSetTextColor [0.85, 0.85, 0.85, 1];
	_ball ctrlSetPosition [_x - _w/4, _y];
	playSound "AppSwitchOff";
};

call compile _togglerVar;
_ball ctrlCommit 0.1;
