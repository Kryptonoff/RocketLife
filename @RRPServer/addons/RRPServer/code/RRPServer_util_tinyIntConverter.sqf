/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

params [["_bool",0,[false,0]]];
if (_bool isEqualType 0) exitWith {[false,true] select (_bool isEqualTo 1)};
if (_bool isEqualType false) exitWith {[0,1] select _bool};
false
