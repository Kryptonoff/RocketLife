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
params ["_unit","_item","_val","_from","_bool","_name"];
if !(_unit isEqualTo player) exitWith {};

_bool = if (count _this > 4) then {true} else {false};
_name = getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName");

if (_bool) then {
  if ([true,_item,(parseNumber _val)] call RRPClient_system_handleInv) then {
    ["WarningTitleAndText", ["Ошибка!", format["Вы пытались передать %1 %2 %3, но произошла ошибка.",_from getVariable ["realname",""],_val,_name]]] call SmartClient_gui_toaster_addTemplateToast;
  };
} else {
  if ([true,_item,(parseNumber _val)] call RRPClient_system_handleInv) then {
    ["WarningTitleAndText", ["Недостаточно места", format["%1 возвращено %2 %3 не смогли унести",_from getVariable ["realname",""],_val,_name]]] call SmartClient_gui_toaster_addTemplateToast;
  };
};
call RRPClient_invExt_updateVirtInv;
