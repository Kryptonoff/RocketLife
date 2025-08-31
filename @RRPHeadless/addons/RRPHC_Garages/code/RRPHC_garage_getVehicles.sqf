/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends a request to query the database information and returns vehicles.
*/


private _type = param [0,"",[""]];
try
{
    private _unit = remoteExecutedOwner call RRPHC_util_get_RE_player;
    private _pid = getPlayerUID _unit;
    format ["%1 - %2",remoteExecutedOwner, _unit] call RRPHC_util_debugConsole;
    if (isNull _unit || {_type isEqualTo ""} || {_pid isEqualTo ""}) then 
    {
        if (!isNull _unit) then {
            ["response",[]] remoteExec ["RRPClient_garage_actions",_unit];
        };
        throw "GetVehicles: Error: Check drop";
    };

    private _query = if (_type isEqualTo "Parking") then
    {
        format ["getGarageVehiclesParking:%1",_pid];
    }else{
        format ["getGarageVehicles:%1:%2",_pid,_type];
    };

    private _tickTime = diag_tickTime;
    private _queryResult = _query call RRPHC_DB_selectFull;

    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["getVehicles Result: %1",_queryResult];
    diag_log "------------------------------------------------";

    if (_queryResult isEqualType "") then {
        ["response",[]] remoteExec ["RRPClient_garage_actions",(_unit)];
        throw "GetVehicles: Error: isEqualType: STRING";
    };

    if (_type isEqualTo "Parking") exitWith 
    {
        [_queryResult] remoteExec ["RRPClient_parking_MenuRet",_unit];
        throw "GetVehicles: Parking";
    };

    ["response",_queryResult,_type] remoteExec ["RRPClient_garage_actions",_unit];

}catch{
    _exception call RRPHC_util_debugConsole;
};

true
