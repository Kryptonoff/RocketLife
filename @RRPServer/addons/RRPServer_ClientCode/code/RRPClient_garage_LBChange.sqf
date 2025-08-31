/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

#include "..\script_macros.hpp"
disableSerialization;
private _control = _this select 0;
private _index = _this select 1;
private _dataArr = _control lbData _index;
_dataArr = call compile format["%1",_dataArr];

_dataArr params ["_classname","_color","_spname","_tuning_data","_insure","_baseprice","_material","_fuel","_servermap","_parking","_plate","_distance","_damage"];
_spName = LIFE_GTITLE(worldName,_spName);
private _vehicleColor = if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) then {M_CONFIG(getText,"LifeCfgVehTextures",_color,"displayName")} else {"Стандарт"};
private _vehicleMaterial = if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _material)) then {M_CONFIG(getText,"LifeCfgVehMaterials",_material,"displayName")} else {"Стандарт"};
private _vehicleInfo = [_className] call RRPClient_util_fetchVehInfo;
private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

private ["_sellPrice","_retrievePrice"];
if (EQUAL(_basePrice,0)) then {
	_sellPrice = 0;
	_retrievePrice = 0;
} else {
	_sellPrice = round (_basePrice - (_basePrice*0.3));
	_retrievePrice = round (_basePrice * 0.02);
	if (["MatesRates"] call perk) then {_retrievePrice = round(_retrievePrice * 0.75)};
};

if (player call getSide in ["cop","med"] OR (_retrievePrice <= 0)) then {_retrievePrice = 500};
if (_sellPrice <= 0) then {ctrlEnable[2813,false]} else {ctrlEnable[2813,true]};
if (EQUAL(_parking,[])) then 
{
	(CONTROL(2800,2803)) ctrlSetStructuredText parseText format["<t size='0.95' color='#FFFFFF'>" +
		"Цена выдачи:" + " <t color='#3b7200'>$%1</t><br/>" +
		"Цена продажи:" + " <t color='#3b7200'>$%2</t><br/><br/>" +
		"Макс скорость:" + " %3 км/ч<br/>" +
		"Мощность (л/с)" + " %4<br/>" +
		"Мест для пассажиров:" + " %5<br/>" +
		"Вместимость багажника:" + " %6<br/>" +
		"Объем бензобака:" + " %7<br/>" +
		"Заполненость бака:" + " %17%18<br/>" +
		"Топливо:" + " %16<br/>" +
		"Цвет" + " %8<br/>" +
		"Материал:" + " %9<br/>" +
		"Номер:" + " %14<br/>" +
		"Пробег:" + " %15 км.<br/>" +
		"Гараж:" + " %10<br/>" +
		"Остров:" + " %11<br/>" +
		"Апгрейд:" + " %12<br/>" +
		"Страховка:" + " %13<br/>",
		[_retrievePrice] call RRPClient_util_numberText,
		[_sellPrice] call RRPClient_util_numberText,
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		_trunkSpace,
		_vehicleInfo select 12,
		_vehicleColor,
		_vehicleMaterial,
		_spName,
		_serverMap,
		if (EQUAL(_tuning_data,[])) then {"Отсутствуeт"} else {"Есть"},
		if ((_insure isEqualTo 1) OR (_insure isEqualTo 2)) then {"Есть"}else{"Отсутствуeт"},
		_plate,
		_distance,
		"Неизвестно",
		_fuel * 100,
		"%"
	];
	if (_insure == 2) then {
		ctrlShow[2812,false];
		ctrlShow[2813,false];
		ctrlShow[2814,true];
	} else {
		ctrlShow[2812,true];
		ctrlShow[2813,true];
		ctrlShow[2814,false];
		ctrlShow [2815,true];
		ctrlShow [2816,true];

		if !(EQUAL(_serverMap,worldName)) then {
			ctrlEnable[2812,false];
		} else {
			ctrlEnable[2812,true];
		};
	};
} else {
	(CONTROL(2800,2803)) ctrlSetStructuredText parseText format["<t size='0.95' color='#FF0000'>Техника на штрафстоянке!<br/><br/>Сумма штрафа: $%1</t><br/>Примечание: %2</t></t>",[_parking select 0] call RRPClient_util_numberText,(_parking select 1)];
	ctrlShow[2812,false];
	ctrlShow[2813,false];
	ctrlShow[2814,false];
	ctrlShow [2815,false];
	ctrlShow [2816,false];
};

ctrlShow [2803,true];