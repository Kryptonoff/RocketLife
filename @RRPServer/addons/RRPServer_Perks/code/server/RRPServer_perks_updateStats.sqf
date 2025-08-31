
params [
	["_uid",""],
	["_level",1],
	["_xp",0],
	["_prestige",0],
	["_perks",createHashMap]
];

if (_uid isEqualTo "") exitWith {};

format ["updatePerkStats:%1:%2:%3:%4:%5",_level,_xp,_prestige,_perks, _uid] call RRPServer_DB_fireAndForget;
true