/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"

params [
	["_itemClass","",[""]],
	["_itemCount",-1,[0]]
];

try
{
	if (EQUAL(_itemClass,"")) throw "Ошибка с предметом!";
	if (EQUAL(_itemCount,-1)) throw "Количество предметов не определено";

	private _isVirtItem = isClass (missionConfigFile >> "VirtualItems" >> _itemClass);
	private _itemName = if (_isVirtItem) then {
		ITEM_NAME(_itemClass);
	} else {
		([_itemClass] call RRPClient_util_itemDetails) select 1;
	};

	if (_isVirtItem) then {
		if ([true,_itemClass,_itemCount] call RRPClient_system_handleInv) then {
			["InfoTitleOnly", [format["Вы забрали %1",_itemName]]] call SmartClient_gui_toaster_addTemplateToast;	
			life_action_inUse = false;
			call RRPClient_ltd_trashResponse;
		} else {
			closeDialog 0;
		};
	} else {
		for "_x" from 1 to _itemCount do 
		{
			[_itemClass] call RRPClient_inventory_addItemToInventory;
		};
		["SuccessTitleOnly", [format["Вы забрали %1",_itemName]]] call SmartClient_gui_toaster_addTemplateToast;
		life_action_inUse = false;
		call RRPClient_ltd_trashResponse;
	};
}catch{
	life_action_inUse = false;
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
