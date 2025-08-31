/*
    File: fn_wantedPerson.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Fetches a specific person from the wanted array.
*/

private ["_unit","_index","_queryResult","_result"];
_unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {[]};
_uid = getPlayerUID _unit;

_queryResult = format ["wantedPerson:%1",_uid] call RRPServer_DB_selectFull;
if (count _queryResult isEqualTo 0) exitWith {[]};
_queryResult
