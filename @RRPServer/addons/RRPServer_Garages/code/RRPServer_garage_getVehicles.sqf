/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends a request to query the database information and returns vehicles.
*/

private _unit = remoteExecutedOwner call RRPServer_util_get_RE_player;
private _type = param [0,"",[""]];
private _pid = getPlayerUID _unit;
if (_pid isEqualTo "" || {_type isEqualTo ""} || {isNull _unit}) exitWith 
{
    if (!isNull _unit) then {
		"GetVehicles: Error: Check drop" call RRPServer_util_log;
        ["response",[]] remoteExec ["RRPClient_garage_actions",(owner _unit)];
    };
};

_unit = owner _unit;
private _query = if (_type isEqualTo "Parking") then
{
	format ["getGarageVehiclesParking:%1",_pid];
}else{
	format ["getGarageVehicles:%1:%2",_pid,_type];
};

private _tickTime = diag_tickTime;
private _queryResult = _query call RRPServer_DB_selectFull;

diag_log "------------- Client Query Request -------------";
diag_log format ["QUERY: %1",_query];
diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format ["getVehicles Result: %1",_queryResult];
diag_log "------------------------------------------------";

if (_queryResult isEqualType "") exitWith {
	"GetVehicles: Error: isEqualType: STRING" call RRPServer_util_log;
    ["response",[]] remoteExec ["RRPClient_garage_actions",(_unit)];
};

if (_type isEqualTo "Parking") exitWith 
{
	"GetVehicles: Parking" call RRPServer_util_log;
	[_queryResult] remoteExec ["RRPClient_parking_MenuRet",_unit];
};

["response",_queryResult,_type] remoteExec ["RRPClient_garage_actions",_unit];
