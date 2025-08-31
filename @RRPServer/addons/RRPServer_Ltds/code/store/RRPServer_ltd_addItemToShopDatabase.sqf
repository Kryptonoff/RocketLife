/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params 
[
	["_player",objNull,[objNull]],
	["_store",objNull,[objNull]],
	["_shopID",0,[0]],
	["_item","",[""]],
	["_amount",0,[0]],
	["_price",0,[0]],
	["_ltdID",0,[0]]
];

try
{
	if (isNull _player) throw "Вы NULL!";
	if (isNull _store) throw "Магазин NULL!";
	if (_shopID isEqualTo 0) throw "Проблемы с ID магазина";
	if (_item isEqualTo "") throw "Проблемы с предметом";
	if (_amount isEqualTo 0) throw "Количество продаваемых товаров долно быть больше 1";
	if (_price isEqualTo 0) throw "Цена не может быть меньше 1";
	if (_ltdID isEqualTo 0) throw "Ошибка с ID компании";
	private _mode = _store getVariable ["ltdMode",false];
	private _ownerID = _store getVariable ["ltdOwner",-1];
	if !(_mode) then 
	{
		if !(_ltdID isEqualTo _ownerID) throw "Магазин не принимает товары длугих компаний";
	};
	private _owner = _store getVariable ["ltdID",0];
	private _tax = _store getVariable ["ltdTax",3];
	private _items = _store getVariable ["ltdItems",[]];
	_data = 
	[	
		_item,
		_amount,
		_price,
		_tax,
		_owner,
		_ltdID		
	];
	_message = ["addItemToStore",_data] call RRPServer_DB_createMessage;
	_id = _message call RRPServer_DB_insertSingle;
	
	_array = [_id,_item,_amount,_price,_tax,_owner,_ltdID,false];
	_items pushBack _array;
	_store setVariable ["ltdItems",_items,true];
	[format["%1 (%2) выставил на продажу %3 (%4шт) за $%5 с комиссией %6 ID Store: %7, ID OOO: %8",name _player,getPlayerUID _player,_item,_amount,_price,_tax,_owner,_ltdID],"LTD_Logs"] call RRPServer_system_logIt;
	[_item,_amount] remoteExecCall ["RRPClient_ltd_shopSubmitDone",_player];
	['businessman',1] remoteExecCall ["RRPClient_ach_gateway",owner _player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	life_action_inUse = false;
	(remoteExecutedOwner) publicVariableClient "life_action_inUse";
};