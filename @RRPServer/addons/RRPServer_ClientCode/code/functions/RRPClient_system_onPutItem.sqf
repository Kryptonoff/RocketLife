/*
	
	Filename: 	RRPClient_system_onPutItem.sqf
	Project: 	Rimas Altis Life RPG

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_container",ObjNull,[ObjNull]],
	["_item","",[""]]
];

if (isNull _unit OR isNull _container OR EQUAL(_item,"") OR ISPSIDE("reb") OR ISPSIDE("cop")) exitWith {};

_dif = diag_tickTime - MouseButtonUpInventory;
if(_dif > 0.35)then
{
	if (vestContainer _unit isEqualTo _container)then
	{
		_unit removeItemFromVest _item;
		_log = format["DUPE REMOVED FROM VEST: %1 (%2)",_item,_dif];
		[0, netId player, toArray(_log)] call RRPAH_sys_dupeClientServer;
	};
	if (uniformContainer _unit isEqualTo _container)then
	{
		_unit removeItemFromUniform _item;
		_log = format["DUPE REMOVED FROM UNIFORM: %1 (%2)",_item,_dif];
		[0, netId player, toArray(_log)] call RRPAH_sys_dupeClientServer;
	};
	if (backpackContainer _unit isEqualTo _container)then
	{
		_unit removeItemFromBackpack _item;
		_log = format["DUPE REMOVED FROM BACKPACK: %1 (%2)",_item,_dif];
		[0, netId player, toArray(_log)] call RRPAH_sys_dupeClientServer;
	};
};
playSound "click";

call RRPClient_system_saveGear;