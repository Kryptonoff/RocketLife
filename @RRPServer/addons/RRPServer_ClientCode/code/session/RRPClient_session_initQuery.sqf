/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"

["InitQuery",_this,false] call RRPClient_util_logArray;

params [
	["_houses",[]],
	["_ltd",-1],
	["_keys",[],[[]]],
	["_group",createHashMap]
];


if !(_houses isEqualTo []) then 
{
	[_houses] call RRPClient_system_initHouses;
};
RRPClientLTDsData = _ltd;
_jobCar = getArray (missionConfigFile >> "SmartJobs" >> "allcars" >> "AllJobCar");

if !(_keys isEqualTo []) then {
	{
		[_x] call RRPClient_system_vehInit;
		if ((typeOf _x) in _jobCar) then {life_job_car = _x};
	} forEach _keys;
};

RRPClientGroupInfo = _group;
call RRPClient_groups_setLicense;