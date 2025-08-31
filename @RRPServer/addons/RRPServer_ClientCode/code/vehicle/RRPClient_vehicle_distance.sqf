/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

RRPClient_temp_curVeh = objectParent player;
if (isNull RRPClient_temp_curVeh) exitWith {};
if !(RRPClient_temp_curVeh isKindOf "car") exitWith {};

RRPClient_vehicle_AllDistance = (RRPClient_temp_curVeh getVariable ["allDistance",0]);
RRPClient_temp_oldDist = RRPClient_vehicle_AllDistance;
RRPClient_temp_startDist = 0;
RRPClient_temp_curPos = getPosWorld player;
if (isNull RRPClient_temp_curVeh) exitWith {systemChat "vehicle null"};
if !((vehicle player isEqualTo RRPClient_temp_curVeh) && {driver RRPClient_temp_curVeh isEqualTo player} && {alive RRPClient_temp_curVeh}) exitWith {};
if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) exitWith {systemChat "vehicle 3"};

RRPClientDRAW3DVehStat = addMissionEventHandler ["Draw3D",{
	
	private _distanceLocal = (RRPClient_temp_curPos distance2D (getPosWorld player));
	if (_distanceLocal > 2) then 
	{
		RRPClient_temp_startDist = RRPClient_temp_startDist + _distanceLocal; 
		RRPClient_vehicle_AllDistance = RRPClient_temp_oldDist + (parseNumber ((RRPClient_temp_startDist / 500) toFixed 2));
	};
	if (RRPClient_vehicle_AllDistance > 10000 and {((RRPClient_temp_curVeh getVariable ["dbInfo",[]]) select 0) isEqualTo (getPlayerUID player)}) then 
	{
		["love_car",1] call RRPClient_ach_gateway; 
	};
	RRPClient_temp_curPos = getPosWorld player;
	/*
	if (isEngineOn RRPClient_temp_curVeh) then 
	{
		comment "Пока в раздумиях";
	};
	if (isOnRoad ASLToAGL getPosASL RRPClient_temp_curVeh) then 
	{
		comment "Пока в раздумиях";
	};
	*/
	if (!(isNull RRPClient_temp_curVeh) && {alive RRPClient_temp_curVeh}) then {}else{removeMissionEventHandler ["Draw3D",RRPClientDRAW3DVehStat];RRPClient_temp_curVeh = objNull;};
}];