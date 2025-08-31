/*

	Filename:	RRPClient_fed_unlockOffice.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com
	
*/
params [
	["_object", objNull, [objNull]]
];

try {
	if !(fedGate_1 getVariable ["isBreaking", false]) throw "Вам необходимо отключить генератор";

	private _neededItem = "extItem_drillAku";
	if !(_neededItem in (magazines player)) throw format["У вас нет необходимого предмета для взлома - %1", _neededItem call RRPClient_inventory_getItemName];

	["Устанавливаем дрель", getNumber(missionConfigFile >> "CfgFed" >> "unlockOfficeSettings" >> "setupDrillTime"), "", "", true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	_drill = "Land_DrillAku_F" createVehicle [0,0,0];
	_drill setPos (_object modelToWorld [0.42,-0.37,0.54]);
	_drill setDir (getdir _object);
	_drill enableSimulation false;


	["Ждем пока дрель выполнит работу...", getNumber(missionConfigFile >> "CfgFed" >> "unlockOfficeSettings" >> "waitDrillTime")] call RRPClient_system_progressBarSimple;
	player removeItem _neededItem;
	deleteVehicle _drill;

	["Взлом офиса", "Дверь открыта!"] call toastSuccess;
	_object setVariable ["bis_disabled_door_1", 0, true];

	[_object] remoteExecCall ["removeAllActions", -2];
	remoteExecCall ["", -2, netId _object];
	[150,"вскрытие офиса"] call addXP;
} catch {
	["Взлом офиса", _exception] call toastError;
}
