/*

	Filename: 	RRPClient_jobs_spawnVehicle.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if !([getText(missionConfigFile >> "CfgJobs" >> _this >> "conditions")] call RRPClient_util_conditionsCheck) throw (getText(missionConfigFile >> "CfgJobs" >> _this >> "conditionsMessage"));

	private _price = getNumber(missionConfigFile >> "CfgJobs" >> _this >> "life_vehicle_price");
	private _action = [format ["Чтобы получить служебную технику необходимо оставить залог в $%1. Вы сможете получить его обратно в офисе. Деньги будут списаны с вашего банковского счета.",[_price] call RRPClient_util_numberText],"Получение служебной техники","Да","Нет"] call BIS_fnc_guiMessage;
	if !(_action) throw "Вы отказались";

	if !(_this call RRPClient_jobs_clothCheck) throw "Вы должны быть одеты в комплект униформы, которую можно купить в офисе. А так же никакого оружия в руках или на виду.";
	private _className = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_vehicle_class");
	private _spawnPoint = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_office_spawn");
	private _spawnPointPos = getMarkerPos _spawnPoint;

	if (_className isEqualTo "") throw "Не задан класс автомобиля в конфиге";
	if (_spawnPoint isEqualTo "") throw "Не задана точка спауна в конфиге";
	if ((player call getSide) in ["cop", "med"]) throw "Работать на службе нельзя!";
	if (count(nearestObjects[_spawnPointPos,["LandVehicle","Ship","Air"],5]) > 0) throw "Точка выдачи техники занята!";
	if (!isNull (missionNamespace getVariable [format["life_%1_vehicle",_this],objNull])) throw "У вас уже есть рабочая техника!";

	if (_price > RRPClientAtmMoney) throw "У вас нет такой суммы на вашем счёте!";
	[player,"atm","take", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

	private _vehicle = [_className, _spawnPointPos, markerDir _spawnPoint, true] call RRPClient_system_createSafetyVehicle;
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	waitUntil {(local _vehicle)};
	missionNamespace setVariable [format["life_%1_vehicle",_this], _vehicle];

	player reveal _vehicle;
	life_vehicles pushBack _vehicle;
	[[getPlayerUID player,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;

	[_vehicle,"vehicle_info_owners",[[getPlayerUID player, player call getNickName]]] call CBA_fnc_setVarNet;
	[_vehicle,"vehicle_limits",_this] call CBA_fnc_setVarNet;
	
	_vehicle lock 2;
	_vehicle disableTIEquipment true;
	_vehicle enableRopeAttach false;

	[_vehicle] spawn RRPClient_system_vehicleAnimate;
	[_vehicle] call RRPClient_system_vehSetupRadio;
	[_vehicle] call RRPClient_system_clearVehicleAmmo;
		
	[_vehicle, _this] call RRPClient_jobs_rentTimer;

	["Работа", "Техника ожидает вас на точке выдачи!"] call toastSuccess;

	_this spawn RRPClient_jobs_spawnVehicleTask;
} catch {
	["Работа", _exception] call toastError;
};
