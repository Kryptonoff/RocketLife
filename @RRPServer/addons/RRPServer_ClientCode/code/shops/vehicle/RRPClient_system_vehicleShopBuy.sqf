/*
	Filename: 	RRPClient_system_vehicleShopBuy.sqf
*/
#include "..\..\..\script_macros.hpp"
try{
	private _mode = param [0,"",[""]];
	if (RRPClientWaitingBuyCar) throw "Прудыдущая транзакция еще не завершена!";
	if (EQUAL((lbCurSel 2302),-1)) throw "Вы не выбрали технику!";
	private _dialog = findDisplay 2300; //диалог
	private _NemaRcreditsWarning = _dialog displayCtrl 2312;
	_error = false;
	private _data = CONTROL_DATA(2302);
	(parseSimpleArray _data) params ["_className",["_conditions","",[""]],["_conditionsMsg","",[""]]];
	if !([_conditions] call RRPClient_util_conditionsCheck) throw (M_CONFIG(getText,"LifeCfgVehShops",life_veh_shop select 0,"conditionsMessage"));

	private _colorValue = CONTROL_VALUE(2304);
	if (!(EQUAL((lbCurSel 2304),-1)) && {EQUAL(_colorValue,0)}) throw "Этот цвет вам недоступен";

	private _materialValue = CONTROL_VALUE(2305);
	if (!(EQUAL((lbCurSel 2305),-1)) && {EQUAL(_materialValue,0)}) throw "Этот материал вам недоступен";

	if (_mode in ["buy","buyRC"] and {(getText(missionConfigFile >> "LifeCfgVehShops" >> (life_veh_shop select 0) >> "onlyrent") isEqualto "true")}) throw "Этот транспорт доступен только в аренду";

	private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price") * M_CONFIG(getNumber,"LifeCfgVehShops",(life_veh_shop select 0),"multiplier");
	_basePrice = ['priceSell',_basePrice] call RRPClient_system_VIP;

	private _basePriceForRc = round(_basePrice);
	_basePrice = switch (_mode) do
	{
		case "buy": {_basePrice};
		case "Rent": {round(_basePrice * 0.75)};
		case "buyRC": {round((_basePrice) / getNumber(missionConfigFile >> "LifeCfgSettings" >> "dividerDonateCar"))};
		default {};
	};
	if (_basePrice isEqualto 0 ) throw "Цена не определена";
	private _color = CONTROL_DATA(2304);
	private _material = CONTROL_DATA(2305);

	private _classParents = [(configFile >> "CfgVehicles" >> _className),true] call BIS_fnc_returnParents;
	if (server_ddos_air && {"Air" in _classParents}) throw "На острове наблюдаются магнитные бури. Воздушная техника временно недоступна";

	if (_mode in ["Rent","buy"]) then
	{
		if (CASH < _basePrice) then {titleText[format["У вас недостаточно средств для покупки этой техники. Вам нехватает: $%1",[_basePrice - CASH] call RRPClient_util_numberText],"PLAIN"]; _error = true};
	}
	else
	{
		if (SmartPoints < _basePrice) then
		{
			_NemaRcreditsWarning ctrlSetStructuredText parseText format ["<t align='center' color='#B22222'  size='2' >Ошибка!</t><br />
			<t color='#FFFFFF' align='center'>Для покупки данного вида техники вам недостаточно %1 <t color='#FFFF00' >Rcredits</t >!</t><br />
			<t color='#FFFFFF' align='center'>Подробная информация по ссылке ниже в разделе ""услуги"", нажмите на ссылку что бы перейти!</t><br /><br />
			<a href='https://lk.rocket-rp.fun/' size='1.6' underline='true' color='#FFFF00' align='center'>lk.rocket-rp.fun</t>",[_basePrice - SmartPoints] call RRPClient_util_numberText];
			throw "Недостаточно RCredits";
		};
	};
	if (_error) exitWith {};

	private _spawnPoints = life_veh_shop select 1;
	private _spawnPoint = "";

	if (_spawnPoints isEqualType []) then {
		{
			if (count(nearestObjects[(getMarkerPos _x),["LandVehicle","Ship","Air"],5]) == 0) then {_spawnPoint = _x; break};
		} forEach _spawnPoints;
	} else {
		if (count(nearestObjects[(getMarkerPos _spawnPoints),["LandVehicle","Ship","Air"],5]) == 0) then {_spawnPoint = _spawnPoints};
	};

	if (EQUAL(_spawnPoint,"")) throw "Точка выдачи уже занята техникой";

	private _dir = (markerDir _spawnPoint);
	private _sp = getMarkerPos _spawnPoint;
	if (isClass (missionConfigFile >> "LifeCfgGarages" >> "shopVeh_marker" >> _spawnPoint)) then
	{
		_check = getArray(missionConfigFile >> "LifeCfgGarages" >> "shopVeh_marker" >> _spawnPoint >> "position");
		if !(_check isEqualTo []) then
		{
			_sp = getArray(missionConfigFile >> "LifeCfgGarages" >> "shopVeh_marker" >> _spawnPoint >> "position") select 0;
			_dir = getArray(missionConfigFile >> "LifeCfgGarages" >> "shopVeh_marker" >> _spawnPoint >> "position") select 1;
		};
	};
	_vehicle = objNull;
	_createVehicle = {
		_vehicle = [_className,_sp,_dir,true] call RRPClient_system_createSafetyVehicle;
		waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
		player reveal _vehicle;
		life_vehicles pushBack _vehicle;
		[steamid,_vehicle,1] remoteExecCall ["RRPServer_system_keyManagement",RSERV];

		_vehicle setVariable ["vehicle_info_owners",[[steamid,player call getFullName]],true];
		_vehicle setVariable ["insPrice",_basePrice,true];
		_vehicle
	};


	if (player getVariable ["restrained",false]) then {
		[format["%1(%2)",(name player),(getPlayerUID player)],"VehicleDUPELog"] remoteExecCall ["RRPServer_system_logIt",2];
		throw "Ты пойман!";
	};
	switch (_mode) do
	{
		case "buy":
		{
			call RRPClient_util_throwGarageSlots;
			RRPClientWaitingBuyCar = true;
			_vehicle = call _createVehicle;
			[player,"cash","take",_basePrice,[format["%1 (%2) купил %3 за %4",name player,steamid,_className,[_basePrice] call RRPClient_util_numberText],"VehicleBuyLog"]] remoteExecCall ["RRPServer_system_moneyChange",2];
			_plate = call RRPClient_vehicle_setPlateNumber;
			_vehicle setPlateNumber _plate;
			[[steamid,_vehicle,_color,_material,_basePrice,_plate],"garage_vehicleCreate"] call RRPClient_system_hcExec;
			if !(EQUAL(_color,"")) then {[_vehicle,_color] call RRPClient_system_colorVehicle};
			if !(EQUAL(_material,"")) then {[_vehicle,_material] call RRPClient_system_materialVehicle};
			["SuccessTitleAndText",["Магазин",format["Вы купили %1 за $%2",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call RRPClient_util_numberText]]] call toast;
			[30, "покупку техники"] call addXP;
			if (_basePrice >= 300000) then
			{
				["carBillion",1] call RRPClient_ach_gateway;
			};
		};
		case "buyRC":
		{
			call RRPClient_util_throwGarageSlots;
			RRPClientWaitingBuyCar = true;
			_vehicle = call _createVehicle;
			[player,"point","take",_basePrice,[format["%1 (%2) купил %3 за %4",name player,steamid,_className,[_basePrice] call RRPClient_util_numberText],"VehicleBuyLog"]] remoteExecCall ["RRPServer_system_moneyChange",2];
			format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name player,getPlayerUID player,"buyVehicle",_basePrice,format ["Купил %1 за %2",_className,[_basePrice] call RRPClient_util_numberText]] remoteExecCall ["RRPServer_DB_lk_fireAndForget",2];
			["Car", _basePrice, getPlayerUID player,_className, _mode] remoteExecCall ["RRPServer_system_Rcreditslog",2];
			_plate = call RRPClient_vehicle_setPlateNumber;
			_vehicle setPlateNumber _plate;
			[[steamid,_vehicle,_color,_material,_basePriceForRc,_plate],"garage_vehicleCreate"] call RRPClient_system_hcExec;
			if !(EQUAL(_color,"")) then {[_vehicle,_color] call RRPClient_system_colorVehicle};
			if !(EQUAL(_material,"")) then {[_vehicle,_material] call RRPClient_system_materialVehicle};
			["SuccessTitleAndText",["Магазин",format["Вы купили %1 за RCredits %2",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call RRPClient_util_numberText]]] call toast;
			['buyRcCar',1] call RRPClient_ach_gateway;
			[60, "покупку техники"] call addXP;
		};
		case "Rent":
		{
			_vehicle = call _createVehicle;
			[player,"cash","take",_basePrice,[format["%1 (%2) арендовал %3 за %4",name player,steamid,_className,[_basePrice] call RRPClient_util_numberText],"VehicleBuyLog"]] remoteExecCall ["RRPServer_system_moneyChange",2];
			[player,"serverbank","add",_basePrice] remoteExecCall ["RRPServer_system_moneyChange",2];
			["SuccessTitleAndText",["Магазин",format["Вы взяли в аренду %1 за $%2",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call RRPClient_util_numberText]]] call toast;
			_vehicle setPlateNumber "RENTING";
			RRPClientWaitingBuyCar = false;
			if !(EQUAL(_color,"")) then {[_vehicle,_color] call RRPClient_system_colorVehicle};
			if !(EQUAL(_material,"")) then {[_vehicle,_material] call RRPClient_system_materialVehicle};
			[10, "аренду техники"] call addXP;
		};
	};

	[_vehicle] spawn RRPClient_system_vehicleAnimate;
	[_vehicle,[]] call RRPClient_adac_setup;
	[_vehicle] call RRPClient_system_vehSetupRadio;
	[_vehicle] call RRPClient_system_clearVehicleAmmo;
	[_vehicle] call RRPClient_system_clearVehicleSensors;
	[_vehicle] remoteExec ["RRPClient_system_vehicleActions",independent,_vehicle];

	_vehicle lock 2;
	_vehicle disableTIEquipment true;
	_vehicle enableRopeAttach false;
	_vehicle allowDamage true;

	[(netID _vehicle)] remoteExecCall ["RRPServer_event_vehicleMsnHandlers",2];
	waitUntil {!(local _vehicle)};

	if (_className isKindOf "Ship") then {
		_vehicle setPosASL _sp;
	} else {
		_vehicle setPosATL _sp;
	};

	[player] remoteExecCall ["RRPServer_garage_refreshCountGarage",2];
	player moveInDriver _vehicle;
	closeDialog 0;
}catch{
	[_exception] call toastError;
};
