disableSerialization;

params ["_display", "_button", "_mouse_pos_x", "_mouse_pos_y", "_shift", "_ctrl", "_alt"];
private _handled = false;
private _hud_lockpick = uiNamespace getVariable ["hud_lockpick", displayNull];

switch (true) do {
	case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (pizza_lockpick_rotate_pick isEqualTo 0) && (_button isEqualTo 0)) : {
		pizza_lockpick_rotate_pick = 1;
		_handled = true;
	};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (pizza_lockpick_rotate_pick isEqualTo 0) && (_button isEqualTo 1)) : {
		pizza_lockpick_rotate_pick = 2;
		_handled = true;
	};
};

_handled;
