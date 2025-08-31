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
private ["_defaultIDC","_display","_lastIndicator","_curIndicator"];
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};
_defaultIDC = 1024;
_lastIndicator = _display displayCtrl (curSlider + _defaultIDC);
_lastIndicator ctrlSetText '\RRP_icons\forBeginners\indicator_OFF.paa';
[_lastIndicator,1,0.1] call BIS_fnc_ctrlSetScale;

if (_this) then {
  if (curSlider >= amountIndicators) then {curSlider = 0};
  curSlider = curSlider + 1;
  } else {
    if (curSlider <= 1) then {curSlider = amountIndicators + 1};
    curSlider = curSlider - 1;
};
_curIndicator = _display displayCtrl (curSlider + _defaultIDC);
_curIndicator ctrlSetText '\RRP_icons\forBeginners\indicator_ON.paa';
[_curIndicator,1.3,0.1] call BIS_fnc_ctrlSetScale;
call RRPClient_forBeginner_updatePage;
