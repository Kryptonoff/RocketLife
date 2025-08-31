/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _dayOfWeek = call RRPClient_util_day2day;
if !(_dayOfWeek in ["Среда", "Суббота"]) exitWith {};
if !((systemTime select 3) in [20, 21, 22, 23]) exitWith {};

missionNamespace setVariable ["RRPPublicRaidStatus", "waiting", true];
private _center = [16070, 17010, 0];
private _domes = nearestObjects [_center, ["Land_Dome_Big_F"], 300, true];
_domes = _domes select {!isObjectHidden _x};

private _offices = ["fed_office_1", "fed_office_2", "fed_office_3"];
private _notebooks = ["fed_notebook_1", "fed_notebook_2", "fed_notebook_3"];
{
	_x setVariable ["bis_disabled_door_1", 1, true];
	_x setVariable ["bis_disabled_door_2", 1, true];
	_x setVariable ["bis_disabled_door_3", 1, true];
	_x allowDamage false;
} forEach _domes;

{
	_officeObj = missionNamespace getVariable [_x, objNull];
	_officeObj setVariable ["bis_disabled_door_1", 1, true];
	[_officeObj, ["Взломaть офис", {[_this select 0] spawn RRPClient_fed_unlockOffice}, nil, 3, true, true, "", "true", 5, false, "Door_1"]] remoteExecCall ["addAction", -2, netId _officeObj];	
}  forEach _offices;

private _pincodes = [nil, nil, nil] apply {str (round (random [1000, 5555, 9999]))};
{
	_notebookObj = missionNamespace getVariable [_x, objNull];
	[_notebookObj, ["Взломать ноутбук", {[_this select 0, _this select 3] spawn RRPClient_fed_hackNotebook}, _pincodes select _forEachIndex, 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId _notebookObj];	
} forEach (_notebooks call BIS_fnc_arrayShuffle);

_domes = _domes call BIS_fnc_arrayShuffle;
_domes params ["_firstDome", "_secondDome", "_thirdDome", "_fourthDome", "_fifthDome", "_sixthDome"];

_firstDome setVariable ["pincode", _pincodes select 0, true];
[_firstDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "keypad", 3, true, true, "", "true", 5, false, "Door_1a"]] remoteExecCall ["addAction", -2, "door_a" + (netId _firstDome)];
[_firstDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "keypad", 3, true, true, "", "true", 5, false, "Door_1b"]] remoteExecCall ["addAction", -2, "door_b" + (netId _firstDome)];

_secondDome setVariable ["pincode", _pincodes select 1, true];
[_secondDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "keypad", 3, true, true, "", "true", 5, false, "Door_1a"]] remoteExecCall ["addAction", -2, "door_a" + (netId _secondDome)];	
[_secondDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "keypad", 3, true, true, "", "true", 5, false, "Door_1b"]] remoteExecCall ["addAction", -2, "door_b" + (netId _secondDome)];	

_thirdDome setVariable ["pincode", _pincodes select 2, true];
[_thirdDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "keypad", 3, true, true, "", "true", 5, false, "Door_1a"]] remoteExecCall ["addAction", -2, "door_a" + (netId _thirdDome)];	
[_thirdDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "keypad", 3, true, true, "", "true", 5, false, "Door_1b"]] remoteExecCall ["addAction", -2, "door_b" + (netId _thirdDome)];	

[_fourthDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "drill", 3, true, true, "", "true", 5, false, "Door_1a"]] remoteExecCall ["addAction", -2, "door_a" + (netId _fourthDome)];	
[_fourthDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "drill", 3, true, true, "", "true", 5, false, "Door_1b"]] remoteExecCall ["addAction", -2, "door_b" + (netId _fourthDome)];	

[_fifthDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "grind", 3, true, true, "", "true", 5, false, "Door_1a"]] remoteExecCall ["addAction", -2, "door_a" + (netId _fifthDome)];	
[_fifthDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "grind", 3, true, true, "", "true", 5, false, "Door_1b"]] remoteExecCall ["addAction", -2, "door_b" + (netId _fifthDome)];

