/*
	Project: Rimas Role Play
	Author: ???
	License: CC BY-ND
*/

params ["_unit", "_role", "_vehicle", "_turret"];
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then {
	if !(dynamicSimulationEnabled _vehicle) then {
		_vehicle enableDynamicSimulation true;
	};
} else {
	if !(simulationEnabled _vehicle) then {
		_vehicle enableSimulationGlobal true;
	};
};

_hasBomb = _vehicle getVariable ['CarBomb', []];
if (_role isEqualTo "driver") then 
{
	if (_hasBomb isNotEqualTo []) then
	{
		if !(_hasBomb isEqualTo [3]) then
		{
			BombIsActivated = false;
			CarBambVehicle = vehicle player;
			"Ад на колесах!" hintC [
				"Как только вы разгонетесь до 60 км/ч включится таймер который будет отсчитывать время, которое нужно продержаться",
				"При снижении скорости автомобиль взорветься, а вы можете погибнуть!",
				"Двигайтесь только по дорогам! При съезде с дороги таймер остановится!",
				"По истечению времени, вы получите именно этот автомобиль в тайник, откуда сможете его забрать в гараж",
				"Ни в коем случае не заезжайте в зеленую/синюю зону, ведь там действует ограничение скорости в 50 км/ч",
				"Продумайте свой маршрут заранее!",
				"Удачи!"
			];
			BombMonitoringThreadID = [0.1, RRPClient_CarBomb_BombMonitorThread, [], true] call RRPClient_system_thread_addtask;
		};
	};
};

private ["_mod","_log"];
_mod = ["","LOCKED"] select ((locked _vehicle isEqualTo 2) AND !((_vehicle getVariable ["dbInfo",["-1","rent"]] select 0) isEqualTo (getPlayerUID _unit)));

_log = format ["%1 (%2) сел в %7 %3 (%4) POS:%5 локация: %6",name _unit,getPlayerUID _unit,typeOf _vehicle,(_vehicle getVariable ["dbInfo",["-1","rent"]] select 1),mapGridPosition _vehicle,[getPosWorld _vehicle] call mav_taxi_fnc_nearestLocation,_mod];
[_log,"GetInVehLogs"] remoteExecCall ["RRPServer_system_logIt",2];

if (_mod isEqualTo "LOCKED") then {
	[
		"Залез в закрытую машину!",
		"GetInLockVeh",
		"F7FE2E",
		_log
	] remoteExecCall ["RRPServer_discord_sendMessage",2];
};
