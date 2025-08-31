/*
	Filename: 	RRPClient_system_vehicleShopBuyDone.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\..\script_macros.hpp"
params [
	["_done",false,[true]],
	["_vehicle",objNull,[objNull]],
	["_plate","",[""]],
	["_price",0,[0]],
	["_color","",[""]],
	["_material","",[""]]
];

if (_done) then {
	private _logText = format["Приобрел технику %1 за $%2",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call RRPClient_util_numberText];
	[player,"cash","take",STR(_price)] remoteExecCall ["RRPServer_system_moneyChange",2];
	_log = format ["VB: cash (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_price];
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
	titleText[format["Вы купили %1 за $%2. Регистрационный номер: %3",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call RRPClient_util_numberText,_plate],"PLAIN"];

	if !(EQUAL(_color,"")) then {[_vehicle,_color] call RRPClient_system_colorVehicle};
	if !(EQUAL(_material,"")) then {[_vehicle,_material] call RRPClient_system_materialVehicle};
} else {
	titleText["Не удалось оформить сделку по покупке техники. Попробуйте еще раз!","PLAIN"];
};
