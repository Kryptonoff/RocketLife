/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_pos",[0,0,0],[[]]],
	["_h",0,[0]],
	["_t",0,[0]],
	["_drug",0,[0]],
	["_s",false,[false]],
	["_di",false,[false]],
	["_uid","",[""]]
];
if (_uid isEqualTo "") exitWith {};
format ["updatePlayerStats:%1:%2:%3:%4:%5:%6:%7",_pos,_h,_t,_drug,[_s] call RRPServer_util_tinyIntConverter,[_di] call RRPServer_util_tinyIntConverter,_uid] call RRPServer_DB_fireAndForget;
true
