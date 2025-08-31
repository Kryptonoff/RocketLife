/*
    File: fn_keyManagement.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Keeps track of an array locally on the server of a players keys.
*/
private ["_uid","_side","_input","_mode","_arr"];
_uid = param [0,"",[""]];
_mode = param [2,0,[0]];
["KeyManage",_this,false] call RRPClient_util_logArray;

if (_uid isEqualTo "") exitWith {}; //BAAAAAAAAADDDDDDDD

switch (_mode) do {
    case 0: {
        _input = param [1,[],[[]]];
        _arr = [];
        {
            if (!isNull _x && {!(_x isKindOf "House")}) then {
                _arr pushBack _x;
            };
        } forEach _input;

        _arr = _arr - [objNull];
        missionNamespace setVariable [format ["%1_KEYS",_uid],_arr];
    };

    case 1: {
        _input = param [1,objNull,[objNull]];
        if (isNull _input || _input isKindOf "House") exitWith {};
        _arr = missionNamespace getVariable [format ["%1_KEYS",_uid],[]];
        _arr pushBack _input;
        _arr = _arr - [objNull];
        missionNamespace setVariable [format ["%1_KEYS",_uid],_arr];
    };

    case 2: {
        _arr = missionNamespace getVariable [format ["%1_KEYS",_uid],[]];
        _arr = _arr - [objNull];
        missionNamespace setVariable [format ["%1_KEYS",_uid],_arr];
    };
};
