/*
    Description:
    When a client disconnects this will remove their corpse and
    clean up their storage boxes in their house. Also, saves _unit infos & position.
*/

private ["_unit","_id","_uid","_name","_position","_side","_alive"];
params
[
	["_unit",objNull,[objNull]],
	"_id",
	["_uid","",[""]],
	["_name","",[""]]
];
_position = getPosATL _unit;
if ((_unit getVariable ["sessionCompleted",false]) && {!(_unit getVariable ["inJail",false])}) then
{
	format ["Saved on diconnect %2 (%1)",_uid,_name] call RRPServer_util_debugConsole;
	[_unit,_uid] call RRPServer_playerSaveQueue_playerUpdate;
};
_animal = missionNamespace getVariable [format ["Animal%1", _uid], objNull];
if !(isNull _animal) then
{
	deleteVehicle _animal;
	missionNamespace setVariable [format ["Animal%1", _uid], nil];
};

private _keyArr = missionNamespace getVariable [(_player_uid + "_KEYS"),[]];
{
	if !(_x getVariable ["vehicle_limits",""] isEqualTo "") then {
		_x setOwner 2;
		if (local _x) then {
			[_x,2] call RRPClient_system_lockvehicle;
			_x setVelocity [0,0,0];
		} else {
			[_x,2] remoteExecCall ["RRPClient_system_lockvehicle",_x];
			[0,0,0] remoteExecCall ["setVelocity",_x];
		};
		[{speed _this < 1}, {_veh_crew = crew _this; if !(_veh_crew isEqualTo []) then {[] remoteExecCall ["RRPClient_system_pullOutVeh",_veh_crew]}}, _x] call CBA_fnc_waitUntilAndExecute;	
	};
} forEach _keyArr;

if (isPlayer _unit) then
{
	[_unit] call mav_taxi_fnc_serverDequeueRequest;
	[_unit] call mav_taxi_fnc_serverUnitDied;
};

if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	if (
		(_unit getVariable ["lifeState",""] == "RESPAWN") OR
		{(_unit getVariable ["lifeState",""] == "INCAPACITATED")} OR
		{(_unit getVariable ["lifeState",""] == "DEAD")} OR
		{(_unit getVariable ["restrained",false])}
	) then {
		if !(server_restartSoon) then
		{
			[_uid,120,"Релог в агонии/наручниках/смерти"] call RRPServer_DB_addBan;
			format ["insertBansBackUP:%1:%2:%3","relog",120,_uid] call RRPServer_DB_fireAndForget;
		};
	};
	if (_unit getVariable ["IsPlayingRussianRoulette", false]) then
	{
		_unit call RRPServer_russianRoulette_event_onPlayerDisconnected;
	};

	if (((missionNamespace getVariable ["AnomalyBlowout",0]) > 0) AND (_unit inArea "stratis_zone") AND ([_unit, "anti_vibros_zone_1"] call CBA_fnc_getDistance > 200)) then {
		_uid call RRPServer_session_deletePlayerData;
		[_uid,30,"Релог во время выброса, а так же удаления снаряжения"] call RRPServer_DB_addBan;
		format ["insertBansBackUP:%1:%2:%3","relog blowout",30,_uid] call RRPServer_DB_fireAndForget;
	};

	_nick = _unit call getNickName;
	[0,format["%1 отключился",_nick]] remoteExecCall ["RRPClient_system_broadcast",-2];

	_sessionID = _unit getVariable ["SessionID", ""];
	_sessionID call RRPServer_session_end;
	_unit setVariable ["SessionID", nil];
	deleteVehicle _unit;

	format ["clientDisconnect:%1", _uid] call RRPServer_DB_fireAndForget;
};
