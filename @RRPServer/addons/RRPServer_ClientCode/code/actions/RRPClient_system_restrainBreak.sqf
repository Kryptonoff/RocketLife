/*
	Filename: 	RRPClient_system_restrainBreak.sqf
	Project: 	Rimas Altis Life RPG
*/
if (life_action_inUse) exitWith {};

private _error = false;
life_action_inUse = true;

//Запуск прогресс бара
disableSerialization;

//звук
if (player getVariable["restrainedCop",false]) then {
	[player,"restrain_break_1"] remoteExec ["RRPClient_system_say3D", 0];
} else {
	[player,"restrain_break_2"] remoteExec ["RRPClient_system_say3D", 0];
};

private _cP = 0.01;

private _handler = objNull;
private _title = ["Попытка снять ленту", "Попытка снять наручники"] select (player getVariable ["restrainedCop", false]);
titleText [_title, "PLAIN"];

for "_i" from 0 to 1 step 0 do {
    sleep 0.15;
    _cP = _cP + 0.01;

    [_cP, "repair"] call RRPClient_system_progressBar;

	if (isNull _handler) then {
		_handler = [] spawn {
			life_to_break_handler = true;
			if ((missionNamespace getVariable ["life_restrain_anim",false]) isEqualTo "am_svyaz_Gestbackward_loop") then {
				player playAction "ag_svyaz_backward_tryToBreak";
			} else {
				player playAction "ag_svyaz_forward_tryToBreak";
			};
			uiSleep 2.5;
			life_to_break_handler = false;
			uiSleep 4;
		};
	};

	if(_cP >= 1) exitWith {};
	if (!alive player OR {(player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"])} OR {life_knockout || {player getVariable ["Escorting",false]} || {player getVariable ["tazed", false]} || {vehicle player != player}}) exitWith {_error = true;};
};
["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (_error) exitWith {["Вашу попытку освободится - прервали!"] call toastError};

private _chance = random(100);

if ((random(100)) < (["restrain_break",10,5,180] call RRPClient_system_getStackChance)) then {
[player,"restrained",false] call CBA_fnc_setVarNet;
	["Вам удалось освободится!"] call toastSuccess;
} else {
	["Вам не удалось освободится, попробуйте еще раз!"] call toastError;
};
