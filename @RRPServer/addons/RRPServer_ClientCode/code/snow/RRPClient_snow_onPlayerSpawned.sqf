/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !((getNumber (missionConfigFile >> "LifeCfgSettings" >> "enableSnow")) isEqualTo 1) exitWith {false}; 
SnowClose = "#particlesource" createVehicleLocal [0, 0, 0];    
SnowClose setParticleClass "Snow_Close";    
SnowClose setDropInterval 0;
SnowClose attachTo [vehicle player, [0, 4, 1]];
SnowNear = "#particlesource" createVehicleLocal [0, 0, 0];    
SnowNear setParticleClass "Snow_Near";    
SnowNear setDropInterval 0;
SnowNear attachTo [vehicle player, [0, 4, 1.5]];
SnowFar = "#particlesource" createVehicleLocal [0, 0, 0];  
SnowFar setParticleClass "Snow_Far";  
SnowFar setDropInterval 0;
SnowFar attachTo [vehicle player, [0, 4, 2]];
SnowThreadHandle = [2, RRPClient_snow_threadUpdate, [], true] call RRPClient_system_thread_addtask;