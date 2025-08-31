/*

	Filename: 	RRPClient_system_vehStoreItem.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\..\script_macros.hpp"
try{
	disableSerialization;
	if (EQUAL((lbCurSel 3503),-1)) throw "Вы ничего не выбрали";
	private _storeall = param [0,false,[true]];
	private _ctrl = CONTROL_DATA(3503);

	private _conditions = M_CONFIG(getText,"VirtualItems",_ctrl,"conditions");
	if !([_conditions] call RRPClient_util_conditionsCheck) throw "Данный предмет нельзя положить в это хранилище";

	private _num = ctrlText 3506;
	if !([_num] call RRPClient_system_isnumber) throw "Укажите количество в цифровом формате, а не символьном";

	_num = parseNumber(_num);
	if (_num < 1) throw "Серьезно?";

	if (_storeall) then {_num = ITEM_VALUE(_ctrl)}; 

	private "_totalWeight";
	switch (typeOf life_trunk_vehicle) do { 
		case "Land_LuggageHeap_03_F" : {
			private _house_box_slots = life_trunk_vehicle GVAR ["house_box_slots",0];
			private _mWeight = (LIFE_SETTINGS(getNumber,"life_virtualMax")) * _house_box_slots;
			_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];
		}; 
		case (LIFE_SETTINGS(getText,"life_trunkClass")): {
			private _trunk_slots = life_trunk_vehicle GVAR ["slots",1];
			private _mWeight = (LIFE_SETTINGS(getNumber,"life_trunkVirtualWeight")) * _trunk_slots;
			_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];		
		};
		case (LIFE_SETTINGS(getText,"life_vaultBoxClass")): {
			private _mWeight = LIFE_SETTINGS(getNumber,"life_vaultBoxVirtualWeight");
			_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];		
		};
		default {
			_totalWeight = [life_trunk_vehicle] call RRPClient_system_vehicleWeight;
		}; 
	};

	private _inv = (life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0;

	private _itemWeight = (ITEM_WEIGHT(_ctrl)) * _num;
	if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) throw "Техника переполнена или нет места для такого количества.";
	if !([false,_ctrl,_num] call RRPClient_system_handleInv) throw "Не удалось удалить предметы из инвентаря, чтобы положить их в машину.";

	private _index = [_ctrl,_inv] call RRPClient_system_index;
	if (EQUAL(_index,-1)) then {
		_inv pushBack [_ctrl,_num];
	} else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	private _vehTotalWeight = 0;
	{
		_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
		_vehTotalWeight = _vehTotalWeight + _itemWeight;	  
	} forEach _inv;

	[life_trunk_vehicle,"Trunk",[_inv,_vehTotalWeight]] call CBA_fnc_setVarNet;
	[life_trunk_vehicle] call RRPClient_system_vehInventory;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};