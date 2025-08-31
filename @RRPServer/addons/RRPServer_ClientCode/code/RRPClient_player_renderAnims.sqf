
private _createParentAction = {
	params [
		"_name","_displayName",["_icon",""],["_statement",{}],["_condition",{}]
	];
	diag_log format ["Action: %1",_this];
	if (_icon isEqualTo "") then {_icon = "\a3\ui_f\data\map\markers\handdrawn\dot_ca.paa"};
	_action = [_name,_displayName,_icon,_statement,_condition] call ace_interact_menu_fnc_createAction;
	_action = [player, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;

};

private _createSubAction = {
	params [
		"_pName","_name","_displayName",["_icon",""],["_statement",{}],["_condition",{}]
	];
	diag_log format ["SubAction: %1",_this];
	if (_icon isEqualTo "") then {_icon = "\a3\ui_f\data\map\markers\handdrawn\dot_ca.paa"};
	_action = [_name,_displayName,_icon,_statement,_condition] call ace_interact_menu_fnc_createAction;
	_action = [player, 1, ["ACE_SelfActions", _pName], _action, true] call ace_interact_menu_fnc_addActionToObject;
};

private _config = getMissionConfig "CfgAnimations";
{
	_insideCategoryClass = _x;
	private _pName = configName _insideCategoryClass;
	private _pDisplayName = getText(_insideCategoryClass >> "displayName");
	private _pIcon = getText(_insideCategoryClass >> "icon");
	private _pFunction = (getText(_x >> "f"));
	private _pCondition = (getText(_x >> "condition"));
	[_pName, _pDisplayName, _pIcon, compile _pFunction, compile _pCondition] call _createParentAction;
	if !(isClass (_insideCategoryClass >> "Animations")) then {continue};
	{
		private _animPath = _x;
		private _name = configName _animPath;
		private _displayName = getText(_animPath >> "displayName");
		private _icon = getText(_animPath >> "icon");
		private _Function = (getText(_x >> "f"));
		private _Condition = (getText(_x >> "condition"));
		[_pName,_name,_displayName,_icon,compile _Function, compile _Condition] call _createSubAction;
	} forEach ("true" configClasses (_insideCategoryClass >> "Animations"));
} forEach ("true" configClasses _config);
