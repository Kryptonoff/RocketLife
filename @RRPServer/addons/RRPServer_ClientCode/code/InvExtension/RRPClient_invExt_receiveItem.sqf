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
private ["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if (_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;

if (_diff != (parseNumber _val)) then {
  if ([true,_item,_diff] call RRPClient_system_handleInv) then {
    ["WarningTitleAndText", ["Недостаточно места", format["%1 передал вам %2 но вы можете нести только %3 и %4 был возвращен.",_from getVariable ["realname",""],_val,_diff,((parseNumber _val) - _diff)]]] call SmartClient_gui_toaster_addTemplateToast;
    [_from,_item,str((parseNumber _val) - _diff),_unit] remoteExecCall ["RRPClient_invExt_giveDiff",_from];
  } else {
    [_from,_item,_val,_unit,false] remoteExecCall ["RRPClient_invExt_giveDiff",_from];
  };
} else {
  if ([true,_item,(parseNumber _val)] call RRPClient_system_handleInv) then {
    ["InfoTitleAndText", ["+ Инвентарь", format["%1 передал вам %2 %3 ",_from getVariable ["realname",""],_val,getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")]]] call SmartClient_gui_toaster_addTemplateToast;
  } else {
    [_from,_item,_val,_unit,false] remoteExecCall ["RRPClient_invExt_giveDiff",_from];
  };
};

if !(isNull(findDisplay 602)) then {call RRPClient_invExt_updateVirtInv};
