/*

	Filename: 	RRPClient_fed_hackNotebook.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

params [
	["_object", objNull, [objNull]],
	["_pincode", "", [""]]
];
try {
	_office = nearestObject [getPos _object, "Land_Cargo_House_V1_F"];
	if (_office getVariable ["bis_disabled_door_1", 1] isEqualTo 1) throw "Вам необходимо взломать офис";

	if !((_object getVariable ["Hacking", player]) in [player, objNull]) throw "Ноутбук уже кто-то взламывает";
	_object setVariable ["Hacking", player, true];

	private _status = _object getVariable ["Status", selectRandom ["pattern", "cardSwipe", "calibration"]];
	switch _status do {
		case "Hacked": {
			["Ноутбук взломан", format["Пин-код от хранилища - %1", _pincode]] call toastSuccess;
			[75,"взлом ноутбука"] call addXP;
		};
		default {
			private _script = [] spawn (missionNamespace getVariable [format["RRPClient_mg_%1", _status], scriptNull]);
			if (isNull _script) throw "Скрипт пустой";
			waitUntil {scriptDone _script};
			if !(fl_game_won) throw "Взлом не удался";
			
			if (15 > random 100) then {
				_object setVariable ["Status", "Hacked", true];
				["Ноутбук взломан", format["Пин-код от хранилища - %1", _pincode]] call toastSuccess;
			} else {
				["Продолжайте взлом"] call toastInfo;
				_object setVariable ["Status", selectRandom ["pattern", "cardSwipe", "calibration"], true];
			};
			_object setVariable ["Hacking", nil, true];
		};
	};
} catch {
	["Взлом ноутбука", _exception] call toastError;
	_object setVariable ["Hacking", nil, true];
};
true