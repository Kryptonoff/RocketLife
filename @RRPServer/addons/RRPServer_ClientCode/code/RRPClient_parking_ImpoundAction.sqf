try{
	if (life_impound_inuse) throw "Уже идет процесс конфискации";
	disableSerialization;
	if (isNull (findDisplay 5500)) exitWith {};
	private _vehicle = param [0,ObjNull,[ObjNull]];
	if !(_vehicle isKindOf "LandVehicle") exitWith {};
	if (player distance _vehicle > 10) exitWith {};
	if (!alive _vehicle) throw "Техника уничтожена";

	private _dbInfo = _vehicle getVariable ["dbInfo",[]];
	if (_dbInfo isEqualTo []) throw "Автомобиль арендован";

	private _parkingCost = parseNumber(ctrlText 5502);
	if !([str(_parkingCost)] call RRPClient_system_isnumber) throw "Некорректный ввод. Введите сумму.";
	_maxImpound = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_impound_max");
	if (_parkingCost > _maxImpound) throw format["Максимальная сумма не должна превышать $%1",[_maxImpound] call RRPClient_util_numberText];
	if (_parkingCost < getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_impound_car")) throw format["Минимальная сумма состовляет $%1",[getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_impound_car")] call RRPClient_util_numberText];

	private _parkingMessage = ctrlText 5503;
	if (_parkingMessage isEqualTo "") throw "Не указана причина конфискации на штрафстоянку";

	closeDialog 0;

	private _vehicleName = getText(configOf _vehicle >> "displayName");	

	call RRPClient_actions_inUse;

	private _time=10;
	_time = ["saveTimeAction", _time] call RRPClient_system_VIP;
	_time = ["StreetCleaner", _time] call RRPClient_perks_activatePerk;
	
	private _complete = ["Конфискация технки...", {
		(player distance _vehicle < 10) OR {(call RRPClient_system_isInterrupted)}
	}, true, _time, false, true, {}] call RRPClient_system_newProgressBar;

	life_action_inUse = false;
	if (isNil"_complete") throw "Действие прервано!";
	if !(_complete) throw "Действие прервано!";

	if (call RRPClient_system_isInterrupted) throw "Конфискация была отменена.";

	if (player distance _vehicle > 10) throw "Конфискация была отменена.";

	if ((crew _vehicle isEqualTo []) OR ((typeOf _vehicle) in ["B_UAV_02_F","B_UGV_01_F","I_UGV_01_F"])) then {
		life_impound_inuse = true;
		[
			"Confiscate","","","",false,
			[
				[
					"Steam профиль",
					[
						"**"+name player+" отправил на штрафплощадку**:",
						"**Причина: **"+ _parkingMessage,
						"**Штраф: "+ str _parkingCost +"**",
						format ["**Машину : %1 (%2)**",_vehicleName, typeOf _vehicle],
						format ["**Номера : %1**",((_vehicle getVariable ["dbInfo",[]]) select 1) ],
						"**Точная позиция:** " +  str(getPosWorld _vehicle)					
					] joinString "\n",
					"https://steamcommunity.com/profiles/" + getPlayerUID player,
					"fde910",false,"","",[],[]
				]
			]
		] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];

		[_vehicle,_parkingCost,_parkingMessage,player] remoteExecCall ["RRPServer_garage_vehicleParkingStore",2];
		throw "Отправка информации на сервер. Пожалуйста, подождите...";
	} else {
		throw "Конфискация была отменена.";
	};
}catch{
	["ErrorTitleAndText",["Конфискация",_exception]] call toast;
};