/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/
try {
	if (license_slavery) throw "Для того что бы заниматься работорговлей, вам нужно приобрести лицензию работорговца!";
	if (RRPClientWaitingSlaveResponse) throw "Вы уже заняты!";
	if (life_action_inUse) throw "Вы заняты каким то действием!";
	if (player call getSide in ["cop","med"]) throw "Ваша фракция не позволяет Вам совершить это!";
	if (!server_slavery AND (["cop"] call RRPClient_system_playerCount < getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_cop_min_illegal"))) throw (format["Должно быть минимум %1 полицейских на острове, чтобы продолжить.",getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_cop_min_illegal")]);

	RRPClientWaitingSlaveResponse = true;

	private ["_units","_unit"];
	 _units = nearestObjects[getMarkerPos "slavery_market",["Man"],10];
	 _unit = objNull;
	if (count _units > 0) then {
		{
			if (
				_x getVariable ["restrained",false] AND
				(_x call getSide in ["civ","reb"]) AND
				(isPlayer _x) AND
				(_x getVariable ["lifeState",""] isEqualTo "HEALTHY")
			) exitWith {_unit = _x};
		} foreach _units;
	};

	if (isNull _unit OR isNil "_unit") throw "Кого ты мне привел? Тут никого нет!";
	if (!isPlayer _unit) throw "Он ведь не живой, убирайтесь отсюда!";
	if !(_unit getVariable ["restrained",false]) throw "Свяжи его!";
	if (player isEqualTo _unit) throw "Я не буду покупать тебя у тебя же!";

	if (
		(_unit getVariable ["lifeState",""] == "RESPAWN") OR
		(_unit getVariable ["lifeState",""] == "INCAPACITATED") OR
		(_unit getVariable ["lifeState",""] == "DEAD")
	) throw "Ваш пленник не в порядке, а мне нужны крепкие парни";

	if (_unit call getSide isEqualTo "med") throw "Продавать медика? Ты совсем конченный? Пошел вон отсюда!";
	private _check = false;

	if (!server_slavery) then {
		{
			if (player distance _x < 200 && ((_x call getSide) isEqualTo "cop")) exitWith {_check = true;};
		} forEach playableUnits;
	};

	if (_check) throw "Дружище, у тебя копы на хвосте! Избавься от них!";

	if !(server_slavery) then {
		[getPlayerUID player,"236"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	};

	call RRPClient_actions_inUse;
	["InfoTitleAndText", ["Ошибка!", "Продаем раба..."]] call SmartClient_gui_toaster_addTemplateToast;

	private _rate = switch (_unit call getSide) do {
	   	case "civ": {50000};
		case "cop": {150000};
	};

	[player,_rate] remoteExecCall ["RRPClient_system_sellSlaveAction",_unit];
} catch {
	life_action_inUse = false;
	RRPClientWaitingSlaveResponse = false;
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
