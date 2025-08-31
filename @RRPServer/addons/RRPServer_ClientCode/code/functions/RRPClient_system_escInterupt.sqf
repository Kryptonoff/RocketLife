/*
	Filename: 	RRPClient_system_escInterupt.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _display = _this select 0;
private _ctrlRespawn = _display displayCtrl 1010;
private _ctrlAddons = _display displayCtrl 121;
private _ctrlManual = _display displayCtrl 122;
private _ctrlSave = _display displayCtrl 103;
private _ctrlAbort = _display displayCtrl 104;
private _ctrlTitle = _display displayCtrl 1050;

private _canUseControls = {
	if ((player getVariable ["RRPSide","ERROR"]) in ["cop","med"]) exitWith {true};
	if (GVAR_RESTRAINED(player) OR !(NOTATTACHED(player)) OR GVAR_MNS["life_pvp",false]) then {false} else {true};
};

private _waitTime = diag_tickTime + LIFE_SETTINGS(getNumber,"life_exitTimer");

_ctrlAbort ctrlSetTooltip "Сохранение и выход";
_ctrlAbort ctrlSetEventHandler ["ButtonClick","[] spawn RRPClient_system_logout; (findDisplay 49) closeDisplay 2; true"];

_ctrlRespawn ctrlEnable false;
_ctrlRespawn ctrlSetText "Личный кабинет";
_ctrlRespawn ctrlSetURL "https://lk.rocket-rp.fun/";
_ctrlRespawn ctrlSetEventHandler ["ButtonClick"," (findDisplay 49) closeDisplay 2; true"];

_ctrlRespawn ctrlCommit 0;
_ctrlAbort ctrlEnable false;

_ctrlAbort ctrlEnable false;
_ctrlSave ctrlEnable false;
_ctrlAddons ctrlEnable false;

if (player getVariable ["RRPVariablePartyMeatActive",false] AND !(missionNamespace getVariable ["partMeatRespawn",false])) then {
	_ctrlManual ctrlEnable true;
	_ctrlManual ctrlSetText "Покинуть party meat";
	_ctrlManual ctrlSetEventHandler ["ButtonClick"," (findDisplay 49) closeDisplay 2; call RRPClient_partymeat_endGame; true"];
	_ctrlManual ctrlSetFade 0;
	_ctrlManual ctrlShow true;
	_ctrlManual ctrlCommit 0;
} else {
	_ctrlManual ctrlSetFade 1;
	_ctrlManual ctrlShow false;
	_ctrlManual ctrlCommit 0;
};

if (call _canUseControls) then
{
	while {!isNull _display && diag_tickTime < _waitTime} do
	{
		_ctrlAbort ctrlSetText format["Выход доступен через %1",[(_waitTime - diag_tickTime),"SS.MS"] call BIS_fnc_secondsToString];
		uiSleep 0.01;
		closeDialog 0;
	};

	_ctrlAbort ctrlSetText "Выход";
	_ctrlAbort ctrlCommit 0;
	_ctrlAbort ctrlEnable true;
};
