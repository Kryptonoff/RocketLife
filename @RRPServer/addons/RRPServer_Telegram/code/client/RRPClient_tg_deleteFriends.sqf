#include "..\..\script_macros.hpp"
params [["_playerUID","",[""]]];
if (_playerUID isEqualTo "") exitWith {};

_index = [RRPClientTGFriends,_playerUID] call RRPClient_util_find;
if (_index isEqualTo -1) exitWith {};
RRPClientTGFriends deleteAt _index;

["add",RRPClientTGFriends] call RRPClient_ini_friendList;