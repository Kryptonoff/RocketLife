/*

	Filename:	RRPClient_fed_unlockDome.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com
	
*/

params [
	["_object", objNull, [objNull]],
	["_type", "", [""]]
];

try {
	if !(fedGate_1 getVariable ["isBreaking", false]) throw "Вам необходимо отключить генератор";

	private _neededItem = switch (_type) do { 
		case "bomb" : {"extItem_blastingcharge"};
		case "grind" : {"extItem_grinder"};
		case "drill" : {"extItem_drillAku"};
		default {""};
	};

	if (_neededItem isNotEqualTo "") then {
		if !(_neededItem in (magazines player)) throw format["У вас нет необходимого предмета для взлома - %1", _neededItem call RRPClient_inventory_getItemName];
	};

	switch _type do {
		case "bomb": {
			["Устанавливаем бомбу", getNumber(missionConfigFile >> "CfgFed" >> "unlockDomeSettings" >> "plantBombTime"), "", "", true] call RRPClient_system_progressBarCustom;
			if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
			["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
			if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
			player removeItem _neededItem;

			["Взлом хранилища", format["Бомба установлена, взрыв будет через %1 сек", getNumber(missionConfigFile >> "CfgFed" >> "unlockDomeSettings" >> "waitBombTime")]] call toastWarning;
			["Ждем взрыв...", getNumber(missionConfigFile >> "CfgFed" >> "unlockDomeSettings" >> "waitBombTime")] call RRPClient_system_progressBarSimple;

			"M_PG_AT" createVehicle (_object modelToWorld (_object selectionPosition "door_1a"));
			[150,"взрыв"] call addXP;
		};

		case "drill": {
			["Устанавливаем дрель", getNumber(missionConfigFile >> "CfgFed" >> "unlockDomeSettings" >> "setupDrillTime"), "", "", true] call RRPClient_system_progressBarCustom;
			if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
			["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
			if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

			_drill = "Land_DrillAku_F" createVehicle [0,0,0];
			_drill setPos (_object modelToWorld [23.5,-0.235,-9.5]);
			_drill setDir ((getdir _object) - 90);
			_drill enableSimulation false;


			["Ждем пока дрель выполнит работу...", getNumber(missionConfigFile >> "CfgFed" >> "unlockDomeSettings" >> "waitDrillTime")] call RRPClient_system_progressBarSimple;
			player removeItem _neededItem;
			deleteVehicle _drill;
			[150,"вскрытие двери"] call addXP;
		};

		case "grind": {
			private _script = [] spawn RRPClient_mg_saw;
			waitUntil {scriptDone _script};
			if !(rp_game_won) then {
				if rp_game_lose then {player removeItem _neededItem};
				throw "Взлом не удался";
			};
			["Дверь взломана"] call toastSuccess;
			[150,"вскрытие двери"] call addXP;
		};

		case "keypad": {
			_pincode = 4 call RRPClient_keyPad_openMenu;
			if (_pincode isNotEqualTo (_object getVariable ["pincode", "lol"])) throw "Неверный пин-код";
		};
	};

	_object setVariable ["bis_disabled_door_1", 0, true];
	_object setVariable ["bis_disabled_door_2", 0, true];
	_object setVariable ["bis_disabled_door_3", 0, true];
	["Взлом хранилища", "Двери открыты!"] call toastSuccess;

	[_object] remoteExecCall ["removeAllActions", -2];
	remoteExecCall ["", -2, "door_a" + (netId _object)];
	remoteExecCall ["", -2, "door_b" + (netId _object)];
} catch {
	["Взлом хранилища", _exception] call toastError;
};