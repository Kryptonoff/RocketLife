/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
params [
	["_itemClass","",[""]],
	["_amount",-1,[0]]
];

if (EQUAL(_itemClass,"")) exitWith {};
if (EQUAL(_amount,-1)) exitWith {};

private _isVirtItem = isClass (missionConfigFile >> "VirtualItems" >> _itemClass);

if (_isVirtItem) then {
	if ([false,_itemClass,_amount] call RRPClient_system_handleInv) then {
		["ErrorTitleAndText",["Бизнес",format["%1 успешно добавлен в базу",ITEM_NAME(_itemClass)]]] call toast;
		life_action_inUse = false;
		call RRPClient_ltd_shopUpdate;
		call RRPClient_system_saveGear;
	} else {
		["ErrorTitleAndText",["Бизнес","Что-то пошло не так... Не удалось убрать предмет из инвентаря..."]] call toast;
		closeDialog 0;
	};	
} else {	
	for "_x" from 1 to _amount do {
		[_itemClass] call RRPClient_system_removeItem;
	};
	["SuccessTitleAndText",["Бизнес",format["%1 успешно добавлен в базу",([_itemClass] call RRPClient_util_itemDetails) select 1]]] call toast;	
	life_action_inUse = false;
	call RRPClient_ltd_shopUpdate;
	call RRPClient_system_saveGear;
};