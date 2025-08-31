/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_bg","_pbBg","_pb","_display","_ctrls","_left","_center","_rigth","_time","_icon","_text"];
_time = _this select 0;
_text = _this select 1;
_icon = _this select 2;

_display = findDisplay 46;
if !(isNull(_display displayCtrl 7001)) exitWith {};
_left = (0.106641 * safezoneW + safezoneX);
_center = (0.306641 * safezoneW + safezoneX);
_rigth = (0.506641 * safezoneW + safezoneX);

_bg = _display ctrlCreate ["RRP_RscStructuredText", 7001];
_bg ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
_bg ctrlSetPosition [_left,0.808 * safezoneH + safezoneY,0.386719 * safezoneW,0.044 * safezoneH];
_bg ctrlSetStructuredText parseText format ["< align = 'center' valign = 'middle'  size = '1.2't><img size = '2' image='%2'/> %1</t>",_text,_icon];
_pbBg = _display ctrlCreate ["RRP_background", 7002];
_pbBg ctrlSetBackgroundColor [0.75, 0.75, 0.75,0.5];
_pbBg ctrlSetPosition [_left,0.852 * safezoneH + safezoneY,0.386719 * safezoneW,0.005 * safezoneH];
_pb = _display ctrlCreate ["RRP_background", 7003];
_pb ctrlSetBackgroundColor [0.98, 0.01, 0.38,1];
_pb ctrlSetPosition [_left,0.852 * safezoneH + safezoneY,0.386719 * safezoneW,0.005 * safezoneH];
_ctrls = [_bg,_pbBg,_pb];

{[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;} forEach _ctrls;
{(ctrlPosition _x) params ["_xpos","_ypos","_wpos","_hpos"];[_display, _x, [_center,_ypos,_wpos,_hpos], 0, 0.3] call RRPClient_gui_util_animateAllCtrl} forEach _ctrls;
[{(_this select 0) ctrlSetPosition [(_this select 2),0.852 * safezoneH + safezoneY,0,0.005 * safezoneH];(_this select 0) ctrlCommit (_this select 1)},[_pb,_time,_center],0.5] call CBA_fnc_waitAndExecute;
[{{(ctrlPosition _x) params ["_xpos","_ypos","_wpos","_hpos"];[(_this select 1), _x, [(_this select 2),_ypos,_wpos,_hpos], 1, 0.4] call RRPClient_gui_util_animateAllCtrl;} forEach (_this select 0);},[_ctrls,_display,_rigth],_time] call CBA_fnc_waitAndExecute;
[{{ctrlDelete _x} forEach (_this select 0);},[_ctrls,_display,_rigth],(_time + 0.4)] call CBA_fnc_waitAndExecute;