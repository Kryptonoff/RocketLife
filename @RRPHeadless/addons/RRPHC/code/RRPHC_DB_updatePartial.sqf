/*
	Project: Headless Client for Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/
private["_uid", "_side", "_value", "_value1", "_value2", "_mode", "_query"];
_uid = param [0, "", [""]];
_side = param [1, sideUnknown, [civilian]];
_mode = param [3, -1, [0]];

if (_uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {}; //Bad.
_query = "";

switch (_mode) do {
    case 2:
        {
            _value = param [2, [], [
                []
            ]];
            _query = format ["updaPart2:%1:%2", _value, _uid];
        };
    case 4:
        {
            _value = param [2, false, [true]];
            _value = [_value] call RRPServer_util_tinyIntConverter;
            _query = format ["updaPart4:%1:%2", _value, _uid];
        };
    case 5:
        {
            _value = param [2, false, [true]];
            _value = [_value] call RRPServer_util_tinyIntConverter;
            _value2 = param [4, 0, [0]];
            _query = format ["updaPart5:%1:%2:%3", _value, _value2, _uid];
        };
    case 8:
        {
            _value = param [2, false, [true]];
            _value = [_value] call RRPServer_util_tinyIntConverter;
            _query = format ["updaPart8:%1:%2", _value, _uid];
        };
    case 13:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart13:%1:%2", _value, _uid];
        };
    case 14:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart14:%1:%2", _value, _uid];
        };
    case 15:
        {
            _value = param [2, false, [false]];
            _query = format ["updaPart15:%1:%2", _value, _uid];
        };
    case 16:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart16:%1:%2", _value, _uid];
        };
    case 17:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart17:%1:%2", _value, _uid];
        };
    case 18:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart18:%1:%2", _value, _uid];
        };
    case 19:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart19:%1:%2", _value, _uid];
        };
    case 21:
        {
            _value = param [2, false, [true]];
            _value = [_value] call RRPServer_util_tinyIntConverter;
            _query = format ["updaPart21:%1:%2", _value, _uid];
        };
    case 22:
        {
            _value1 = param [2, [], [
                []
            ]];
            _value2 = param [4, [], [
                []
            ]];
            for "_i"
            from 0 to count(_value2) - 1 do {
                private _bool = [(_value2 select _i) select 1] call RRPServer_util_tinyIntConverter;
                _value2 set[_i, [(_value2 select _i) select 0, _bool]];
            };
            _query = format ["updaPart22:%1:%2:%3", _value1, _value2, _uid];
        };
    case 23:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart23:%1:%2", _value, _uid];
        };

    case 24:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart24:%1:%2", _value, _uid];
        };

    case 25:
        {
            _value = param [2, 0, [0]];
            _query = format ["updaPart25:%1:%2", _value, _uid];
        };
};

if (_query isEqualTo "") exitWith {};
_query call RRPServer_DB_fireAndForget;
