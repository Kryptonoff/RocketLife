/*
    File: fn_wantedRemove.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Removes a person from the wanted list.
*/
private ["_uid","_query"];
_uid = param [0,"",[""]];
if (_uid isEqualTo "") exitWith {}; //Bad data

format ["WantedRemove:%1",_uid] call RRPServer_DB_fireAndForget;
