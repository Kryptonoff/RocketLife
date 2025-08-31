
if !(canSuspend) exitWith {_this spawn RRPClient_trx_buyRequest};
params ["_category","_item"];
_config = missionConfigFile >> "CfgTRX" >> _category >> "items" >> _item;
_displayName = getText(_config >> "displayName");
_image = getText(_config >> "image");
_description = getText(_config >> "description");
_currency = getText(_config >> "currency");
_price = getNumber(_config >> "price");
_itemClass = getText(_config >> "item");

_type = getText(_config >> "buyType");
_exit = false;
switch _type do {
	case "permanent";
	case "rent":
	{
		if (_itemClass in secretShop) then {
			_exit = true;
		};
	};
};

if (_exit) exitWith {
	["TRX Store", "Этот предмет уже есть в доступе! Нельзя совершить повторную покупку!"] call toastInfo;
};

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;

[
	format ["Хотите купить %1 за %2 <img size='1' image='%3'/>",_displayName, _price, _currency call RRPClient_util_currencyIcon],
	"Принять","Отказаться"
] call RRPClient_tablet_showConfirm;
waitUntil {!isNil "RRPClientTabletConfirmResult"};
if !RRPClientTabletConfirmResult exitWith {};

["TRX Store", "Отправляем запрос..."] call toastInfo;
[player,_category, _item] remoteExecCall ["RRPServer_trx_buyRequest",2];