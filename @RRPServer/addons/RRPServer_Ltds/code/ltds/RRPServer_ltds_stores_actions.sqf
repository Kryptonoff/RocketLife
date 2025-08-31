RRPServer_ltds_stores_actions = {
private _mode = param [0,"",[""]];
private _object = param [1,objNull,[objNull]];
private _parameters = param [2,[],[[]]];

private _name = _object getVariable ["ltdName","UNDEFINED"];
private _id = _object getVariable ["ltdID",-1];
private _idOwner = _object getVariable ["ltdOwner",0];
private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_idOwner],[]];

format ["LTDS: LTD: Stores: Parameters - %1 #1111",_this] call RRPServer_util_debugConsole;
try
{
	if (isNull _object) throw "Выбранный магазин не определен, попробуйте еще раз";
	switch _mode do
	{
		case "pay": 
		{
			_parameters params ["_player","_cost"];
			if (_player getVariable ["RRPPoint",0] < _cost) throw "У вас недостаточно средств!";
			private _curPayed = _object getVariable ["ltdPayedUntil",[]];
			_date = (parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[%2,0,0,0]",_curPayed,30]) select 1);
			format ["Date: %1",_date] call RRPServer_util_log;
			_object setVariable ["ltdPayedUntil",_date,true];	
			["SuccessTitleAndText", ["Управление бизнесом","Вы продлили магазину аренду на 30 дней"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
			format ["ltdsStorePay:%1",_id] call RRPServer_DB_fireAndForget;
			[_player,"point","take",_cost] call RRPServer_system_moneyChange;
			format ["insertRcLog:%1:%2:%3:%4:%5:%6",
					serverid,name _player,getPlayerUID _player,"ltd",_cost,
					format ["Оплатил магазин %1 (ID %2)",_object getVariable ["ltdName",""],_id]
			] call RRPServer_DB_lk_fireAndForget;
		};
		case "upgrade": 
		{
			_parameters params ["_player","_cost"];
			if (_player getVariable ["RRPPoint",0] < _cost) throw "У вас недостаточно средств!";
			private _curGds = _object getVariable ["ltdMaxGds",5];
			private _newGds = _curGds + 5;
			_object setVariable ["ltdMaxGds",_newGds,true];
			["SuccessTitleAndText", ["Управление бизнесом","Вы добавили магазину 5 слотов"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
			format ["ltdsStoreUpgrade:%1",_id] call RRPServer_DB_fireAndForget;
			[_player,"point","take",_cost] call RRPServer_system_moneyChange;
			format ["insertRcLog:%1:%2:%3:%4:%5:%6",
				serverid,
				name _player,
				getPlayerUID _player,
				"ltd",
				_cost,
				format ["Добавил 5 слотов в магазине %1 (ID %2)",_object getVariable ["ltdName",""],_id]
			] call RRPServer_DB_lk_fireAndForget;
		};
		case "setDiscount": 
		{
			_parameters params ["_discount","_onDay"];
			private _curDiscount = 	_object getVariable ["ltdDiscount",0];
			private _discountDate = _object getVariable ["ltdDiscountDate",[]];
			if !(_curDiscount isEqualTo 0) throw "Нельзя установить новую скидку, пока действует предыдущая";
			
			_object setVariable ["ltdDiscount",_discount,true];
			_date = ["Day",_onDay] call RRPServer_util_addDate;
			_object setVariable ["ltdDiscountDate",_date,true];
			format ["ltdsStoreDiscount:%1:%2:%3",_discount,_onDay,_id] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText", ["Управление бизнесом",format ["Вы успешно установили скидку на магазин в %1%2",_discount,"%"]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		case "rename": {
			_parameters params [["_newName","ЧЕГО ЧЕГО ЧЕГО?"]];
			if (isNull _object) throw "Магазин не определен";
			_object setVariable ["ltdName",_newName,true];
			private _marker = format ["LTDStore_%1",_id];
			_marker setMarkerText format["%1",_newName];
			format ["ltdsStoreRename:%1:%2",_newName,_id] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText", ["Управление бизнесом",format ["Вы успешно сменили имя магазина на '%1'",_newName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		case "tax": 
		{
			_parameters params [["_newTax",1]];
			private _curTax = _object getVariable ["ltdTax",1];
			_object setVariable ["ltdTax",_newTax,true];
			format ["ltdsStoreTax:%1:%2",_newTax,_id] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText", ["Управление бизнесом", format ["Вы успешно установили пошлину магазина на '%1%2'",_newTax,"%"]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		case "lockUnlock": 
		{
			_parameters params [["_input",0]];
			_bool = [_input] call RRPServer_util_tinyIntConverter;
			_object setVariable ["ltdActive",_bool,true];
			format ["ltdsStoreActive:%1:%2",_bool,_id] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText", ["Управление бизнесом", "Статус магазина обновлен"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		case "mode": 
		{
			_parameters params [["_input",0]];
			_bool = [_input] call RRPServer_util_tinyIntConverter;
			_object setVariable ["ltdMode",_bool,true];
			format ["ltdsStoreMode:%1:%2",_bool,_id] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText", ["Управление бизнесом", "Режим магазина обновлен"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		case "remove": {

		};
		case "drop": {
			cursorObject setVariable ["ltdID",nil, true];
			cursorObject setVariable ["ltdOwner",nil, true];
			cursorObject setVariable ["ltdName",nil, true];
			cursorObject setVariable ["ltdLevel",nil, true];
			cursorObject setVariable ["ltdActive",nil, true];
			cursorObject setVariable ["ltdMode",nil, true];
			cursorObject setVariable ["ltdTax",nil, true];
			cursorObject setVariable ["ltdDiscount",nil, true];
			cursorObject setVariable ["ltdDiscountDate",nil, true];
			cursorObject setVariable ["ltdRentEnd",nil, true];
			cursorObject setVariable ["ltdBlacklist",nil, true];
			cursorObject setVariable ["ltdItems",nil, true];
		};
		case "rent": {
			_parameters params ["_player", ["_cost",0], ["_companyID",-1]];
			if (isNull _object) throw "Магазин не определен";
			if (isNull _player) throw "Игрок не определен";
			if (_cost <= 0) throw "Стоимость не может быть меньше 0";
			if (_companyID isEqualTo -1) throw "Компания не определена";
			private _config = getMissionConfig "CfgLtds" >> "stores" >> vehicleVarName _object; 
			if !(isClass _config) throw "Этот магазин не настроен";
			private _name = getText(_config >> "defaultName");
			_objectID = format ["insertNewStoreV2:%1:%2:%3:%4",vehicleVarName _object, _name, _companyID, getPosATL _object] call RRPServer_DB_insertSingle;
			format ["OBJID: %1",_objectID] remoteExecCall ["chat",remoteExecutedOwner];
			if (isNil "_objectID") throw "Похоже, что этот магазин еще арендован";
			_object setVariable ["ltdID",_objectID, true];
			_object setVariable ["ltdOwner",_companyID, true];
			_object setVariable ["ltdName",_name, true];
			_object setVariable ["ltdLevel",1, true];
			_object setVariable ["ltdActive",true, true];
			_object setVariable ["ltdMode",true, true];
			_object setVariable ["ltdTax",1, true];
			_object setVariable ["ltdDiscount",0, true];
			_object setVariable ["ltdDiscountDate",[], true];
			_object setVariable ["ltdRentEnd",["Day",30] call RRPServer_util_addDate, true];
			_object setVariable ["ltdBlacklist",[], true];
			_object setVariable ["ltdItems",createHashMap, true];

			[_player,"point","take",_cost] call RRPServer_system_moneyChange;
		};
		default {};
	};
	["refresh","store",_object] remoteExecCall ["RRPClient_ltds_ltd_actions",remoteExecutedOwner];
}catch{
	["ErrorTitleAndText",["Управление бизнесом",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
true
}

