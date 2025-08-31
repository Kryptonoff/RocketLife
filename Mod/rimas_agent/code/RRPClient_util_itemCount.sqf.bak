/*

	Filename: 	RRPClient_util_itemCount.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
*/

private _item = param [0,"",[""]];
if (_item isEqualTo "") exitWith {0};

private _items = [];
if !(uniform player isEqualTo "") then 
{
	_items = _items + (uniformItems player);
	_items = _items + [uniform player];
};
if !(vest player isEqualTo "") then 
{
	_items = _items + (vestItems player);
	_items = _items + [vest player];
};
if !(backpack player isEqualTo "") then 
{
	_items = _items + (backPackItems player);
	_items = _items + [backpack player];
};
if !(weapons player isEqualTo []) then 
{
	_items = _items + (weapons player);
};

{_x isEqualTo _item} count (_items + assignedItems player)