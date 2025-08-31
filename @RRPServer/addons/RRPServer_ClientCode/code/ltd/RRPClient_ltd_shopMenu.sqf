/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
try{
	if (life_action_inUse) throw "Вы чем то заняты";

	life_shop_npc = param [0,objNull,[objNull]];
	if ([life_shop_npc] call RRPClient_ltd_isShopInUse) throw "Магазин уже используется другим игроком";
	_store = life_shop_npc;
	private _owner = life_shop_npc GVAR ["ltdOwner",-1];
	if (EQUAL(_owner,-1)) throw "Не удалось определить владелеца фирмы и магазина";

	createDialog "RRPDialogLTDShop";
	waitUntil {!isnull (findDisplay 7400)};
	_display = uiNamespace getVariable ["RRPDialogLTDShop",displayNull];
	_owner = _store getVariable ["ltdOwner",0];
	_ownerID = if !(RRPClientLTDsData isEqualTo []) then {RRPClientLTDsData select 0}else{-1};

	{
		[_display, _x, ctrlPosition (_display displayCtrl _x), 1, 0] call RRPClient_gui_util_animateCtrl;
		[_display, _x, ctrlPosition (_display displayCtrl _x), 0, 0.5] call RRPClient_gui_util_animateCtrl;
	}forEach [7401,7402,7403,7404,7405,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418];

	_storeInfprm = _display displayCtrl 7416; 

	[life_shop_npc,"shop_inUseBy",steamid] call CBA_fnc_setVarNet;
	ctrlSetText [7402,format["%1", life_shop_npc GVAR ["ltdName",""]]];

	_blacklist = life_shop_npc getVariable ["ltdBC",[]];
	if (
		(!(life_shop_npc getVariable ["ltdMode",false]) && 
			{(player call getSide in ["med","civ","reb"])} && 
			{!(_ownerID isEqualTo _owner)}) OR {(_ownerID in _blacklist)}) then 
	{
		{
			[_display, _x, ctrlPosition (_display displayCtrl _x), 1, 0] call RRPClient_gui_util_animateCtrl;
			ctrlEnable [_x,false];
		}forEach [7410,7411,7412,7413,7414];
	};

	if !(life_shop_npc getVariable ["ltdActive",false]) then
	{
		{
			[_display, _x, ctrlPosition (_display displayCtrl _x), 1, 0] call RRPClient_gui_util_animateCtrl;
			ctrlEnable [_x,false];
			["ErrorTitleAndText",["Бизнес","Магазин закрыт. Вы не можете покупать или продавать предметы в этом магазине пока руководитель компании не откроет его!"]] call toast;
		}forEach [7407,7417,7410,7411,7412,7413,7414];
	};
	if (!(life_shop_npc getVariable ["ltdMode",false]) && !(_ownerID isEqualTo _owner)) then
	{
		{
			[_display, _x, ctrlPosition (_display displayCtrl _x), 1, 0] call RRPClient_gui_util_animateCtrl;
			ctrlEnable [_x,false];
		}forEach [7410,7411,7412,7413,7414];
	};

	call RRPClient_ltd_shopUpdate;

	private _tax = 			_store getVariable ["ltdTax",0];
	private _discount = 	_store getVariable ["ltdDiscount",0];
	private _discountDate = _store getVariable ["ltdDiscountDate",[]];
	private _maxGoods = 	_store getVariable ["ltdMaxGds",0];
	private _name = 		_store getVariable ["ltdName",0];
	private _active = 		if (_store getVariable ["ltdActive",false]) then {"ОТКРЫТ"}else{"ЗАКРЫТ"};
	private _license = 		_store getVariable ["ltdLicense",0];
	private _ID = 			_store getVariable ["ltdID",0];
	private _items = 		count (_store getVariable ["ltdItems",[]]);
	private _dateUntill = 	[_store getVariable ["ltdPayedUntil",[]]] call RRPClient_util_dateToString;
	private _owner = 		_store getVariable ["ltdOwner",0];
	private _ltdName = 		missionNamespace getVariable [format ["ltdData_%1",_owner],[]] select 1;
	private _mod = 			_store getVariable ["ltdMode",false];
	private _mode = 		if (_mod) then {"Для всех"}else{"Только сотрудники"};
	if (_discountDate isEqualTo "") then {_discountDate = "НЕ АКТИВНА";}else{_discountDate = [_discountDate] call RRPClient_util_dateToString;};

	lbClear _storeInfprm;
	_storeInfprm lbAdd format ["Компания владелец: %1",_ltdName];
	_storeInfprm lbAdd format ["Магазин: %1",_name];
	_storeInfprm lbAdd format ["Пошлина: %1%2",_tax,"%"];
	_storeInfprm lbAdd format ["Товаров на продаже: %1 (%2)",_items,_maxGoods];
	// _storeInfprm lbAdd format ["Деятельность: %1",_license];
	_storeInfprm lbAdd format ["Статус: %1",_active];
	_storeInfprm lbAdd format ["Режим продажи: %1",_mode];
	_storeInfprm lbAdd format ["Активен до: %1",_dateUntill];
	_storeInfprm lbAdd format ["Скидка: %2%1","%",_discount];
	_storeInfprm lbAdd format ["Скидка активна до: %1",_discountDate];

	life_shop_npc spawn 
	{
		while {true} do 
		{
			if (_this GVAR ["shop_inUseBy",""] != steamid) exitWith 
			{
				[_this,"shop_inUseBy"] call RRPClient_system_clearGlobalVar;
				closeDialog 0;
				throw "Магазин уже используется другим игроком.";
			};
			if (isNull (findDisplay 7400)) exitWith 
			{
				[_this,"shop_inUseBy"] call RRPClient_system_clearGlobalVar;
				call RRPClient_system_saveGear;
			};

			uiSleep 0.03;
		};
	};
}catch{
	["ErrorTitleAndText",["Бизнес",_exception]] call toast;
};