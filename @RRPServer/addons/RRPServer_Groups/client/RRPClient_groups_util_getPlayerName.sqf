/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [["_groupHash",createHashMap],"_uid"];
if (count _groupHash isEqualTo 0) exitWith { "NOT IN GROUP" };
_members = _groupHash getOrDefault ["members",[]];
_index = [_members,_uid] call RRPClient_util_find;
((_members select _index) select 1)
