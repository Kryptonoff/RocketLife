/*

	Filename: 	RRPClient_jobs_spawnVehicleTask.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	private _spawnPoint = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_office_spawn");
	if (_spawnPoint isEqualTo "") throw "Нет точки для спавна техники";
	(_this + " | Spawn vehicle task begin...") call RRPClient_util_log;

	private _spawnPointPos = getMarkerPos _spawnPoint;
	private _timer = time + 180;
	private _taskName = format["%1_SVT_%2",_this,getPlayerUID player];
	private _vehicle = missionNamespace getVariable [format["life_%1_vehicle",_this],objNull];

	[_taskName,player,["Садитесь в машину и покиньте точку выдачи! У вас 3 минуты!","Покинуть офис","walk"],_vehicle,"ASSIGNED",nil,true,false,"",true] call BIS_fnc_setTask;
	[_taskName,[_vehicle,true]] call BIS_fnc_taskSetDestination;

	(_this + " | Spawn vehicle task waiting...") call RRPClient_util_log;

	waitUntil {uiSleep 1; _vehicle distance _spawnPointPos > 30 OR !alive _vehicle OR isNull _vehicle OR time >= _timer};

	switch (true) do {
		case (!alive _vehicle OR time >= _timer) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState; deleteVehicle _vehicle};
		case (isNull _vehicle) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState;};
		case (_vehicle distance _spawnPointPos > 30) : {[_taskName,"SUCCEEDED",true] spawn BIS_fnc_taskSetState};
	};

	uiSleep 1;

	[_taskName] call BIS_fnc_deleteTask;

	(_this + " | Spawn vehicle task done") call RRPClient_util_log;

	if (_this isEqualTo "dlv") then {
		private _spawnPointPos = getMarkerPos "depo_kavala";
		private _timer = time + 900;
		private _task = [["DLV_GOTO"],_spawnPointPos,["Отправляйтесь в депо 'Кавала' и возьмите свой заказ! У вас 15 минут!","Отправляйтесь в депо 'Кавала'","meet"]] call RRPClient_tasks_createTask;

		waitUntil {uiSleep 1; _vehicle distance _spawnPointPos < 15 OR !alive _vehicle OR isNull _vehicle OR time >= _timer};	
		player removeSimpleTask _task;

		if (_vehicle distance _spawnPointPos < 15) then {
			["Работа", "Вы добрались до депо!"] call toastSuccess
		} else {
			["Работа", "Вы не успели добраться до депо!"] call toastError
		};
	};
} catch {
	["Работа", _exception] call toastError;
};
