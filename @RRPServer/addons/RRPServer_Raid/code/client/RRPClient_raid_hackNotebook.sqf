/*

	Filename: 	RRPClient_raid_hackNotebook.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
try {
	params [
		["_object", objNull, [objNull]]
	];

	if !((_object getVariable ["Hacking", player]) in [player, objNull]) throw "Ящик уже кто-то взламывает";
	_object setVariable ["Hacking", player, true];

	private _status = _object getVariable ["Status", selectRandom ["pattern", "cardSwipe", "calibration"]];
	switch _status do {
		case "Hacked": {
			["Ноутбук взломан", format["Пин-код от кабинета - %1", (lab_building getVariable ["pincode", "lol"])]] call toastSuccess;
		};
		default {
			private _script = [] spawn (missionNamespace getVariable [format["RRPClient_mg_%1", _status], scriptNull]);
			if (isNull _script) throw "Скрипт пустой";
			waitUntil {scriptDone _script};
			if !(fl_game_won) throw "Взлом не удался";
			
			if (15 > random 100) then {
				_object setVariable ["Status", "Hacked", true];
				["Ноутбук взломан", format["Пин-код от кабинета - %1", (lab_building getVariable ["pincode", "lol"])]] call toastSuccess;
			} else {
				["Продолжайте взлом"] call toastInfo;
				_object setVariable ["Status", selectRandom ["pattern", "cardSwipe", "calibration"], true];
			};
			_object setVariable ["Hacking", objNull, true];
		};
	};
} catch {
	["Взлом ноутбука", _exception] call toastError;
	_object setVariable ["Hacking", objNull, true];
};