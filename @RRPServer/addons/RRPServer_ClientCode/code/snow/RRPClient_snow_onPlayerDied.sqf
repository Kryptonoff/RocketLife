/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !((getNumber (missionConfigFile >> "LifeCfgSettings" >> "enableSnow")) isEqualTo 1) exitWith {false}; 
deleteVehicle SnowClose;
deleteVehicle SnowNear;
deleteVehicle SnowFar;
[SnowThreadHandle] call RRPClient_system_thread_removeTask;