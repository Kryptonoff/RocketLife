disableSerialization;

// Init event handler parameters and return
params ["_display", "_button", "_mouse_pos_x", "_mouse_pos_y", "_shift", "_ctrl", "_alt"];
private _handled = false;

// Lockpick minigame
private _hud_lockpick = uiNamespace getVariable ["hud_lockpick", displayNull];

switch true do {
	case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_button isEqualTo 0)) : {pizza_lockpick_rotate_pick = 0};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_button isEqualTo 1)) : {pizza_lockpick_rotate_pick = 0};
};

_handled;
