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

private ['_display','_text','_mod','_ctrlnotification'];

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 33000;

_text = _this select 0;
_mod  = _this select 1;

_ctrlnotification = _slide controlsGroupCtrl 2515;
_ctrlnotification ctrlSetPosition [0.155717 * safezoneW,0.349814 * safezoneH,0 * safezoneW,0.033 * safezoneH];
_ctrlnotification ctrlSetBackgroundColor [0,0,0,0];
_ctrlnotification ctrlSetFade 0;
_ctrlnotification ctrlCommit 0;

if (_mod) then {
	_ctrlnotification ctrlSetBackgroundColor [0.0, 0.74, 0.29,1];
} else {
	_ctrlnotification ctrlSetBackgroundColor [0.71, 0.01, 0.18,1];
	playSound "3DEN_notificationWarning"
};

_ctrlnotification ctrlSetStructuredText parseText format ["<t size='.8'>%1</t>",_text];
_ctrlnotification ctrlSetPosition [0.155717 * safezoneW,0.349814 * safezoneH,0.244407 * safezoneW,0.033 * safezoneH];
_ctrlnotification ctrlCommit 0.25;