[_sixthDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "grind", 3, true, true, "", "true", 5, false, "Door_1a"]] remoteExecCall ["addAction", -2, "door_a" + (netId _sixthDome)];	
[_sixthDome, ["Взломать хранилище", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockDome}, "grind", 3, true, true, "", "true", 5, false, "Door_1b"]] remoteExecCall ["addAction", -2, "door_b" + (netId _sixthDome)];	

private _armVeh = getText(missionConfigFile >> "CfgFed" >> "armoredVehicleClass");
private _armVehObj = _armVeh createVehicle (getPos _firstDome);
_armVehObj setVariable ["vehicle_info_owners",["qwe", "FED CAR"]];
_armVehObj setVariable ["dbInfo",["qwe","FED CAR"]];
_armVehObj enableSimulationGlobal true;

private _loadVeh = getText(missionConfigFile >> "CfgFed" >> "cargoVehicleClass");
private _loadVehObj = _loadVeh createVehicle (getPos _secondDome);
_loadVehObj setVariable ["vehicle_info_owners",["qwe", "FED CAR"]];
_loadVehObj setVariable ["dbInfo",["qwe","FED CAR"]];
_loadVehObj enableSimulationGlobal true;


private _awardItem = getText(missionConfigFile >> "CfgFed" >> "awardItem");
private _awardItemMass = _awardItem call RRPClient_processing_itemweight;
private _awardAmount = server_bank * getNumber(missionConfigFile >> "CfgFed" >> "awardPercentFromGovBank");
_awardAmount = _awardAmount min getNumber(missionConfigFile >> "CfgFed" >> "maxAward");
private _moneyPerBox = _awardAmount / 4;
private _itemPrice = (_awardItem call RRPClient_economy_getResInfo) select 2;
private _itemsPerBox = round(_moneyPerBox / _itemPrice);

private _boxMiniGames = ["calibration","cardSwipe","pattern"];//lockpick?
{
	_box = "Land_CargoBox_V1_F" createVehicle (getPos _x);
	_box setVariable ["Trunk", [[[_awardItem,_itemsPerBox]], _awardItemMass*_itemsPerBox], true];
	[_box, ["Взломать контейнер", {[_this select 0, _this select 3] spawn RRPClient_fed_unlockBox}, selectRandom _boxMiniGames, 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId _box];
} forEach [_thirdDome, _fourthDome, _fifthDome, _sixthDome];

[{fedGate_1 getVariable ["isBreaking", false]}, {
	_pointId = [16070, 17010, 500, "Ограбление Национального резерва!"] call RRPServer_WarZone_addWarPointServer;
	missionNamespace setVariable ["RRPPublicRaidStatus", "process", true];

	[{
		(({(_x call getSide) in ["civ", "reb"]} count (nearestObjects [[16070, 17010, 0], ["Man"], 250])) isEqualTo 0)
	},
	{
		[_this, "Ограбление Национального резерва!"] call RRPServer_WarZone_removeWarPointServer;
		missionNamespace setVariable ["RRPPublicRaidStatus", "done", true];
	},
	_pointId,
	getNumber(missionConfigFile >> "CfgFed" >> "timeToClose"),
	{
		[_this, "Ограбление Национального резерва!"] call RRPServer_WarZone_removeWarPointServer;
		missionNamespace setVariable ["RRPPublicRaidStatus", "done", true];

		fedgate_1 animate ["barier", 0]; fedgate_1 animate ["Gate", 0]; 
		fedgate_1 animate ["window", 1]; fedgate_1 animate ["door", 1];
		fedgate_2 animate ["barier", 0]; fedgate_2 animate ["Gate", 0]; 
		fedgate_2 animate ["window", 1]; fedgate_2 animate ["door", 1];
	}] call CBA_fnc_waitUntilAndExecute

}] call CBA_fnc_waitUntilAndExecute;

true