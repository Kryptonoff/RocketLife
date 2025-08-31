/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
	[[1,"cacao",5,50],[2,"cacao",2,50],[3,"cacao",1,500]]
*/

#include "..\..\script_macros.hpp"
disableSerialization;

if (isNull (findDisplay 7400)) exitWith {};

private _invItems = CONTROL(7400,7409);
lbClear _invItems;
[_invItems] call RRPClient_ltd_listSellingItems;

private _shopItems = CONTROL(7400,7406);
lbClear _shopItems;

private _items = life_shop_npc GVAR ["ltdItems",[]];
_discount = life_shop_npc getVariable ["ltdDiscount",0];
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
			_shopItems lbAdd format["%1",_itemName];
			_shopItems lbSetTextRight [(lbSize _shopItems)-1, format["  $%1 (ост. %2)", [[(_x select 3),_discount] call RRPClient_ltd_calculateDiscount] call RRPClient_util_numberText, [_x select 2] call RRPClient_util_numberText]];
			_shopItems lbSetValue [(lbSize _shopItems)-1,_x select 0];
			_shopItems lbSetData [(lbSize _shopItems)-1,str(_x)];
			_shopItems lbSetPicture [(lbSize _shopItems)-1,_itemIcon];
		};
	} forEach _items;
};

if (EQUAL((lbSize _shopItems),0)) then 
{
	_shopItems lbAdd "Нет предметов для продажи";
};