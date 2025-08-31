/*

	Filename: 	RRPClient_gather_Tree.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if (isNull cursorObject) exitWith {};
if (player distance2d cursorObject > 3) exitWith {};
private _tree = if (["t_",([cursorObject] call RRPClient_util_getModelName)] call RRPClient_util_xString OR ["bo_t_",([cursorObject] call RRPClient_util_getModelName)] call RRPClient_util_xString) then {cursorObject} else {objNull};
if (isNull _tree) exitWith {};

if (alive _tree) then {
	private _gather = call RRPClient_gather_checkZone;
	private _value = if (EQUAL(_gather,"")) then {0.05} else {0.2};

	if (EQUAL(_tree,(life_tree_chop select 0))) then {
		private _newDamage = (life_tree_chop select 1) + _value;
		life_tree_chop set [1,_newDamage];
	} else {
		life_tree_chop set [0,_tree];
		life_tree_chop set [1,_value];
	};

	private _curDamage = life_tree_chop select 1;

	if (_curDamage >= 1) then {
		life_tree_chop = [objNull,0];
		_tree setDamage 1;
		if (EQUAL(_gather,"")) then {
			private _holder = createVehicle ["GroundWeaponHolder",getPosATL _tree,[],0,"CAN_COLLIDE"];
			_holder addMagazineCargoGlobal ["extItem_woodenLog", 3];
		} else {
			private _itemModel = M_CONFIG(getText,"LifeCfgFarm",_gather,"model");
			private _val = M_CONFIG(getNumber,"LifeCfgFarm",_gather,"amount");
			[_gather,_itemModel,_val] spawn RRPClient_gather_Spawn;
		};
	};
};
