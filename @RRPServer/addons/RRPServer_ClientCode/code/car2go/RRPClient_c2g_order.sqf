

try{
	if !(license_driver) throw "У вас нет водительских прав";
	if (life_is_arrested) throw "Вы в тюрьме";
	if (life_cs_renting) throw "Вы уже арендуете автомобиль";
	if (time - life_cs_timer < 300) throw "Вы недавно арендовывали автомобиль, подождите";
	life_cs_timer = time;

	if (life_cs_selected isEqualTo -1) throw "Вы не выбрали автомобиль";
	private _positions_array = profileNamespace getVariable ["cs_cars",[]];
	private _selected_vehicle = _positions_array select life_cs_selected;

	private _vehicle = createVehicle [_selected_vehicle select 1, _selected_vehicle select 0, [], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	player reveal _vehicle;

	private _nearRoads = _vehicle nearRoads 15; 
	if (count _nearRoads > 0) then 
	{ 
		_road = _nearRoads select 0; 
		_roadConnectedTo = roadsConnectedTo _road; 
		_connectedRoad = _roadConnectedTo select 0; 
		_v_dir = _road getDir _connectedRoad; 
		_vehicle setDir _v_dir;
	};

	life_vehicles pushBack _vehicle;
	[[getPlayerUID player,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;

	_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,player call getNickName]],true];
	[_vehicle,"vehicle_limits","carsharing"] call CBA_fnc_setVarNet;
	[_vehicle,"dbInfo",[getPlayerUID player, format["BN %1",call RRPClientPlayerID]]] call CBA_fnc_setVarNet;

	[_vehicle] call RRPClient_system_vehSetupRadio;
	[_vehicle] call RRPClient_system_clearVehicleAmmo;
	[_vehicle] call RRPClient_system_clearVehicleSensors;
	[_vehicle] remoteExec ["RRPClient_system_vehicleActions",-2,_vehicle];
	_basePrice = getNumber(getMissionConfig "CfgCar2Go" >> "price") * 10;
	[player,"atm","take",_basePrice] remoteExecCall ["RRPServer_system_moneyChange",2];

	["Car2Go",
		format["Вы взяли в аренду %1 за $%2",getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName"),[_basePrice] call RRPClient_util_numberText]
		] call toastSuccess;

	[_vehicle] spawn RRPClient_system_vehicleAnimate;

	_vehicle lock 2;
	_vehicle disableTIEquipment true;
	_vehicle enableRopeAttach false;
	_vehicle allowDamage true;

	life_cs_start = time;
	life_cs_vehicle = _vehicle;
	life_cs_renting = true;

	private _positions_array = profileNamespace getVariable ["cs_cars",[]];
	profileNamespace setVariable ["cs_cars",_positions_array - [life_cs_selected]];

	[] call RRPClient_c2g_startTimer;

	private _taskName = format["BUS_TSPW_%1",getPlayerUID player];
	[_taskName,player,["Садитесь в машину, пока вы не в машине, с вас будет сниматься лишь половина стоимости","Сесть в машину","walk"],life_cs_vehicle,"ASSIGNED",nil,true,false,"",true] call BIS_fnc_setTask;

	"Carsharing - Spawn Car Task waiting..." call RRPClient_system_log;
	
	closeDialog 0;

	waitUntil {uiSleep 1; (objectParent player isEqualTo life_cs_vehicle) OR !alive life_cs_vehicle OR isNull life_cs_vehicle};

	switch (true) do {
		case (!alive life_cs_vehicle or isNull life_cs_vehicle) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState};
		case (objectParent player isEqualTo life_cs_vehicle) : {[_taskName,"SUCCEEDED",true] spawn BIS_fnc_taskSetState};
	};

	uiSleep 1;

	[_taskName] call BIS_fnc_deleteTask;

}catch{
	[_exception,"ОК"] call RRPClient_tablet_showWarning;
};
true

