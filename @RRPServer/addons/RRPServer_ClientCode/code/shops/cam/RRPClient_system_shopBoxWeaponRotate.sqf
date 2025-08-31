/*

	Filename: 	RRPClient_system_shopBoxWeaponRotate.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_itemCategory","",[""]]
];
_dialogq = findDisplay 38400;
_NemaRcreditsWarning = _dialogq displayCtrl 2312;
_NemaRcreditsWarning ctrlSetStructuredText parseText "";
if (!isNull ShopBoxWeapHolder) then {deleteVehicle ShopBoxWeapHolder};
if (!isNull ShopBoxWeapTurnItem) then {deleteVehicle ShopBoxWeapTurnItem};

ShopBoxWeapTurnItem = "Land_Can_V3_F" createVehicleLocal getPosASL ShopBoxTable;
ShopBoxWeapTurnItem setPosATL getPosASL ShopBoxTable;
ShopBoxWeapTurnItem attachTo [ShopBoxTable, [0, 0, 0] ];
ShopBoxWeapTurnItem hideObject true;
detach ShopBoxWeapTurnItem;

ShopBoxWeapHolder = "WeaponHolderSimulated" createVehicleLocal getPosASL ShopBoxTable;
switcH (_itemCategory) do {
	case "Weapon": {
		ShopBoxWeapHolder addWeaponCargo [_item, 1];
	};
	case "Mine",
	case "Magazine": {
		ShopBoxWeapHolder addMagazineCargo [_item, 1];
	};
	default {
		ShopBoxWeapHolder addItemCargo [_item, 1];
	};
};
ShopBoxWeapHolder attachTo [ShopBoxWeapTurnItem, [0,-0.63,0.7]];
ShopBoxWeapHolder setVectorDirAndUp [[0,0,1],[0,-1,0]];

disableSerialization;
_display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];

_display displayAddEventHandler ["MouseButtonDown",
{
	if (_this select 1 isEqualTo 0) then
	{
		MouseButton = true;
	};
}];

_display displayAddEventHandler ["MouseButtonUp",
{
	if (_this select 1 isEqualTo 0) then
	{
		MouseButton = false;
	};
}];

_display displayAddEventHandler ["MouseMoving",
{
	if (MouseButton && {!isNil "ShopBoxWeapHolder"}) then {
		params ["", "_x", "_y"];
		private _dir = getDir ShopBoxWeapTurnItem;
		ShopBoxWeapTurnItem setDir (_dir + (_x * ((2 max 1) min 10)));
	};
}];
