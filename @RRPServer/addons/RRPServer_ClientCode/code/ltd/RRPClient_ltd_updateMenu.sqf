/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;

_mode = param [0,false,[false]];
if (_mode) exitWith {RRPClientLtdWaitResponse = false;};
private _dialog = 		uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
if (isNull _dialog) 	exitWith {};
private _store =		RRPClientStoreSelected;
private _title = 		_dialog displayCtrl 9001;
private _taxEdit = 		_dialog displayCtrl 9405;
private _taxBtn = 		_dialog displayCtrl 9406;
private _modeBtn = 		_dialog displayCtrl 9407;
private _discountEdit = _dialog displayCtrl 9413;
private _nameEdit = 	_dialog displayCtrl 9416;
private _nameStoreBtn = _dialog displayCtrl 9006;
private _storeInfprm = 	_dialog displayCtrl 9424;
private _closeBtn = 	_dialog displayCtrl 9422;
private _storeList = 	_dialog displayCtrl 9411;
private _plusPos = 		_dialog displayCtrl 9420;
private _plusDay = 		_dialog displayCtrl 9421;

_hide = ["RRPDialogCompanyMenu",[9402,9405,9406,9407,9411,9413,9414,9415,9416,9417,9420,9421,9422,9424]] spawn RRPClient_gui_util_hideControls;
waitUntil {scriptDone _hide};
["RRPDialogCompanyMenu",[9402,9405,9406,9407,9411,9413,9414,9415,9416,9417,9420,9421,9422,9424]] spawn RRPClient_gui_util_showControls;

private _tax = 			_store getVariable ["ltdTax",0];
private _discount = 	_store getVariable ["ltdDiscount",0];
private _discountDate = _store getVariable ["ltdDiscountDate",[]];
private _maxGoods = 	_store getVariable ["ltdMaxGds",0];
private _name = 		_store getVariable ["ltdName",0];
private _active = 		if (_store getVariable ["ltdActive",false]) then {"ОТКРЫТ"}else{"ЗАКРЫТ"};
private _license = 		_store getVariable ["ltdLicense",0];
private _ID = 			_store getVariable ["ltdID",0];
private _items = 		count (_store getVariable ["ltdItems",[]]);
private _dateUntill = 	[_store getVariable ["ltdPayedUntil",[]]] call RRPClient_util_dateToString;
private _mod = 			_store getVariable ["ltdMode",false];
private _mode = 		if (_mod) then {"Для всех"}else{"Только сотрудники"};
if (_discountDate isEqualTo "") then {_discountDate = "НЕ АКТИВНА";}else{_discountDate = [_discountDate] call RRPClient_util_dateToString;};

_taxEdit ctrlSetText str(_tax);
_discountEdit ctrlSetText str(_discount);
_nameEdit ctrlSetText _name;
_modeBtn ctrlSetText _mode;
_closeBtn ctrlSetText _active;

lbClear _storeInfprm;
_storeInfprm lbAdd format ["Магазин: %1",_name];
_storeInfprm lbAdd format ["Пошлина: %1%2",_tax,"%"];
_storeInfprm lbAdd format ["Товаров на продаже: %1 (%2)",_items,_maxGoods];
// _storeInfprm lbAdd format ["Деятельность: %1",_license];
_storeInfprm lbAdd format ["Статус: %1",_active];
_storeInfprm lbAdd format ["Режим продажи: %1",_mode];
_storeInfprm lbAdd format ["Активен до: %1",_dateUntill];
_storeInfprm lbAdd format ["Скидка: %2%1","%",_discount];
_storeInfprm lbAdd format ["Скидка активна до: %1",_discountDate];

RRPClientLtdWaitResponse = false;