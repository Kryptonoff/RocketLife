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
	"_item","_count","_price",
	"_taxItem","_selled_in","_selled_by","_totalCost"
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
	_itemSel set [2,_current - _count];
	private _newCur = _itemSel select 2;
	
	if (_newCur isEqualTo 0) then
	{
		format ["deleteLTDitem:%1",_itemId] call RRPServer_DB_fireAndForget;
		private _newShopItems = +_items;
		_newShopItems deleteAt _index;
		_store setVariable ["ltdItems",_newShopItems,true];
	}else{	
		_newShopItems = +_items;	
		_store setVariable ["ltdItems",_newShopItems,true];
		format ["updateLtdItem:%1:%2",_newCur,_itemId] call RRPServer_DB_fireAndForget;
	};
	_ownerCompany = missionNamespace getVariable [format["ltdData_%1",_owner],[]];
	_sellerCompany = missionNamespace getVariable [format["ltdData_%1",_selled_by],[]];
	_total = [_totalCost,_taxItem] call RRPServer_ltd_calculateTaxAndReceipts;
	_total params ["_toSel","_toStore"];
	_curMoneyOwner = _ownerCompany select 2;
	_curMoneySeller = _sellerCompany select 2;
	if !(_selled_by isEqualTo _owner) then 
	{
		//------ To owner store company
		_toOwner = _curMoneyOwner + _toStore;
		_ownerCompany set [2,_toOwner];
		
		//------ To seller company
		_toSeller = _curMoneySeller + _toSel;
		_sellerCompany set [2,_toSeller];
		missionNamespace setVariable [format["ltdData_%1",_owner],_ownerCompany,true];
		missionNamespace setVariable [format["ltdData_%1",_selled_by],_sellerCompany,true];
	}else{
		//------ To owner store company only
		_toSeller = _curMoneySeller + 0;
		_toOwner = _curMoneyOwner + (_toStore + _toSel);
		_ownerCompany set [2,_toOwner];
		missionNamespace setVariable [format["ltdData_%1",_owner],_ownerCompany,true];
	};
	_totalTo = if (_selled_by isEqualTo _owner) then {round(_toSel + _toStore)}else{_toStore};
	_data = 
	[
		//------ To owner store company
		(missionNamespace getVariable [format["ltdData_%1",_owner],[]]) select 2,
		_owner,
		//------ To seller company
		(missionNamespace getVariable [format["ltdData_%1",_selled_by],[]]) select 2,
		_selled_by,
		//------ Total Earned
		_totalTo,_id
	];
	_message = ["updateLTDbank",_data] call RRPServer_DB_createMessage;
	_message call RRPServer_DB_fireAndForget;
	
	[format["%1 (%2) купил %3 (%4шт), комиссия %5, ID магазина %6, ID OOO %7 | Владельцу %8, Налог %9",name _player,getPlayerUID _player,_item,_count,_taxItem,_selled_in,_selled_by,[_toSel] call RRPClient_util_numberText,[_toStore] call RRPClient_util_numberText],"LTD_Logs"] call RRPServer_system_logIt;
	[_item,_count,_price] remoteExecCall ["RRPClient_ltd_shopBuyDone",_player];
	[_player,"cash","take",_totalCost] remoteExecCall ["RRPServer_system_moneyChange",2];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};

