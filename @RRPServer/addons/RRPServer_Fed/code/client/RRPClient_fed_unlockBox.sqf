/*

	Filename:	RRPClient_fed_unlockBox.sqf
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
	_dome = nearestObject [getPos _object, "Land_Dome_Big_F"];
	if (_dome getVariable ["bis_disabled_door_1", 1] isEqualTo 1) throw "Вам необходимо взломать здание хранилища";

	if !((_object getVariable ["Unlocking", player]) in [player, objNull]) throw "Ящик уже кто-то взламывает";
	_object setVariable ["Unlocking", player, true];

	switch _type do {
		case "lockpick": {
			private _picked = [4] call RRPClient_lockpick_hud_lockpick;
			if !(_picked) throw "Отмычка сломалась";

			["Ящик взломан"] call toastSuccess;
		};

		case "calibration";
		case "cardSwipe";
		case "pattern": {
			private _script = [] spawn (missionNamespace getVariable [format["RRPClient_mg_%1", _type], scriptNull]);
			if (isNull _script) throw "Скрипт пустой";
			waitUntil {scriptDone _script};
			if !(fl_game_won) throw "Взлом не удался";
			
		};
	};

	[_object] remoteExecCall ["removeAllActions", -2];
	remoteExecCall ["", -2, netId _object];
	
	[_object, ["Открыть хранилище", {[_this select 0] spawn RRPClient_inventory_open}, nil, 3, true, true, "", "(player call getside) isNotEqualTo 'cop'", 5]] remoteExecCall ["addAction", -2, "open_" + (netId _object)];
	_object setVariable ["Unlocked", true, true];
	["Взлом контейнера", "Контейнер взломан"] call toastSuccess;
	[150,"взлом контейнера"] call addXP;

} catch {
	["Взлом контейнера", _exception] call toastError;
	_object setVariable ["Unlocking", objNull, true];
};