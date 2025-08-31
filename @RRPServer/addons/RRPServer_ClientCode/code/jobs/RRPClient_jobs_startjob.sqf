
#include "..\..\script_macros.hpp"
try{
	//принимаем название работы
	private _jobName = _this select 0;
	private _uid = getPlayerUID player;
	private _jobActive = "ActiveJob";

	if (_jobName isEqualto "cuttree" and {!license_tree}) throw "У вас нет лицензии дровосека";
	if (_jobName isEqualto "") throw "Ошибка 1001/1";

	if !([_jobName] call RRPClient_jobs_dresskodCheck) throw "Ваш Дресс-код не соответствует данному виду работы!";

	private _className = getText (missionConfigFile >> "SmartJobs" >> _jobName >> "Work_car");
	private _spawnPoint = getText (missionConfigFile >> "SmartJobs" >> _jobName >> "spawn_car");
	private _spawnPointPos = getMarkerPos _spawnPoint;
	private _needSide = getText (missionConfigFile >> "SmartJobs" >> _jobName >> "side");


	if (EQUAL(_className,"")) throw "Работа не определена";
	if (EQUAL(_spawnPoint,"")) throw "Работа не определена";

	private _side = player call getSide;

	if !(_needSide isEqualto _side) throw "Ваша фракция не позволяет начать эту работу!";
	if (count(nearestObjects[_spawnPointPos,["LandVehicle","Ship","Air"],5]) > 0) throw "Точка выдачи занята!";

	if (!isNull life_job_car) throw "У вас уже есть рабочий автомобиль!";
	if (alive life_job_car) throw "У вас уже есть рабочий автомобиль!";


	private _priceRental = switch (_jobName) do 
	{
		case "cuttree" : {30000};
		default {228};
	};

	if (_priceRental isEqualto 228) throw "Ошибка #2342, Обратитесь к тех. Админам";
	if (CASH < _priceRental) throw format["Что-бы взять грузовик в аренду нужно иметь при себе %1",_priceRental];

	_action = [
		"Вы действительно хотите взять в аренду грузовик для лесопилки? Это вам обойдется в 30000$",
		"",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;


	if (_action) then {
		[player,"cash","take",_priceRental] remoteExecCall ["RRPServer_system_moneyChange",2];

		life_job_car = createVehicle [_className,[0,0,999],[],0,"NONE"];
		waitUntil {!isNil "life_job_car" && {!isNull life_job_car}};
		life_job_car allowDamage false;
		life_job_car setVectorUp (surfaceNormal _spawnPointPos);
		life_job_car setDir (markerDir _spawnPoint);
		life_job_car setPos _spawnPointPos;

		player reveal life_job_car;
		life_vehicles pushBack life_job_car;
		[steamid,life_job_car,1] remoteExecCall ["RRPServer_system_keyManagement",RSERV];

		[life_job_car,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;
		[life_job_car,"insPrice"] call RRPClient_system_clearGlobalVar;

		[life_job_car] call RRPClient_system_vehSetupRadio;
		[life_job_car] call RRPClient_system_clearVehicleAmmo;

		life_job_car lock 2;
		life_job_car disableTIEquipment true;
		life_job_car enableRopeAttach false;
		life_job_car allowDamage true;

		life_job_active = true;
		profileNamespace setVariable [_jobActive,life_job_active];

		["SuccessTitleAndText", ["Успех!", "Автомобиль выдан!"]] call SmartClient_gui_toaster_addTemplateToast;
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};