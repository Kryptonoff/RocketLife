/*

	Filename:	RRPClient_inventory_itemCount.sqf
	Project:	Fatum Stalker
	Author:		Arhim
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
#include "..\..\script_macros.hpp"
private _searchItem = param [0,"",["",[]]];
if (EQUAL(_searchItem,"")) exitWith {0};

private _playerItems = [] call RRPClient_inventory_getPlayerItems;
if (EQUAL(_playerItems,[])) exitWith {0};

private _return = 0;
{
	_item = _x select 0; _amount = _x select 1;
	if (_item isEqualType []) then {_item = _x select 0 select 0};
	if (_searchItem == _item) exitWith {_return = _amount};
} forEach _playerItems;

_return