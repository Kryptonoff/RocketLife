try {
	private _veh = cursorObject;
	if (isNull _veh) exitWith {};
	private _parts = [];
	private _hitpoints = [];
	private _hitpointsText = [];
	private _partsText = "";
	private _critical = 0;
	if (typeOf _veh in ["RRPVehicle_sheriff_strider"]) throw "Эта техника не ремонтируется";
	private _sleep = if (player call getSide in ["cop", "med"] or (getPlayerUID player in (getArray(missionConfigFile >> "ptw" >> "repairExlusive"))) or license_taxi or ("repairKit" in secretShop)) then {
		0.1
	} else {
		0.25
	};
	if ([_veh] call RRPClient_system_isVehicleKind && ("extItem_ItemRepairKit" in (items player))) then {
		switch (true) do
		{
			case (_veh isKindOf "Air"):
			{
				_hitpoints = ["HitEngine", "HitHRotor", "HitFuel", "HitHull", "HitVRotor", "HitTransmission"];
				_hitpointsText = ["Двигатель", "Ротор", "Бак", "Корпус", "Задний ротор", "Трансмиссия"];
				_critical = 3;
			};
			case (_veh isKindOf "LandVehicle"):
			{
				if ((typeof _veh) in ["I_Truck_02_transport_F", "I_Truck_02_covered_F", "I_Truck_02_covered_CIV_F", "O_Truck_02_fuel_F", "B_Truck_01_mover_F", "B_Truck_01_transport_F", "B_Truck_01_covered_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_fuel_F", "B_Truck_01_box_F", "B_Truck_01_box_CIV_F", "B_Truck_01_fuel_F", "B_Truck_01_fuel_CIV_F", "O_Truck_03_device_F"]) then {
					_hitpoints = ["HitLFWheel", "HitLF2Wheel", "HitRF2Wheel", "HitLBWheel", "HitRFWheel", "HitRBWheel", "HitLMWheel", "HitRMWheel", "HitFuel", "HitEngine", "HitBody"];
					_hitpointsText = ["Левое переднее колесо", "Левое второе переднее колесо", "Правое второе переднее колесо", "Левое заднее колесо", "Правое переднее колесо", "Правое заднее колесо", "Левое второе заднее колесо", "Правое второе заднее колесо", "Бак", "Двигатель", "Корпус"];
					_critical = 4;
				} else {
					_hitpoints = ["HitLFWheel", "HitLF2Wheel", "HitRFWheel", "HitRF2Wheel", "HitFuel", "HitEngine", "HitBody"];
					_hitpointsText = ["Левое переднее колесо", "Левое заднее колесо", "Правое переднее колесо", "Правое заднее колесо", "Бак", "Двигатель", "Корпус"];
					_critical = 3;
				};
			};
			case (_veh isKindOf "Ship"):
			{
				_hitpoints = ["HitEngine", "HitBody"];
				_hitpointsText = ["Двигатель", "Корпус"];
				_critical = 2;
			};
		};
		if (_hitpoints isEqualTo []) exitWith {
			["Не удалось определить тип техники"] call hints
		};

		{
			if (_veh getHitPointDamage _x > 0.65) then {
				_parts pushBack (_hitpointsText select _forEachIndex);
				_partsText = _partsText + format["- %1<br />", _hitpointsText select _forEachIndex];
			};
		} forEach _hitpoints;
		private _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		if (!("repairKit" in secretShop) AND !(getPlayerUID player in (getArray(missionConfigFile >> "ptw" >> "repairExlusive"))) AND !license_taxi AND (player call getSide in ["civ", "reb"]) and {
			(["med"] call RRPClient_system_playerCount) > getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_med_min")
		} and {
			(count _parts) >= _critical
		} and {
			"Двигатель" in _parts
		}) exitWith
		{
			[format["<t size='1.3' color='#ff0000' align='center'>"+ "Повреждения" +"<br/>%1</t><br /><br /><t align='left'>%2</t><br /><t align='left'>"+ "Вы не сможете самостоятельно выполнить ремонт такой сложности. Вызовите сотрудника МЧС или Полиции" +"</t>", _displayName, _partsText]] call hints;
		};
		if !(_parts isEqualTo []) then {
			_sleep = _sleep * (count _parts)
		};
		[format["<t size='1.3' color='#ff0000' align='center'>"+ "Повреждения" +"<br/>%1</t><br /><br /><t align='left'>%2</t>", _displayName, _partsText]] call hints;
		call RRPClient_actions_inUse;

		_sleep = ["GeneralMechanic", _sleep] call RRPClient_perks_activatePerk;
		
		disableSerialization;
		private _time = _sleep * 100;
		
		private _complete = ["Ремонтирую...", {
			((player distance _veh < 10) &&
			{isNull (objectParent player)} && 
			{alive _veh} && 
			{("extItem_ItemRepairKit" in (items player))}) ||
			{(call RRPClient_system_isInterrupted)}
		}, true, _time, false, true, {
			call RRPClient_animation_kneelWork;
		}] call RRPClient_system_newProgressBar;

		if (isNil"_complete") throw "Действие прервано!";
		if !(_complete) throw "Действие прервано!";

		life_action_inUse = false;
		if (call RRPClient_system_isInterrupted) throw "Действие отменено";
		if (life_interrupted) throw "Действие отменено";
		if !(isNull objectParent player) throw "Для починки автомобиля вы должны выйти из него.";
		if !(player call getSide in ["cop", "med"] or (getPlayerUID player in (getArray(missionConfigFile >> "ptw" >> "repairExlusive"))) or license_taxi or ("repairKit" in secretShop)) then {
			player removeItem "extItem_ItemRepairKit"
		};
		_veh setDamage 0;
		["SuccessTitleAndText",["Ремонт","Вы отремонтировали автомобиль."]] call toast;
		["goldHand", 1] call RRPClient_ach_gateway;
	};
}catch{
	["ErrorTitleAndText",["Ремонт",_exception]] call toast;
	life_impound_inuse=false;
	life_action_inUse = false; 
	life_interrupted = true;
};
