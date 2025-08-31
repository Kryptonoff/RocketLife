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
    ----
    Description:
*/
params [
    ["_ItemsArray", [], [[]]],
    ["_typeItem", "", [""]]
];

if (_ItemsArray isEqualTo []) exitwith {};
if (_typeItem isEqualTo "") exitwith {};


private ["_ItemInfo","_FinalItem","_amount","_itemName","_itemIcon","_allItems"];
_allItems = "";
{
  _FinalItem = _x select 0;
  _amount    = _x select 1;

  if (_typeItem isEqualto "virtual") then {
    _itemName = (getText(missionConfigFile >> "VirtualItems" >> _FinalItem >> "displayName"));
    _itemIcon = getText(missionConfigFile >> "VirtualItems" >> _FinalItem >> "icon");
  } else {
    _itemInfo = [_FinalItem] call RRPClient_util_itemDetails;
    _itemName = _itemInfo select 1;
    _itemIcon = _itemInfo select 2;
  };
  _itemIcon = format ["<t size='20' >%1 </t> <img color='#ffffff' image='%2'/> <t size='20' >x%3</t><br/>",_itemName,_itemIcon,_amount];
  _allItems = _allItems + _itemIcon;

} forEach _ItemsArray;


 ["SuccessTitleAndText", ["Инвентарь + ", format ["%1",_allItems]]] call SmartClient_gui_toaster_addTemplateToast;
