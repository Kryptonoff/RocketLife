/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 7409),-1)) exitWith {};

call RRPClient_actions_inUse;

private _itemClass = CONTROL_DATA(7409);

private _isVirtItem = isClass (missionConfigFile >> "VirtualItems" >> _itemClass);
private _isInvItem = isClass (missionConfigFile >> "LifeCfgItems" >> _itemClass);
try
{
	if !(_isVirtItem OR _isInvItem) throw "У предмета нет конфига";
	if (RRPClientLTDsData isEqualTo []) throw "Для того чтобы выставить свой товар, вам необходимо обзавестись компанией!"; 
	if (_isVirtItem && {ITEM_CANSELL(_itemClass) isEqualTo 0}) throw "Данный предмет нельзя выставить на продажу";
	if (_isInvItem && {ITEM_INVCANSELL(_itemClass) isEqualTo 0}) throw "Данный предмет нельзя выставить на продажу";
	
	if ((time - life_vshop_timer) < 5) throw "Вы слишком быстро нажимаете на кнопку Добавить! Рекомендуем указывать нужное кол-во при добавлении одинаковых предметов, вместо нажатия кнопки сто раз!";
	life_vshop_timer = time;

	_itemMax = life_shop_npc getVariable ["ltdMaxGds",0];
	_itemTotal = count (life_shop_npc getVariable ["ltdItems",[]]);
	if (_itemTotal >= _itemMax) throw "Магазин не может принять больше лотов - Достигнут лимит";
	private _price = ctrlText 7411;
	if !([_price] call RRPClient_system_isnumber) throw "Вы ввели неверное количество";
	_price = parseNumber (_price);
	private _amount = ctrlText 7413;
	if !([_amount] call RRPClient_system_isnumber) throw "Вы ввели неверное количество";
	_amount = parseNumber (_amount);
	if (_isVirtItem && {_amount > ITEM_VALUE(_itemClass)}) throw "У вас нет такого количества предметов для продажи";
	if (_isInvItem && {_amount > [_itemClass] call RRPClient_util_itemCount}) throw "У вас нет такого количества предметов для продажи";
	if (_amount > 50) throw "Выставить можно не более 50 товаров в одном лоте!";
	if (_price <= 0) throw "Стоимость должна быть больше нуля";
	private _itemName = if (_isVirtItem) then {
		ITEM_NAME(_itemClass);
	} else {
		([_itemClass] call RRPClient_util_itemDetails) select 1;
	};

	private _action = [
		format["Вы уверены, что хотите выставить на продажу %1 x %2 по $%3 за штуку?",_amount,_itemName,[_price] call RRPClient_util_numberText],
		"Подтверждение",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;

	if (_action) then {
		private _shopId = life_shop_npc GVAR ["ltdId",-1];
		if (EQUAL(_shopId,-1)) throw "Проблемы с ID магазина";

		["InfoTitleOnly", ["Отправка запроса.... Ждите..."]] call SmartClient_gui_toaster_addTemplateToast;
		[player,life_shop_npc,_shopId,_itemClass,_amount,_price,(RRPClientLTDsData select 0)] remoteExec ["RRPServer_ltd_addItemToShopDatabase",RSERV];
	} else {
		life_action_inUse = false;	
	};

}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
	life_action_inUse = false;
};