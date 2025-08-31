/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_rank","_array","_perms"];
if (count RRPClientGroupInfo isEqualTo 0) exitWith {false};
_rank = (getPlayerUID player) call RRPClient_groups_getPostGroup;
if (_rank in [1,2]) exitWith {true};
_perms = (((RRPClientGroupInfo get "ranks") select (RRPClientGroupLevel - 1)) select 2); 
toUpper(_this) in _perms 
