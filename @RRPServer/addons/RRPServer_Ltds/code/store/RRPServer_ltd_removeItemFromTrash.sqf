/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_toOwner","_toSeller"];
params 
[
	["_player",objNull,[objNull]],
	["_store",objNull,[objNull]],
	["_itemId",-1,[-1]],
	"_item","_count"
];
try
{
	if (isNull _player) throw "Вы NULL";
	if (isNull _store) throw "Магазин NULL";
	if (_itemId isEqualTo -1) throw "Проблемы с ID предмета";
	private _id = _store getVariable ["ltdId",0];
	private _owner = _store getVariable ["ltdOwner",0];
	private _items = _store getVariable ["ltdItems",[]];
	private _index = [_itemId,_items] call RRPClient_system_index;
	private _itemSel = _items select _index;
	private _current = _itemSel select 2;

	format ["deleteLTDitem:%1",_itemId] call RRPServer_DB_fireAndForget;
	private _newShopItems = +_items;
	_newShopItems deleteAt _index;
	_store setVariable ["ltdItems",_newShopItems,true];

	[format["%1 (%2) забрал с мусорки %3 (%4шт)",name _player,getPlayerUID _player,_item,_count],"LTD_Logs"] call RRPServer_system_logIt;
	[_item,_count] remoteExecCall ["RRPClient_ltd_trashRemoveDone",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};

