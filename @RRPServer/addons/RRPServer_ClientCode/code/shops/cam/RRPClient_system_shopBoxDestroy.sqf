/*

	Filename: 	RRPClient_system_shopBoxDestroy.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

params [['_display',displayNull,[displayNull]]];

ShopBoxCamera cameraEffect ["terminate", "back"];
camDestroy ShopBoxCamera;
if (!isNil "ShopBoxTable" && {!isNull ShopBoxTable}) then {deleteVehicle ShopBoxTable};
if (!isNil "ShopBoxVehicle" && {!isNull ShopBoxVehicle}) then {deleteVehicle ShopBoxVehicle};
if (!isNil "ShopBoxBackgroundObject" && {!isNull ShopBoxBackgroundObject}) then {deleteVehicle ShopBoxBackgroundObject};
if (!isNil "ShopBoxLightSource" && {!isNull ShopBoxLightSource}) then {deleteVehicle ShopBoxLightSource};
if (!isNil "ShopBoxLight_1" && {!isNull ShopBoxLight_1}) then {deleteVehicle ShopBoxLight_1};
if (!isNil "ShopBoxLight_2" && {!isNull ShopBoxLight_2}) then {deleteVehicle ShopBoxLight_2};
if (!isNil "ShopBoxLight_3" && {!isNull ShopBoxLight_3}) then {deleteVehicle ShopBoxLight_3};
if (!isNil "ShopBoxLight_4" && {!isNull ShopBoxLight_4}) then {deleteVehicle ShopBoxLight_4};
if (!isNil "ShopBoxWeapHolder" && {!isNull ShopBoxWeapHolder}) then {deleteVehicle ShopBoxWeapHolder};
if (!isNil "ShopBoxWeapTurnItem" && {!isNull ShopBoxWeapTurnItem}) then {deleteVehicle ShopBoxWeapTurnItem};

if !(isNull _display) then {
	private _lightSource = _display getVariable['lightpoint', objNull];
	private _previewHangar = _display getVariable['previewHangar', objNull];
	private _previewVehicle = _display getVariable['previewVehicle', objNull];
	deleteVehicle _lightSource;
	deleteVehicle _previewHangar;
	deleteVehicle _previewVehicle;
};
showHUD true;
showCinemaBorder false;
uiNamespace setVariable ["UnionDialogVehicleShopV2",displayNull];
