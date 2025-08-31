params ["_ctrl", "_config", ["_code", {}]];

private _canHide = 1 != getNumber (_config >> "alwaysVisible");
private _resizeFlags = getNumber (_config >> "resizeFlags");
private _enable = 1 != getNumber (_config >> "isDisabled");
private _focus = 1 == getNumber (_config >> "isDefault");

if (getNumber (_config >> "hasBackground") == 1) then {
	_ctrl ctrlSetBackgroundColor [0,0,0,0.2];
};

_ctrl ctrlSetPixelPrecision (1 + parseNumber !false);

private _getWindow = {
	private _window = ctrlParentControlsGroup _this;
	if (isNull _window) exitWith {
		_this
	};
	_window call _getWindow
};

private _window = _ctrl call _getWindow;

if (_focus) then {
	_window setVariable ["DBUG_focusCtrl", _ctrl];
};

if (ctrlType _ctrl == 15) then {
	_focus = _ctrl getVariable ["DBUG_focusCtrl", controlNull];
	if (!isNull _focus) then {
		_window setVariable ["DBUG_focusCtrl", _focus];
	};
};

if (_resizeFlags != 0) then {
	private _ctrls = _window getVariable ["DBUG_controls", []];
	_ctrls pushBack [_ctrl, _resizeFlags, _canHide, false, ctrlFade _ctrl, _enable];
	_ctrls append (_ctrl getVariable ["DBUG_controls", []]);
	_window setVariable ["DBUG_controls", _ctrls];
};

_ctrl setVariable ["DBUG_config", _config];

_ctrl ctrlEnable _enable;

_ctrl ctrlSetPixelPrecision 2;

private _IDC = -ctrlIDC _ctrl;

private _name = configName _config;

if (_window isEqualTo _ctrl) then {
	ctrlParent _window setVariable [_name, _ctrl];
	_window setVariable ["DBUG_class", _name select [5]];

	for "_i" from 1 to 4 do {
		private _border = format ["Border%1", _i];
		(_window getVariable [_border, controlNull]) ctrlSetBackgroundColor DBUG_colorBorder;
	};

	(_window getVariable ["Background", controlNull]) ctrlSetBackgroundColor DBUG_colorWinBackground;
} else {
	if (_IDC == 100) exitWith {};

	if (_IDC == 101) exitWith {
		private _vars = ctrlParentControlsGroup _ctrl getVariable ["DBUG_vars", []];
		if (0 == _vars pushBack _name) then {
			ctrlParentControlsGroup _ctrl setVariable ["DBUG_vars", _vars];
		};

		ctrlParentControlsGroup _ctrl setVariable [_name, _ctrl];
	};

	if (ctrlType _ctrl == 15) then {
		private _vars = _window getVariable ["DBUG_vars", []];
		private _varsCtrl = _ctrl getVariable ["DBUG_vars", []];

		{
			_window setVariable [_x, _ctrl getVariable _x];

			if (0 == _vars pushBack _x) then {
				_window setVariable ["DBUG_vars", _vars];
			};
		} forEach (_varsCtrl - ["DBUG_controls"]);
	};

	if (_IDC < 100) exitWith {};

	_ctrl setVariable ["DBUG_class", _name];
	_window setVariable [_name, _ctrl];

	private _vars = _window getVariable ["DBUG_vars", []];
	if (0 == _vars pushBack _name) then {
		_window setVariable ["DBUG_vars", _vars];
	};
};

call _code;
