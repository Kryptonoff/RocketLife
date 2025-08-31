
try{
	
	private _price = 500;
	private _action = [format ["Для сдачи экзамена вам необходимо заплатить $%1. Деньги будут списаны с вашего банковского счета",[_price] call RRPClient_util_numberText],"Сдача на права",localize "STR_Global_Yes",localize "STR_Global_No"] call BIS_fnc_guiMessage;
	if !(_action) exitWith {};
	if (_price > BANK) throw "Недостаточно денег";
	
	private _object_pos = player;
	life_exam_points = [[3477.33,13107.1,-0.000420094],[3509.39,13142.6,-0.000213146],[3583.18,12909.5,-0.0349903],[3651.47,12799,0.00570774],[3607.96,12985.8,0.0202918],[3612.69,13023.5,-0.00139713],[3653.9,13265.8,-0.00366306],[3661.35,12796.8,0.00826836],[3684.85,12809,-0.00318718],[3664.73,12916.2,0.00453758],[3715.58,12959.1,-0.0447969],[3714.56,12999.4,-0.000418186]];

	private _spawnPointPos = life_exam_points select 0;
	if !(nearestObjects[_spawnPointPos,["LandVehicle","Ship","Air"],5] isEqualTo []) throw "Точка выдачи занята!";
	life_exam_points deleteAt 0;

	private _exam_car = createVehicle ["d3s_kuruma_kasatky",_spawnPointPos,[],0,"NONE"];
	waitUntil {!isNil "_exam_car" && {!isNull _exam_car}};
	player reveal _exam_car;
	[_exam_car] call RRPClient_system_clearVehicleAmmo;
	_exam_car setDir (_spawnPointPos getDir (life_exam_points select 0));
	_exam_car disableTIEquipment true;
	_exam_car enableRopeAttach false;
	life_vehicles pushBack _exam_car;
	player moveindriver _exam_car;
	[player, "atm", "take", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
	
	life_exam_task = [
		["EXAM_CAR"],
		(life_exam_points select 0),
		[
			"Экзамен по вождению начался! Не съезжайте с дорожного покрытия и соблюдайте скоростной режим в 60 км\ч, иначе экзамен будет не сдан.",
			"Экзамен по вождению",
			"car"
		]
	] call RRPClient_tasks_createTask;

	
	disableSerialization;
	private _timer = ["exam_driver"] call RRPClient_gui_util_createTimer;
	private _exam_time = 180;
	_exam_car addEventHandler ["EpeContactStart", "life_exam_hit = true"];
	[{_this remoteExecCall ["RRPClient_evh_handleVehicle",2]}, [_exam_car,player,_exam_time], 3] call CBA_fnc_waitAndExecute;

	[{
		(_this#0) params ["_timer","_exam_time","_object_pos","_exam_car"];
		_timer ctrlSetText format ["Оставшееся время: %1",[_exam_time - time,"MM:SS"] call BIS_fnc_secondsToString];

		if (life_exam_points#0 distance player < 10) then {
			life_exam_points deleteAt 0;
			life_exam_task setSimpleTaskDestination (life_exam_points select 0);
		};
		private _exam_fail = switch (true) do { 
			case (isNull _exam_car) : {"вы вышли из машины"}; 
			case !(isOnRoad _exam_car) : {"вы сошли с дороги"}; 
			case ((speed _exam_car) > 60) : {"вы превысили скорость"}; 
			case (_exam_time < time) : {"время истекло"}; 
			case life_exam_hit : {"произошло ДТП"}; 
			default {""}; 
		};
		if !(_exam_fail isEqualTo "") exitWith {
			[_this#1] call CBA_fnc_removePerFrameHandler;
			["Автошкола","Вы провалили экзамен: " + _exam_fail] call toastError;

			_exam_car setVelocity[0, 0, 0];
			player action["Eject", _exam_car];
			titleText ["","BLACK IN"];
			player setPos _object_pos;
			player removeSimpleTask life_exam_task;
			deletevehicle _exam_car;
			life_exam_hit = false;
			["exam_driver"] call RRPClient_gui_DestroyRscLayer;
		};

		if (life_exam_points isEqualTo []) exitWith {
			[_this#1] call CBA_fnc_removePerFrameHandler;
			["Автошкола", "Вы сдали экзамен"] call toastSuccess;
			life_exam_task setTaskState "SUCCEEDED"; 
			life_licenses pushBackUnique "driver";
			comment "TODO: Add license";

			_exam_car setVelocity[0, 0, 0];
			player action["Eject", _exam_car];
			titleText ["","BLACK IN"];
			player setPos _object_pos;
			player removeSimpleTask life_exam_task;
			deletevehicle _exam_car;
			life_exam_hit = false;
			["exam_driver"] call RRPClient_gui_DestroyRscLayer;
		};
	}, 0.25, [_timer,_exam_time + time,_object_pos,_exam_car]] call CBA_fnc_addPerFrameHandler;
}catch{
	["Автошкола", _exception] call toastError;
};



