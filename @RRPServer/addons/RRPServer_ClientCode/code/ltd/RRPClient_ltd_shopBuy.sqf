/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
_val = parseNumber (ctrlText 7417);
try
{
	private _itemData = call compile format ["%1",CONTROL_DATA(7406)];
	if (life_action_inUse) throw "Вы уже чем-то заняты...";
	call RRPClient_actions_inUse;
	if (EQUAL((lbCurSel 7406),-1)) throw "Вы ничего не выбрали!";
	if !(_itemData isEqualType []) then 
	{
		throw "Что-то пошло не так, попробуйте позже";
		format["ltdShopBuy - Bad _itemData: %1",_itemData] call RRPClient_system_log;
	};
	_itemData params ["_itemId","_itemClass","_itemCount","_itemPrice","_tax","_selled_in","_selled_by","_trash"];
	if (_val <= 0) throw "Число не может быть 0 или отрицательным";
	private _isVirtItem = isClass (missionConfigFile >> "VirtualItems" >> _itemClass);
	private _itemName = if (_isVirtItem) then {
		ITEM_NAME(_itemClass);
	} else {
		([_itemClass] call RRPClient_util_itemDetails) select 1;
	};
	_discount = life_shop_npc getVariable ["ltdDiscount",0];
	_total = [(_itemPrice * _val),_discount] call RRPClient_ltd_calculateDiscount;
	if (CASH < _total) throw format["Для покупки данного лота вам надо $%1 наличности",[(_total)] call RRPClient_util_numberText];
	
	private _action = [
		format["Вы уверены, что хотите купить %1 x %2 за $%3 (включая налог)?",_val,_itemName,[_total] call RRPClient_util_numberText],
		"Подтверждение",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;
	

	if (_action) then {
	    if (_itemCount < _val) throw "В магазине нет такого количества!"; 
		 
		private _shopId = life_shop_npc getVariable ["ltdId",-1];
		if (EQUAL(_shopId,-1)) throw "Проблемы с ID магазина"; 

		private _ltdId = life_shop_npc getVariable ["ltdOwner",-1];
		if (EQUAL(_ltdId,-1)) throw "Проблемы с ID ООО"; 

		private _shopItems = life_shop_npc getVariable ["ltdItems",[]];
		if (EQUAL(_shopItems,[])) throw "Проблемы со списком вещей";

		private _index = [_itemId,_shopItems] call RRPClient_system_index;
		if (EQUAL(_index,-1)) throw "Проблемы с ID лота";
		
		if (_trash) throw "Товар в мусорной корзине, его нельзя купить!";
		
		private _error = false;
		private _diff = 0;
		if (_isVirtItem) then 
		{
			_diff = [_itemClass,_val,life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;
			if !(EQUAL(_val,_diff)) then {_error = true};
		};
		if (_error) throw format ["Ваш инвентарь заполнен. Есть место только для %1 из %2",_diff,_val];

		["SuccessTitleOnly", ["Собираем для вас покупку.... Ждите..."]] call SmartClient_gui_toaster_addTemplateToast;

		[player,life_shop_npc,_itemId,_itemClass,_val,_itemPrice,_tax,_selled_in,_selled_by,_total] remoteExec ["RRPServer_ltd_removeItemFromShopDatabase",RSERV];
	} else {
		life_action_inUse = false;	
	};
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
	life_action_inUse = false;
};