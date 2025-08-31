/*
	Project: Aurora Role Play
	Author: FaityTale5571
	License: CC BY-ND
*/

[
	"RRPClient_hotkeys_clickToLeftMenuButton",
	"RRPClient_hotkeys_deleteBind",
	"RRPClient_hotkeys_hudWeaponHide",
	"RRPClient_hotkeys_hudWeaponUpdate",
	"RRPClient_hotkeys_menuOnDraw",
	"RRPClient_hotkeys_mouseButtonHandler",
	"RRPClient_hotkeys_openMenu",
	"RRPClient_hotkeys_switchWeapon",
	"RRPClient_hotkeys_switchWeaponHandler",
	"RRPClient_hotkeys_useHotKey"
]apply {
  missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["\RRPServer_Hotkeys\client\%1.sqf",_x],true];
};


true
