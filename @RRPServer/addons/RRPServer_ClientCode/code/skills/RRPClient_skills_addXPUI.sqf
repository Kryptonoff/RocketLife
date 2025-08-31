/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/

if (player getVariable ["RRPVariablePartyMeatActive", false]) exitWith {};

private ["_display","_title","_progressOld","_progressNew","_progressBg","_toNext","_bgPos","_left","_center","_rigth","_ctrls","_progressOldPos"];
_display = findDisplay 46;
params [["_prof","",[""]],["_needAddXP",0,[0]]];

_toNext = _prof call RRPClient_skills_util_toNextLvl;
_toNext params [["_curXP",0,[0]],["_allXP",0,[0]],["_curLVL",0,[0]]];

_left = (0.168516 * safezoneW + safezoneX);
_center = (0.368516 * safezoneW + safezoneX);
_rigth = (0.568516 * safezoneW + safezoneX);


_title = (_display displayCtrl 4000);
if (isNull _title) then {_title = _display ctrlCreate ["RRP_RscStructuredText", 4000]};
_title ctrlSetPosition [_left,0.951 * safezoneH + safezoneY,0.262969 * safezoneW,0.022 * safezoneH];
_title ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
comment "Если опыта больше чем необходимо для текущего lvl";
if ((_curXP + _needAddXP) > _allXP) then {
  _needAddXP = ((_curXP + _needAddXP) - _allXP);
  _curLVL = _curLVL + 1;
  _curXP = 0;
  _allXP = (_prof call RRPClient_skills_util_toNextLvl) select 1;
};
_title ctrlSetStructuredText parseText format ["<t size = '0.85' valign = 'middle' color = '#ffffff' font = 'RobotoCondensedBold'> %1 <t align = 'right'>+%2XP | LVL %3</t></t>",getText (getMissionConfig "CfgSkills" >> _prof >> "displayName"),_needAddXP,_curLVL];

_progressBg = (_display displayCtrl 4001);
if (isNull _progressBg) then {_progressBg = _display ctrlCreate ["RRP_background", 4001];};
_progressBg ctrlSetBackgroundColor [0.75, 0.75, 0.75,0.5];
_progressBg ctrlSetPosition [_left,0.973 * safezoneH + safezoneY,0.262969 * safezoneW,0.0055 * safezoneH];
_progressBg ctrlCommit 0;
_bgPos = ctrlPosition _progressBg;

_progressOld = (_display displayCtrl 4002);
if (isNull _progressOld) then {_progressOld = _display ctrlCreate ["RRP_background", 4002];};
_progressOld ctrlSetBackgroundColor [0.0, 0.92, 0.99,1];
_progressOld ctrlSetPosition [_left,(_bgPos select 1),((_bgPos select 2) * (_curXP/_allXP)),(_bgPos select 3)];
_progressOld ctrlCommit 0;
_progressOldPos = ctrlPosition _progressOld;

_progressNew = (_display displayCtrl 4003);
if (isNull _progressNew) then {_progressNew = _display ctrlCreate ["RRP_background", 4003];};
_progressNew ctrlSetBackgroundColor [0.0, 1.0, 0.5,1];
_progressNew ctrlSetPosition [(_left + (_progressOldPos select 2)), (_progressOldPos select 1),((_bgPos select 2) * (_needAddXP/_allXP)),(_progressOldPos select 3)];
_ctrls = [_title,_progressBg,_progressOld,_progressNew];

{[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;} forEach _ctrls;
{
  (ctrlPosition _x) params ["_xpos","_ypos","_wpos","_hpos"];
  [_display, _x, [if ((ctrlIDC _x) isEqualTo 4003) then {((_center + (_progressOldPos select 2)))} else {_center},_ypos,_wpos,_hpos], 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach _ctrls;
[ {
    {
      (ctrlPosition _x) params ["_xpos","_ypos","_wpos","_hpos"];
      [(_this select 1), _x, [(_this select 2),_ypos,_wpos,_hpos], 2, 0.4] call RRPClient_gui_util_animateAllCtrl;
    } forEach (_this select 0);
  },
[_ctrls,_display,_rigth],4] call CBA_fnc_waitAndExecute;
