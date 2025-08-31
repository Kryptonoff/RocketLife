/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_isPremial","_var","_configPath","_text","_flagRaise"];
if (count RRPClientGroupInfo isEqualTo 0) exitWith {};
if !("pullFlag" call RRPClient_groups_util_permCheck) exitWith {};
_configPath = getMissionConfig "CfgGroups" >> "PremiumGroups" >> (RRPClientGroupInfo get "premialVar");
if !(isClass(_configPath)) exitWith {};
_text = getText(_configPath >> "flagTexture");
if (_text isEqualTo "") exitWith {};
if (driver(vehicle player) isEqualTo player) then
{
  _flagRaise = (vehicle player) getVariable["currentFlag",false];
  if (_flagRaise) exitWith
  {
      (vehicle player) forceFlagTexture "";
      ["InfoTitleOnly",["Флаг спрятан"]] call SmartClient_gui_toaster_addTemplateToast;
      (vehicle player) setVariable["currentFlag", false];
  };
  (vehicle player) forceFlagTexture _text;
  ["InfoTitleOnly",["Флаг поднят"]] call SmartClient_gui_toaster_addTemplateToast;
  (vehicle player) setVariable ["currentFlag", true];
};
true
