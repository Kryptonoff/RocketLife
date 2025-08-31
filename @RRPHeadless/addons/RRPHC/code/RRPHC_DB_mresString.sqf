/*
	Project: Headless Client for Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_string","_filter"];
_string = param [0,"",[""]];
_filter = "'/\`:|;,{}-""<>";

_string = toArray _string; //Blow it up to an array
_filter = toArray _filter; //Blow it up to an array

{
    if (_x in _filter) then {
        _string deleteAt _forEachIndex;
    };
} forEach _string;

toString _string;
