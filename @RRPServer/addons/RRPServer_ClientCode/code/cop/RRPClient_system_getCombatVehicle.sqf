/*
	Filename: 	RRPClient_system_getCombatVehicle.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	if (EQUAL((lbCurSel 5902),-1)) exitWith {};
	private _cfgClass = CONTROL_DATA(5902);

	if (!isClass (missionConfigFile >> "LifeCfgBattleVehicles" >> _cfgClass)) exitWith {};

	private _conditions = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"conditions");
	if !([_conditions] call RRPClient_util_conditionsCheck) throw format ["%1",M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"conditionsMessage")];

	private _className = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"vehicleClass");
	private _vehicleInfo = [_className] call RRPClient_util_fetchVehInfo;
	private _action = [
		format["Вы действительно хотите достать %1?",_vehicleInfo select 3],
		"Боевая техника",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;
	if (!isNil "_action" && {!_action}) exitWith {};

	private _nearVehicles = nearestObjects[getMarkerPos life_combatVehMarker,["LandVehicle","Air","Ship"],10];
	if (count _nearVehicles > 0) throw "Место занято!";

	private _maximum = M_CONFIG(getNumber,"LifeCfgBattleVehicles",_cfgClass,"maximum");
	[player,_cfgClass,life_combatVehMarker,_maximum] remoteExec ["RRPServer_system_combatVehicleReq",RSERV];
	closeDialog 0;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};