
if !(canSuspend) exitWith {_this spawn RRPClient_VR_rotationSpeed};
_lastTarget = objNull;
_status = "down";

while {!isNull _this} do {
	if (cursorTarget == _this) then {
		if (isNull _lastTarget) then {
			playSound "Topic_Selection";
			_lastTarget = player;
		};
	} else {
		_lastTarget = objNull;
	};
	if (cursorTarget == _this || ([player, _this] call BIS_fnc_distance2D) < 2) then {
		_this setVariable ["BIS_VR_speed", 10];
	} else {
		_this setVariable ["BIS_VR_speed", 1];
	};
	if (([player, _this] call BIS_fnc_distance2D) < 2) then {
		if (_status == "down") then {
			_status = "up";
			_this spawn {
				while {(position _this) select 2 < 2 && ([player, _this] call BIS_fnc_distance2D) < 2} do {
					_this setPos [position _this select 0, position _this select 1, (position _this select 2) + 0.1];
					uiSleep 0.01;
				};
			};

		};
	} else {
		if (_status == "up") then {
			_status = "down";
			_this spawn {
				while {(position _this) select 2 > 0 && ([player, _this] call BIS_fnc_distance2D) >= 2} do {
					_this setPos [position _this select 0, position _this select 1, (position _this select 2) - 0.1];
					uiSleep 0.01;
				};
			};
		};
	};
	uiSleep 0.25;
};
