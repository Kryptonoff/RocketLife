/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ["_Title","_text","_display","_bg","_strText","_btnSkeep","_displayFade"];
skip = false;
_Title =	_this select 0;
_text =	_this select 1;

if !((_this select 2) isEqualTo 0) then {
  _displayFade =	findDisplay(_this select 2);
};

_display = findDisplay 46 createDisplay "RscDisplayEmpty";
_display displayAddEventHandler ["unload","skip = nil"];

_bg = _display ctrlCreate ["RRP_background", -1];
_bg ctrlSetBackgroundColor [0.93, 0.86, 0.0,1];
_bg ctrlSetPosition [0.407189 * safezoneW + safezoneX,0.334959 * safezoneH + safezoneY,0.185621 * safezoneW,0.24206 * safezoneH];

_strText = _display ctrlCreate ["RRP_RscStructuredText", -1];
_strText ctrlSetBackgroundColor [0.1, 0.1, 0.1,0.3];
_strText ctrlSetPosition  [0.417502 * safezoneW + safezoneX,0.356965 * safezoneH + safezoneY,0.164997 * safezoneW,0.187046 * safezoneH];

_btnSkeep = _display ctrlCreate ["RscButton", 2001];
_btnSkeep ctrlSetBackgroundColor [1.0, 0.0, 0.36,1];
_btnSkeep ctrlSetPosition [0.463907 * safezoneW + safezoneX,0.55 * safezoneH + safezoneY,0.0618738 * safezoneW,0.0220054 * safezoneH];
_btnSkeep ctrlSetText "Продолжить";
_btnSkeep buttonSetAction "skip = nil;";
_btnSkeep ctrlEnable false;

{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach [_bg,_strText,_btnSkeep];

if !((_this select 2) isEqualTo 0) then {
  {
    [_displayFade, _x, ctrlPosition _x, 0.5, 0.4] call RRPClient_gui_util_animateAllCtrl;
    _x ctrlEnable false;
  } forEach (allControls _displayFade);
};

_strText ctrlSetStructuredText parseText format ["<t shadow = '1' size = '1.5' font = 'RobotoCondensedBold' color = '#ffffff'>%1</t><br/><t  size = '1' font = 'RobotoCondensed' color = '#ffffff' shadow = '1'>%2</t>",_Title,_text];

uisleep 2;
_btnSkeep ctrlEnable true;
waitUntil {isNil "skip"};
{
  [_display, _x, ctrlPosition _x, 1, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach [_bg,_strText,_btnSkeep];

if !((_this select 2) isEqualTo 0) then {
  {
    [_displayFade, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
    _x ctrlEnable true;
  } forEach (allControls _displayFade);
};

waitUntil {ctrlCommitted _btnSkeep};
{
  ctrlDelete _x;
} forEach [_bg,_strText,_btnSkeep];
_display closeDisplay 2;
