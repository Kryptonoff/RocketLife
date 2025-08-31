/*
    File: fn_insertRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Adds a player to the database upon first joining of the server.
    Recieves information from core\sesison\fn_insertPlayerInfo.sqf
*/
private ["_queryResult","_query","_alias"];
params [
    "_uid",
    "_name",
    ["_returnToSender",objNull,[objNull]]
];

//Error checks
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {diag_log "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if (isNull _returnToSender) exitWith {diag_log "ReturnToSender is Null!";}; //No one to send this to!

_tickTime = diag_tickTime;
//Clense and prepare some information.
_name = [_name] call RRPServer_DB_mresString; //Clense the name of bad chars.

//Prepare the query statement..
format ["insertNewPlayer:%1:%2",_uid,_name] call RRPServer_DB_insertSingle;
[] remoteExecCall ["RRPClient_session_dataQuery",(owner _returnToSender)];
