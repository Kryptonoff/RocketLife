/*

	Filename:	RRPClient_inventory_getPlayerItems.sqf
	Project:	Fatum Stalker
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
private _player = param [0, player, [objNull]];
private _magazinesAndWeapons = (magazines _player) + ((weaponsitems _player) apply {_x select 0});
private _items = [];

if (uniform _player != "") then {
	_items pushBack uniform _player;
	_items = _items + ((uniformItems _player) - _magazinesAndWeapons) + magazinesAmmoCargo (uniformContainer _player);
};

if (vest _player != "") then {
	_items pushBack vest _player;
	_items = _items + ((vestItems _player) - _magazinesAndWeapons) + magazinesAmmoCargo (vestContainer _player);
};

if (backpack _player != "") then {
	_items pushBack backpack _player;
	_items = _items + ((backPackItems _player) - _magazinesAndWeapons) + magazinesAmmoCargo (backpackContainer _player);
};

_items pushBack goggles _player;
_items pushBack headgear _player;
_items = _items + assignedItems _player;
_items = _items + (everyBackpack (backpackContainer _player) apply {typeof _x});

{
	{	
		if !(_x in ["", []]) then {_items pushBack _x}
	} forEach _x;
} foreach (weaponsItems _player);

private _itemsFinal = [];
private _listed = [];
private ["_item","_itemCount"];
{
	if (!(_x in _listed) && !(_x isEqualTo "")) then {
		_item = _x;
		_listed pushBack _item;
		_itemCount = {_x isEqualTo _item} count _items;
		_itemsFinal pushBack [_item, _itemCount]
	};
} forEach _items;

_itemsFinal;