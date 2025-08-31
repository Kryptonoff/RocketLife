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
private ["_value","_index","_vItemsList","_display","_vItemsLoad","_tooltip"];
_display = findDisplay 602;
if (isNull _display) exitWith {};
_vItemsList = _display displayCtrl 2007;
_vItemsLoad = _display displayCtrl  2003;
_vItemsLoadText = _display displayCtrl  2021;
lbClear _vItemsList;
{
  _value = missionNamespace getVariable [format ["life_inv_%1",getText(missionConfigFile >> "VirtualItems" >> configName _x >> "variable")],0];
  if (_value > 0) then {
    _index = _vItemsList lbAdd format ["%1",(getText(_x >> "displayName"))];
    _tooltip = format ["Вес: %1<br/>%2",getNumber(missionConfigFile >> "VirtualItems" >> configName _x >> "weight"),if ((getText(missionConfigFile >> "VirtualItems" >> configName _x >> "legal")) isEqualTo "true") then {"Легальный"} else {"Нелегальный"}];
    _vItemsList lbSetTooltip [_index, _tooltip];
    _vItemsList lbSetTextRight [_index,format ["%1", _value]];
    _vItemsList lbSetData [_index,configName _x];
    _vItemsList lbSetPicture [_index,(getText (_x >> "icon"))];
  };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
_vItemsLoad progressSetPosition life_carryWeight/(life_maxWeight/100)/100;
_vItemsLoadText ctrlSetText format ["%1/%2",life_carryWeight,life_maxWeight];