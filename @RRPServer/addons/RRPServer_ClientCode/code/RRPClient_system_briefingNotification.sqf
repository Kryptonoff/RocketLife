/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
params [
    ["_title","",[""]],
    ["_body","",[""]],
    ["_disableButton",false,[false]]
];
private ["_str","_frame","_display","_btnExit"];

if !(createDialog 'RRPDialogEmpty') exitWith {};
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};
true call RRPClient_gui_util_blur;
_display displayAddEventHandler ["unload","uiNamespace setVariable ['RRPDialogEmpty', displayNull]; false call RRPClient_gui_util_blur;"];
_str = _display ctrlCreate ["RRP_RscStructuredText", 1001];
_str ctrlSetBackgroundColor [0.26, 0.24, 0.31,0.85];
_str ctrlSetPosition [0,0,1,1];
_str ctrlEnable false;
_frame = _display ctrlCreate ["RscFrame", 1002];
_frame ctrlSetPosition [0,0,1,1];
_btnExit = _display ctrlCreate ["RRP_btn_blue", 1002];
_btnExit ctrlSetPosition [0.35,0.9,0.3,0.06];

if (_disableButton) then {
    _btnExit ctrlSetFade 1;
    _btnExit ctrlEnable false;
};

_btnExit ctrlSetText "Продолжить >>>";
_btnExit buttonSetAction "closeDialog 0";
{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

_str ctrlSetStructuredText parseText format ["<t color = '#ffffff' align = 'center'><t size = '1.7'><br/>%1</t><br/><br/><br/>%2</t>",_title,_body];
