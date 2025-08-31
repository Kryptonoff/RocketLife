/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
private _mode = _this;
private _display = uiNamespace getVariable ["RRPDialogLTDModer",displayNull];
private _shopList = _display displayCtrl 7507;
private _trashList = _display displayCtrl 7510;
private _blList = _display displayCtrl 7513;
private _store = life_shop_npc;
private _ltdID = RRPClientLTDsData select 0;
private _storeOwner = _store getVariable ["ltdOwner",-1];
try
{
	if (RRPClientLTDsData isEqualTo []) throw "Вы не можете управлять этим магазином!";
	if (isNil "_ltdID") throw "Вы не можете управлять этим магазином!";
	if !(_ltdID isEqualTo _storeID) throw "Вы не можете управлять этим магазином!";
	
	switch (_mode) do 
	{
		//-------------------- To trash
		case 1: 
		{
			if (EQUAL((lbCurSel 7507),-1)) throw "Вы ничего не выбрали!";
			private _itemData = call compile (format ["%1",CONTROL_DATA(7507)]);
			if (_itemData isEqualTo []) throw "Ошибка с предметом!";
			_itemID = _itemData param [0,-1,[-1]];
			_trash = _itemData param [7,false,[false]];
			if (_ltdID != _storeOwner) throw "Вы не можете управлять корзиной этого магазина";
			if (_itemID isEqualTo -1) throw "Ошибка с ID предмета!";
			if (_trash) throw "Товар уже в мусорной корзине!";
			[1,_store,_itemID,_ltdID] remoteExecCall ["RRPServer_ltd_trashManage",2];
		};
		//-------------------- From trash
		case 2: 
		{
			if (EQUAL((lbCurSel 7510),-1)) throw "Вы ничего не выбрали!";
			private _itemData = call compile (format ["%1",CONTROL_DATA(7510)]);
			if (_itemData isEqualTo []) throw "Ошибка с предметом!";
			_itemID = _itemData param [0,-1,[-1]];
			_trash = _itemData param [7,false,[false]];
			if (_ltdID != _storeOwner) throw "Вы не можете управлять корзиной этого магазина";
			if (_itemID isEqualTo -1) throw "Ошибка с ID предмета!";
			if !(_trash) throw "Товара нет в мусорной корзине!";
			[2,_store,_itemID,_ltdID] remoteExecCall ["RRPServer_ltd_trashManage",2];
		};
		//-------------------- To blacklist
		case 3: 
		{
			if (EQUAL((lbCurSel 7507),-1)) throw "Вы ничего не выбрали!";
			private _itemData = call compile (format ["%1",CONTROL_DATA(7507)]);
			_itemID = _itemData param [0,-1,[-1]];
			_selled_by = _itemData param [6,-1,[-1]];
			if (_selled_by isEqualTo _ltdID) throw "Вы не можете заблокировать свою же компанию!";
			if (_selled_by isEqualTo -1) throw "С компанией что-то не так!";
			[1,_store,_selled_by,_ltdID] remoteExecCall ["RRPServer_ltd_blacklistManage",2];
		};
		//-------------------- From blacklist
		case 4: 
		{
			if (EQUAL((lbCurSel 7513),-1)) throw "Вы ничего не выбрали!";
			private _ltdData = CONTROL_DATA(7513);
			[2,_store,parseNumber(_ltdData),_ltdID] remoteExecCall ["RRPServer_ltd_blacklistManage",2];
		};
		
		//-------------------- exploit fix
		default {throw "Что-то не так! Проверьте корректность своих действий!"};
	};

}catch{
	["ErrorTitleAndText",[_exception]] call SmartClient_gui_toaster_addTemplateToast;
};	