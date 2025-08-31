/*

	Filename:	RRPClient_inventory_handleVehInv.sqf
	Project:	Fatum Life Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
#include "..\..\..\script_macros.hpp"
params [
	["_math",false,[false]],
	["_item","",[""]],
	["_num",0,[0]],
	["_vehicle",objNull,[objNull]],
	["_save", true, [true]]
];

if (EQUAL(_item,"") OR EQUAL(_num,0) OR EQUAL(_vehicle,objNull)) exitWith {false};

(_vehicle getVariable ["Trunk",[[],0]]) params ["_items","_space"];
if (_space < 0) exitWith {
	[_vehicle,"Trunk"] call RRPClient_system_clearGlobalVar;
	["В багажнике дыра от ржавчины. Мы ее залатали, но придется начать заново","error"] call RRPClient_gui_hint;
	false
};

private _v_maxweight = _vehicle call RRPClient_inventory_getContainerMaxMassVirt;
if (_math) then {
	private _num = [_item,_num,_space,_v_maxweight] call RRPClient_inventory_canAddVirtItem;
	if (_num <= 0) exitWith {false};
};

private _index = [_item,_items] call RRPClient_system_index;
if (!_math && _index isEqualTo -1) exitWith {false};

private _weight = (ITEM_WEIGHT(_item)) * _num;
private _return = false;

if (_math) then {
	//Lets add!
	if ((_space + _weight) <= _v_maxweight) then {
		if (_index isEqualTo -1) then {
			_items pushBack [_item,_num];
		} else {
			_items set[_index,[_item,(_items#_index#1) + _num]];
		};
		_vehicle setVariable ["Trunk", [_items, _space + _weight], true];

		_return = true;
	} else {
		_return = false;
	};
} else {
	private _amount = _items#_index#1 - _num;
	if (_amount < 0) then {
		_return = false;
	} else {
		if (_amount isEqualTo 0) then {
			_items deleteAt _index;
		} else {
			_items set[_index,[_item,_amount]];
		};
		_vehicle setVariable ["Trunk", [_items,_space - _weight], true];

		_return = true;
	};
};
if (_save) then {
	if (
		typeOf _vehicle in ["Land_LuggageHeap_03_F", LIFE_SETTINGS(getText,"life_trunkClass")] OR 
		_vehicle getVariable ["shelter_container", false] OR 
		_vehicle getVariable ["safe_container", false] OR 
		!(_vehicle getVariable ["dbInfo", []] isEqualTo [])
	) then {[_vehicle, "Trunk", player] call RRPClient_inventory_saveContainer};
};

_return;