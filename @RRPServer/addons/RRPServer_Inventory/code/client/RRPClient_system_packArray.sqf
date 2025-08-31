/*

	Filename: 	RRPClient_inventory_packArray.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
private _return = [];
private _listed = [];
private ["_item","_itemCount"];
{
	if (!(_x in _listed) && !(_x isEqualTo "")) then {
		_item = _x;
		_listed pushBack _item;
		_itemCount = {_x isEqualTo _item} count _this;
		_return pushBack [_item, _itemCount]
	};
} forEach _this;

_return;