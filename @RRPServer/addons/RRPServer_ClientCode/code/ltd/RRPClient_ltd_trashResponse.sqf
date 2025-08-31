/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 7500)) exitWith {};
private _display = uiNamespace getVariable ["RRPDialogLTDModer",displayNull];

private _storeList = _display displayCtrl 7507;
lbClear _storeList;

private _trashList = _display displayCtrl 7510;
lbClear _trashList;

private _blackList = _display displayCtrl 7513;
lbClear _blackList;

private _blackLists = life_shop_npc GVAR ["ltdBC",[]];
private _items = life_shop_npc GVAR ["ltdItems",[]];
private _discount = life_shop_npc getVariable ["ltdDiscount",0];
if !(EQUAL(_items,[])) then {
	private ["_tmp","_itemIcon","_itemName"];
	{
		if !(_x # 7) then
		{
			if (isClass (missionConfigFile >> "VirtualItems" >> (_x select 1))) then 
			{
				_itemIcon = ITEM_ICON(_x select 1);
				_itemName = ITEM_NAME(_x select 1);
			} else {
				_tmp = [_x select 1] call RRPClient_util_itemDetails;
				_itemIcon = _tmp select 2;
				_itemName = _tmp select 1;
			};
			_storeList lbAdd format["%1",_itemName];
			_storeList lbSetTextRight [(lbSize _storeList)-1, format[" %1",(missionNamespace getVariable [format ["ltdData_%1",_x select 6],[]]) select 1]];
			_storeList lbSetValue [(lbSize _storeList)-1,_x select 0];
			_storeList lbSetData [(lbSize _storeList)-1,str(_x)];
			_storeList lbSetPicture [(lbSize _storeList)-1,_itemIcon];
		}else{
			if (isClass (missionConfigFile >> "VirtualItems" >> (_x select 1))) then 
			{
				_itemIcon = ITEM_ICON(_x select 1);
				_itemName = ITEM_NAME(_x select 1);
			} else {
				_tmp = [_x select 1] call RRPClient_util_itemDetails;
				_itemIcon = _tmp select 2;
				_itemName = _tmp select 1;
			};
			_trashList lbAdd format["%1",_itemName];
			_trashList lbSetTextRight [(lbSize _trashList)-1, format[" %1",(missionNamespace getVariable [format ["ltdData_%1",_x select 6],[]]) select 1]];
			_trashList lbSetValue [(lbSize _trashList)-1,_x select 0];
			_trashList lbSetData [(lbSize _trashList)-1,str(_x)];
			_trashList lbSetPicture [(lbSize _trashList)-1,_itemIcon];
		};
	} forEach _items;
};
if !(EQUAL(_blackLists,[])) then
{
	{
		_blackList lbAdd format["%1",(missionNamespace getVariable [format["ltdData_%1",_x],[]] select 1) ];
		_blackList lbSetValue [(lbSize _blackList)-1,_x];
		_blackList lbSetData [(lbSize _blackList)-1,str(_x)];
		
	} forEach _blackLists;
};
if (EQUAL((lbSize _blackList),0)) then {_blackList lbAdd "Вы никого не внесли";};
if (EQUAL((lbSize _storeList),0)) then {_storeList lbAdd "Ничего не продается";};
if (EQUAL((lbSize _trashList),0)) then {_trashList lbAdd "В мусорной корзине пусто";};

