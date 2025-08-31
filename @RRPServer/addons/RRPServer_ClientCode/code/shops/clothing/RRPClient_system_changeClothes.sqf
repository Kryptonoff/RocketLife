/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
params [
	["_control",controlNull,[controlNull]],
	["_selection",0,[0]]
];
if (isNull _control) throw  {};
if (_selection isEqualTo -1) throw {};

private _class = (_control lbData _selection);
(_class call RRPClient_clothing_getItemInfo) params ["_display","_conditions","_conditionsMsg","_conditionsUse,","_conditionsUseMsg","_price"];

switch (life_clothing_filter) do {
	case 0: {removeUniform ShopBoxVehicle; ShopBoxVehicle forceAddUniform _class};
	case 1: {removeHeadGear ShopBoxVehicle; ShopBoxVehicle addHeadgear _class};
	case 2: {removeGoggles ShopBoxVehicle; ShopBoxVehicle addGoggles _class};
	case 3: {removeVest ShopBoxVehicle; ShopBoxVehicle addVest _class};
	case 4: {removeBackpack ShopBoxVehicle; ShopBoxVehicle addBackpack _class};
};

_display = uiNamespace getVariable ["RRPDialogClothingShop",displayNull];
private _ctrDescr = _display displayCtrl 21123;

private ["_color","_symbol"];


if (currencyType isEqualTo 'rc') then {
	_color = '#ffdd00';
	_symbol = 'RC';
} else {
	_color = '#3f6b00';
	_symbol = '$'
};
([_class] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
_price = ["countPrice",_price] call RRPClient_shops_utils;
_ctrDescr ctrlSetStructuredText parseText format ["<t size = '1.3' font = 'overwatch' >Цена: <t color='%2'>%1%3</t></t><br/>%4",_price,_color,_symbol, if  (_maxLimit != -1 && _curLimit != -1) then {format ["В Ассортименте осталось: %1/%2",_curLimit,_maxLimit]} else {""}];
