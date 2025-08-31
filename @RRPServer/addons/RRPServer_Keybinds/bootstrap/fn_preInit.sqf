/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

private _path = "\RRPServer_Keybinds\";

//-- Server
[

]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

//-- Client
[
	"RRPClient_gui_settings_event_save",
	"RRPClient_gui_settings_onLoad",
	"RRPClient_gui_settings_onUnload",
	"RRPClient_gui_settings_tab_keybinding_event_onClearButtonClick",
	"RRPClient_gui_settings_tab_keybinding_event_onDropdownLBSelChanged",
	"RRPClient_gui_settings_tab_keybinding_event_onKeyDown",
	"RRPClient_gui_settings_tab_keybinding_event_onKeyUp",
	"RRPClient_gui_settings_tab_keybinding_event_onLBDoubleClick",
	"RRPClient_gui_settings_tab_keybinding_event_onLBSelChanged",
	"RRPClient_gui_settings_tab_keybinding_event_save",
	"RRPClient_gui_settings_tab_keybinding_onLoad",
	"RRPClient_system_keybinding_add",
	"RRPClient_system_keybinding_get",
	"RRPClient_system_keybinding_initialize",
	"RRPClient_system_keybinding_remove",
	"RRPClient_util_keybinding_getStringedDik"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};

true
