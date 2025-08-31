private _vehicle = param[0, objNull, [objNull]];

try{
	if!([_vehicle]call RRPClient_system_isVehicleKind) throw "Действие прервано!";
	if (player distance _vehicle > 10) throw "Вы слишком далеко";

	private _vehicleData=_vehicle getVariable["vehicle_info_owners", []];
	if (_vehicleData isEqualTo []) then {
		deleteVehicle _vehicle;
		throw "Ошибочный транспорт";
	};
	if (!alive _vehicle) throw "Техника уничтожена";
	private _vehicleName = getText(configOf _vehicle>>"displayName");
	[0, "%1 ваш %2 конфискуется сотрудником полиции или мчс...", true, [(_vehicleData select 0) select 1, _vehicleName]]remoteExecCall["RRPClient_system_broadcast", -2];
	call RRPClient_actions_inUse;

	private _time=10;
	_time=["saveTimeAction", _time]call RRPClient_system_VIP;
	private _complete = ["Конфискация технки...", {
		(player distance _vehicle < 10) OR {(call RRPClient_system_isInterrupted)}
	}, true, _time, false, true, {}] call RRPClient_system_newProgressBar;

	if (isNil"_complete") throw "Действие прервано!";

	if !(_complete) throw "Действие прервано!";

	if (call RRPClient_system_isInterrupted) throw "Конфискация была отменена.";

	if (player distance _vehicle>10) throw "Конфискация была отменена.";
	if((crew _vehicle) isEqualTo [] or {((typeOf _vehicle) in["B_UAV_02_F", "B_UGV_01_F", "I_UGV_01_F"])}) then
	{
		private _price=switch(true) do{

			case(_vehicle isKindOf"LandVehicle"):{getNumber(missionConfigFile>>"LifeCfgSettings">>"life_impound_car")};
			case(_vehicle isKindOf"Ship"):{getNumber(missionConfigFile>>"LifeCfgSettings">>"life_impound_boat")};
			case(_vehicle isKindOf"Air"):{getNumber(missionConfigFile>>"LifeCfgSettings">>"life_impound_air")};
		};
		life_impound_inuse=true;
		["Confiscate", "", "", "", false, 
			[
				[
					"Steam профиль", 
					[
						"**"+name player+" конфисковал**:", 
						format["**Машину : %1 (%2)**", _vehicleName, typeOf _vehicle], 
						format["**Номера : %1**", (_vehicle getVariable["dbInfo", []])], 
						"**Точная позиция:** "+str(getPosWorld _vehicle) 
					] joinString"\n", "https// steamcommunity.com/profiles/" + getPlayerUID player, 
					"FF3E00", 
					false, 
					"", 
					"", 
					[], 
					[]
				]
			]
		]remoteExecCall["DiscordEmbedBuilder_fnc_buildSqf", 2];
		[_vehicle, true]remoteExec["RRPServer_garage_store", 2];
		waitUntil{
			uiSleep 0.03;
			isNull _vehicle
		};
		_price=if ((count(_vehicle getVariable["dbInfo", []])) > 0) then {
			_price
		} else {
			round(_price/20)
		};
		if ((player call getSide) isEqualTo "cop") then {
			_price = ["priceUp", _price]call RRPClient_system_VIP;
		};
		["InfoTitleAndText", ["Конфискация", format["Вы конфисковали %1 и получили $%2 за очистку улиц!", _vehicleName, _price]]] call toast;
		life_impound_inuse = false;
		[0, "%1 конфисковал %3 принадлежащий %2", true, [player getVariable["realname", ""], (_vehicleData select 0) select 1, _vehicleName]]remoteExecCall["RRPClient_system_broadcast", -2];
		if (player call getSide isEqualTo"cop") then {
			(format["insertSalary:%1:%2", getPlayerUID player, _price]) remoteExecCall["RRPServer_DB_insertSingle", 2];
		} else {
			[[player, "atm", "add", STR(_price), [format["Impound: Plr %2 (%3), ATM ADD (%1)", _price, name player, getPlayerUID player], "OtherMoneyLog"]], "system_moneyChange"]call RRPClient_system_hcExec;
		};
		[50,"конфискацию"] call addXP;
	};
}catch{
	[_exception, "error"] call hints;
	life_impound_inuse=false;
	life_action_inUse = false; 
	life_interrupted = true;
};
