/*
    File: fn_wantedAdd.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Adds or appends a unit to the wanted list.
*/
private ["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = param [0,"",[""]];
_type = param [1,"",[""]];

try{
    if (_uid isEqualTo "") throw "UID не определен";
    if (_type isEqualTo "") throw "Инпут не определен";

    if !(isClass(getMissionConfig "LifeCfgCrimes" >> _type)) throw (format ["%1 отсутствует в конфигурации",_type]);

    format ["insertWanted:%1:%2",_uid,_type] call RRPServer_DB_insertSingle;
} catch{
    format ["Error Wanted: %1",_exception] call RRPServer_util_debugConsole;
};

true