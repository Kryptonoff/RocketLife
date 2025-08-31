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
private ["_display","_ctrlStrText","_ctrlGroup","_xCoord","_ctrlIndicator","_ctrlBackGround","_bgpos","_sliderIDC","_imgExitNext","_ctrlExitNext","_imgExitBack","_ctrlExitBack","_posForBtnBack","_posForBtnNext","_actualQuest","_IndicatordefaultNumb"];
infoListForSlider = _this;
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};
_ctrlGroup = _display displayCtrl 1020;
_ctrlBackGround = _display displayCtrl 1011;
_ctrlStrText = _ctrlGroup controlsGroupCtrl 1022;
_IndicatordefaultNumb = 1;

[_display, _ctrlStrText, ctrlPosition _ctrlStrText, 1, 0] call RRPClient_gui_util_animateAllCtrl;
[_display, _ctrlStrText, ctrlPosition _ctrlStrText, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;

_sliderIDC = 1024;
amountIndicators = (count infoListForSlider);

curSlider = 1;
if !((infoListForSlider select 0) select 0) then {
  _actualQuest = (((player getVariable ["rrpvar_questsList",[]]) findIf {_x isEqualTo 0}) + 1);
  curSlider = if (_actualQuest isEqualTo 0) then {1} else {_actualQuest};
  _IndicatordefaultNumb = if (_actualQuest isEqualTo 0) then {1} else {_actualQuest};
};
call RRPClient_forBeginner_updatePage;

_bgpos = ctrlPosition _ctrlBackGround;
_xCoord = [_bgpos,amountIndicators,0.01,0.00773438] call RRPClient_gui_util_alignCtrl;

for "_i" from 1 to amountIndicators do {
  _sliderIDC = _sliderIDC + 1;
  _ctrlIndicator = _display ctrlCreate ['RscPictureKeepAspect', _sliderIDC];
  _ctrlIndicator ctrlSetText  (if (_i isEqualTo _IndicatordefaultNumb) then {'\RRP_icons\forBeginners\indicator_ON.paa'} else {'\RRP_icons\forBeginners\indicator_OFF.paa'});
  _ctrlIndicator ctrlSetPosition [_xCoord * safezoneW + safezoneX,0.742 * safezoneH + safezoneY,0.00773438 * safezoneW,0.022 * safezoneH];
  [_display, _ctrlIndicator, ctrlPosition _ctrlIndicator, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _ctrlIndicator, ctrlPosition _ctrlIndicator, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
  _xCoord = _xCoord + 0.01;
};

_posForBtnBack = ctrlPosition (_display displayCtrl 1025);
_posForBtnNext = ctrlPosition (_display displayCtrl (1024 + amountIndicators));
_posForBtnBack set [0, ((_posForBtnBack select 0) - 0.05)];
_posForBtnNext set [0,((_posForBtnNext select 0) + 0.05)];

_sliderIDC = _sliderIDC + 1;
_imgExitNext = _display ctrlCreate ['RscPictureKeepAspect', _sliderIDC];
_imgExitNext ctrlSetText '\RRP_icons\forBeginners\arrowSwitcher_Next.paa';
_imgExitNext ctrlSetPosition _posForBtnNext;

_sliderIDC = _sliderIDC + 1;
_imgExitBack = _display ctrlCreate ['RscPictureKeepAspect', _sliderIDC];
_imgExitBack ctrlSetText '\RRP_icons\forBeginners\arrowSwitcher_Back.paa';
_imgExitBack ctrlSetPosition _posForBtnBack;

_sliderIDC = _sliderIDC + 1;
_ctrlExitNext = _display ctrlCreate ['RscPictureButtonMenu', _sliderIDC];
_ctrlExitNext ctrlSetPosition _posForBtnNext;
_ctrlExitNext ctrlAddEventHandler ['ButtonClick', 'true call RRPClient_forBeginner_toggleSlider'];

_sliderIDC = _sliderIDC + 1;
_ctrlExitBack = _display ctrlCreate ['RscPictureButtonMenu', _sliderIDC];
_ctrlExitBack ctrlSetPosition _posForBtnBack;
_ctrlExitBack ctrlAddEventHandler ['ButtonClick', 'false call RRPClient_forBeginner_toggleSlider'];

{
  [_display, _x, ctrlPosition _x, 0, 0] call RRPClient_gui_util_animateAllCtrl;
} forEach [_imgExitNext,_ctrlExitNext,_imgExitBack,_ctrlExitBack];

[_ctrlStrText, 0, 0] call BIS_fnc_ctrlFitToTextHeight;
