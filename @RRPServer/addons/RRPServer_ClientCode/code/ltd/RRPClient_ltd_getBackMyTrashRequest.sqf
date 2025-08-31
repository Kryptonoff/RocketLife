/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
private _display = uiNamespace getVariable ["RRPDialogLTDModer",displayNull];
private _itemData = call compile (format ["%1",CONTROL_DATA(7510)]);

_idMyLTD = RRPClientLTDsData select 0;
try
{
	if (life_action_inUse) throw "Вы уже чем-то заняты...";
	call RRPClient_actions_inUse;
	
	if !(_itemData isEqualType []) then 
	{
		throw "Что-то пошло не так, попробуйте позже";
		format["ltdShopBuy - Bad _itemData: %1",_itemData] call RRPClient_system_log;
	};
	_itemData params ["_itemId","_itemClass","_itemCount","_itemPrice","_tax","_selled_in","_selled_by","_trash"];
	
	private _isVirtItem = isClass (missionConfigFile >> "VirtualItems" >> _itemClass);
	private _itemName = if (_isVirtItem) then {
		ITEM_NAME(_itemClass);
	} else {
		([_itemClass] call RRPClient_util_itemDetails) select 1;
	};
	
	private _shopId = life_shop_npc GVAR ["ltdId",-1];
	if (EQUAL(_shopId,-1)) throw "Проблемы с ID магазина"; 

	private _ltdId = life_shop_npc GVAR ["ltdOwner",-1];
	if (EQUAL(_ltdId,-1)) throw "Проблемы с ID ООО"; 

	private _shopItems = life_shop_npc GVAR ["ltdItems",[]];
	if (EQUAL(_shopItems,[])) throw "Проблемы со списком вещей";
	
	if !(_selled_by isEqualTo _idMyLTD) throw "Этот лот вам не принадлежит!";
	if !(_trash) throw "Товар не в мусорной корзине!";
	
	private _error = false;
	private _diff = 0;
	if (_isVirtItem) then {
		_diff = [_itemClass,_itemCount,life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;
		if !(EQUAL(_itemCount,_diff)) then {_error = true};
	};
	if (_error) throw format ["Ваш инвентарь заполнен. Есть место только для %1 из %2",_diff,_itemCount];
	
	["SuccessTitleOnly", ["Собираем для вас покупку.... Ждите..."]] call SmartClient_gui_toaster_addTemplateToast;
	
	[player,life_shop_npc,_itemId,_itemClass,_itemCount] remoteExec ["RRPServer_ltd_removeItemFromTrash",RSERV];
}catch{
	
	["ErrorTitleAndText",["Ошибка",_exception]] call SmartClient_gui_toaster_addTemplateToast;
	life_action_inUse = false;
};
true