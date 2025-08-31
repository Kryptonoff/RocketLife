/*

	Filename:	RRPClient_raid_unlockDoor.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com
	
*/
try {
	params [
		["_door", -1, [-1]],
		["_object", objNull, [objNull]]
	];

	// if (["cop"] call RRPClient_system_playerCount < getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_cop_min_illegal")) throw format ["Должно быть минимум %1 полицейских на острове!.", getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_cop_min_illegal")];

	private _neededItem = switch (_door) do { 
		case 1 : {"extItem_blastingcharge"};
		case 3 : {"keypad"};
		case 5 : {"extItem_grinder"};
		case 7 : {"extItem_grinder"};
		case 9 : {"extItem_drillAku"};
		case 11 : {"extItem_blastingcharge"};
		default {""};
	};

	if !(_neededItem in ["", "keypad"]) then {
		if !(_neededItem in (magazines player)) throw format["У вас нет необходимого предмета для взлома - %1", _neededItem call RRPClient_inventory_getItemName];
	};

	switch _neededItem do {
		case "extItem_blastingcharge": {
			["Устанавливаем бомбу", getNumber(missionConfigFile >> "CfgRaid" >> "unlockDoorSettings" >> "plantBombTime"), "", "", true] call RRPClient_system_progressBarCustom;
			if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
			["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
			if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
			player removeItem _neededItem;

			["Подрыв двери", format["Бомба установлена, взрыв будет через %1 сек", getNumber(missionConfigFile >> "CfgRaid" >> "unlockDoorSettings" >> "waitBombTime")]] call toastWarning;
			["Ждем взрыв...", getNumber(missionConfigFile >> "CfgRaid" >> "unlockDoorSettings" >> "waitBombTime")] call RRPClient_system_progressBarSimple;


			"M_PG_AT" createVehicle (_object modelToWorld (_object selectionPosition format["door_%1", _door]));
			_object setVariable [format ["bis_disabled_door_%1", _door], 0, true];
			_object animate [format["door_%1_rot", _door], 1, 15];
			_object animate [format["door_%1_rot", _door + 1], 1, 15];
			["Подрыв двери", "Двери открыты!"] call toastSuccess;
		};

		case "extItem_drillAku": {
			["Устанавливаем дрель", getNumber(missionConfigFile >> "CfgRaid" >> "unlockDoorSettings" >> "setupDrillTime"), "", "", true] call RRPClient_system_progressBarCustom;
			if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
			["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
			if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

			_drill = "Land_DrillAku_F" createVehicle [0,0,0];
			_drill setPos (_object modelToWorld [-1.02246,-1.60986,-3.40291]);
			_drill setDir (getdir _object);
			_drill enableSimulation false;


			["Ждем пока дрель выполнит работу...", getNumber(missionConfigFile >> "CfgRaid" >> "unlockDoorSettings" >> "waitDrillTime")] call RRPClient_system_progressBarSimple;
			player removeItem _neededItem;
			deleteVehicle _drill;

			["Взлом двери", "Дверь открыта!"] call toastSuccess;
			_object setVariable [format ["bis_disabled_door_%1", _door], 0, true];
		};

		case "extItem_grinder": {
			[0, "Неизвестные проникли в здание лаборатории, предотвратите ограбление!"] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];

			private _script = [] spawn RRPClient_mg_saw;
			waitUntil {scriptDone _script};
			if !(rp_game_won) then {
				if rp_game_lose then {player removeItem _neededItem};
				throw "Взлом не удался";
			};
			
			["Дверь взломана"] call toastSuccess;

			_object setVariable [format ["bis_disabled_door_%1", _door], 0, true];
			["Взлом двери", "Двери открыты!"] call toastSuccess;
		};

		case "keypad": {
			_pincode = 4 call RRPClient_keyPad_openMenu;
			if (_pincode isNotEqualTo (lab_building getVariable ["pincode", "lol"])) throw "Неверный пин-код";

			_object setVariable [format ["bis_disabled_door_%1", _door], 0, true];
			["Взлом двери", "Двери открыты!"] call toastSuccess;
		}
	};
} catch {
	["Взлом двери", _exception] call toastError;
}
