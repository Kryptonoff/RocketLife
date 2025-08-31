/*

	Filename: 	RRPClient_jobs_endJob.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (time - life_endjob_timer < 300) throw "Чтобы завершить работу снова придется подождать";
	life_endjob_timer = time;
	switch (true) do { 
		case !(isNull life_bus_job) : {
			life_bus_points = [];
			life_bus_job setTaskState "FAILED"; 
			player removeSimpleTask life_bus_job;
			player removeSimpleTask life_bus_task;
			["Работа", "Вы завершили работу водителя автобуса!"] call toastSuccess;
		};
		case !(isNull life_dlv_job) : {
			life_dlv_job setTaskState "FAILED"; 
			player removeSimpleTask life_dlv_job;
			[life_dlv_vehicle,"cargoDeliver"] call RRPClient_system_clearGlobalVar;
			["Работа", "Вы завершили работу дальнобойщика!"] call toastSuccess;
		};
		case !(isNull life_dhl_job) : {
			detach life_dhl_box;
			deleteVehicle life_dhl_box;
			life_dhl_job setTaskState "FAILED"; 
			player removeSimpleTask life_dhl_job;
			life_dhl_vehicle removeAction AID_TFW;
			life_dhl_startPoint = objNull;
			life_dhl_finishPoint = objNull;
			life_dhl_box = objNull;
			["Работа", "Вы завершили работу курьера DHL!"] call toastSuccess;
		};
		case !(isNull life_ds_job) : {
			player removeAction AID_DROPDSBOX;
			detach life_ds_box;
			deleteVehicle life_ds_box;
			if (currentWeapon player isEqualTo "") then {player PlayActionNow "FT_Act_Gesture_Reset"};
			life_ds_job setTaskState "FAILED"; 
			player removeSimpleTask life_ds_job;
			["Работа", "Вы завершили работу доставщика!"] call toastSuccess;
		};
		case !(isNull life_eco_gs_job) : {
			life_eco_gs_job setTaskState "FAILED"; 
			player removeSimpleTask life_eco_gs_job;
			player removeSimpleTask life_eco_gs_task;
			deleteMarkerLocal "eco_gs_marker";
			["Работа", "Вы завершили работу пробоотборщика!"] call toastSuccess;
		};
		case !(isNull life_eco_ws_job) : {
			life_eco_ws_job setTaskState "FAILED"; 
			player removeSimpleTask life_eco_ws_job;
			player removeSimpleTask life_eco_ws_task;
			deleteMarkerLocal "eco_ws_marker";
			["Работа", "Вы завершили работу пробоотборщика!"] call toastSuccess;
		};
		case !(isNull life_eln_job) : {
			life_eln_job setTaskState "FAILED"; 
			player removeSimpleTask life_eln_job;
			player removeSimpleTask life_eln_task;
			["Работа", "Вы завершили работу электрика!"] call toastSuccess;
		};
		//darkjobs
		case !(isNull life_dcleaner_job) : {
			life_dcleaner_job setTaskState "FAILED"; 
			deleteVehicle life_dcleaner_corpse;
			player removeSimpleTask life_dcleaner_job;
			player removeSimpleTask life_dcleaner_task;
			["Работа", "Вы завершили работу чистильщика!"] call toastSuccess;
		};
		case !(isNull life_dcourrier_job) : {
			life_dcourrier_job setTaskState "SUCCEEDED"; 
			player removeSimpleTask life_dcourrier_job;
			player removeSimpleTask life_dcourrier_task;
			["Работа", "Вы завершили работу наркокурьера!"] call toastSuccess;
		};
		case !(isNull life_rob_job) : {
			life_rob_job setTaskState "FAILED"; 
			player removeSimpleTask life_rob_job;
			["Работа", "Вы завершили работу грабителя!"] call toastSuccess;
		};
		case !(isNull life_terror_job) : {
			life_terror_job setTaskState "FAILED"; 
			player removeSimpleTask life_terror_job;
			["Работа", "Вы завершили работу диверсанта!"] call toastSuccess;
		};

		default {["Работа", "У вас нет работы!"] call toastError}; 
	};

	life_job_inProgress = false;
} catch {
	["Работа", _exception] call toastError;
};
