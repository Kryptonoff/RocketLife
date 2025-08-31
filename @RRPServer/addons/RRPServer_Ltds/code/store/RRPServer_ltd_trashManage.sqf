/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params 
[
	"_mode",
	["_shop",objNull,[objNull]],
	["_itemID",-1,[-1]],
	["_ltdId",-1,[-1]]
];

try
{
	if (isNull _shop) throw "Магазин NULL";
	if (_itemID isEqualTo -1) throw "Какие-то проблемы с выбранным товаром!";
	private _curItems = _shop getVariable ["ltdItems",[]];
	if (_curItems isEqualTo []) throw "В магазине нет товаров!";
	private _shopID = _shop getVariable ["ltdID",-1];
	if (_shopID isEqualTo -1) throw "Какие-то проблемы с ID магазина";
	private _index = [_itemId,_curItems] call RRPClient_system_index;
	if (_index isEqualTo -1) throw "Ошибка с поиском предмета в массиве, обратитесь к администратору";
	
	switch (_mode) do
	{
		//---------------------- To trash
		case 1: 
		{
			private _itemSel = _curItems select _index;
			_itemSel set [7,true];
			private _newItems = +_curItems;
			_shop setVariable ["ltdItems",_newItems,true];
			format ["updateTrashItem:1:%1",_itemID] call RRPServer_DB_fireAndForget;
			["SuccessTitleOnly", ["Товар был помещен в мусор! В течении 3х дней, если члены компании владельца товара, товар будет удален навсегда!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		//---------------------- From trash
		case 2: 
		{
			private _itemSel = _curItems select _index;
			_itemSel set [7,false];
			private _newItems = +_curItems;
			_shop setVariable ["ltdItems",_newItems,true];
			format ["updateTrashItem:0:%1",_itemID] call RRPServer_DB_fireAndForget;
			["SuccessTitleOnly", ["Товар был убран с мусорки!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		default {throw "Что-то пошло не так, убедитесь в корректности своих действий!"};
	};
	
	[] remoteExecCall ["RRPClient_ltd_trashResponse",remoteExecutedOwner];
}catch{
	_exception call RRPServer_util_log;
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
