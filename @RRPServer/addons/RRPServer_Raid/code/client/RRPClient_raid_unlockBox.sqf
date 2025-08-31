/*

	Filename:	RRPClient_raid_unlockBox.sqf
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
	if !((_object getVariable ["Unlocking", player]) in [player, objNull]) throw "Ящик уже кто-то взламывает";
	_object setVariable ["Unlocking", player, true];

	switch _type do {
		case "lockpick": {
			private _picked = [4] call RRPClient_lockpick_hud_lockpick;
			if !(_picked) throw "Отмычка сломалась";

			["Ящик взломан"] call toastSuccess;
			[_object] call RRPClient_raid_fillBox;
		};

		case "calibration";
		case "cardSwipe";
		case "pattern": {
			private _script = [] spawn (missionNamespace getVariable [format["RRPClient_mg_%1", _type], scriptNull]);
			if (isNull _script) throw "Скрипт пустой";
			waitUntil {scriptDone _script};
			if !(fl_game_won) throw "Взлом не удался";
			
			["Ящик взломан"] call toastSuccess;
			[_object] call RRPClient_raid_fillBox;
		};
	};

	[_object] remoteExecCall ["removeAllActions", -2];
	[_object, false] remoteExecCall ["lockInventory", -2];
	remoteExecCall ["", -2, netId _object];
	remoteExecCall ["", -2, (netId _object) + "_lock"];
} catch {
	["Взлом ящика", _exception] call toastError;
	_object setVariable ["Unlocking", objNull, true];
};