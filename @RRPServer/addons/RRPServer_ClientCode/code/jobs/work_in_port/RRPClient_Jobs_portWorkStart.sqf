#include "..\..\..\script_macros.hpp"
private _type = _this select 0;
private _jobName = _this select 1;
// systemchat format ["%1", _this];

private _launcher = LAUNCHER;
private _weapon = CURWEAPON;
private _rifle = RIFLE;
private _pistol = PISTOL;
private _PBINOCULAR = PBINOCULAR;

try {
	if !(_weapon isEqualto "" and {
		_launcher isEqualto ""
	} and {
		_rifle isEqualto ""
	} and {
		_pistol isEqualto ""
	} and {
		_PBINOCULAR isEqualto ""
	}) throw "Ваши руки должны быть свободны! Уберите, тяпку/лопату/оружие/бинокль с инвентаря, в рюкзак или машину...";

	if (_type isEqualto "") throw "Ошибка JobSystem#7, сделайте скриншот ошибки и обратитесь к тех. администрации";
	if (_jobName isEqualTo "") throw "Ошибка JobSystem#8, сделайте скриншот ошибки и обратитесь к тех. администрации";

	if (box_work_port_active) throw "вы уже получили свой груз!";
	/*
		if !([_jobName] call RRPClient_jobs_dresskodCheck) exitWith {
			["WarningTitleAndText", ["Внимание!", "Ваш Дресс-код не соответствует данному виду работы!"]] call SmartClient_gui_toaster_addTemplateToast;
		};
	*/
	_classNameBox = switch (_type) do
	{
		case "handlework": {
			GetText(missionconfigfile >> "SmartJobs" >> "portwork" >> "boxSmall")
		};
		case "autowork": {
			GetText(missionconfigfile >> "SmartJobs" >> "portwork" >> "boxBig")
		};
	};

	boxQuest = "";
	_FinishPos = [3390.07,12871.2,0.00148273];

	switch (_type) do
	{
		case "handlework": {
			box_work_port_active = true;
			port_box = createVehicle [_classNameBox, getPosATL player, [], 0, "NONE"];
			[] spawn RRPClient_jobs_boxPickUp;
			[_FinishPos, _type] spawn RRPClient_jobs_checkFinish;
			[player, [_type], ["Отнесите коробку на склады Pony Express! (желтая метка)", "Принесите коробку на метку", "FinishBoxMarker"], _FinishPos, 1, 2, true] call BIS_fnc_taskCreate;
			boxQuest = _type;
			life_action_inUse = true;
		};
		case "autowork": {
			if (!isNull life_job_car) exitWith {
				["WarningTitleAndText", ["Внимание!", "Для этого типа работы требуется погрузчик! Эта работа требует официального трудоустройства!"]] call SmartClient_gui_toaster_addTemplateToast;
			};
			_nearVehicles = nearestObjects[getPosATL player, ["LandVehicle"], 5];
			if !(_nearVehicles isEqualTo []) exitWith {
				["WarningTitleAndText", ["Внимание!", "точка выдачи груза заблокирована, в радиусе 5 метров не должно быть препятствий"]] call SmartClient_gui_toaster_addTemplateToast;
			};
			box_work_port_active = true;
			port_box = createVehicle [_classNameBox, getPosATL player, [], 0, "NONE"];
			[port_box] call RRPClient_system_clearVehicleAmmo;

			{
				port_box disableCollisionWith _x;
			}forEach allPlayers;

			[player, [_type], ["Отвезите груз на склады Pony Express!", "Доставьте груз!", "FinishBoxMarker1"], _FinishPos, 1, 2, true] call BIS_fnc_taskCreate;
			[_FinishPos, _type] spawn RRPClient_jobs_checkFinish;
			/*code*/
		};
	};
}catch{
	[_exception] call toastError;
};
true