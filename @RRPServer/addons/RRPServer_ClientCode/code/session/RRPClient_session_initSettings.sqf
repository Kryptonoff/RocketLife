/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	"_deathMarkers",
	"_myPassportId",
	"_myIdentity",
	"_tagid",
	"_padskinid",
	"_titleid",
	"_isGirl",
	"_canBill",
	"_deaths",
	"_karma",
	"_first_time",
	"_quests"
];

[
	[
		["life_myPassportID",_myPassportId],
		["life_myIdentity",_myIdentity]
	]
] call RRPClient_system_setIndicators;

life_death_markers = _deathMarkers;

life_deaths_max = switch (call life_donator) do
{
	case 1: {7};
	case 2: {8};
	case 3: {9};
	case 4: {10};
	case 5: {10};
	default {6};
};

if (life_deaths >= life_deaths_max) exitWith
{
	[true] spawn RRPClient_system_logout;
};

life_myTagID = _tagid;
life_myPadSkinID = _padskinid;
life_myTitleID = _titleid;
license_isGirl = _isGirl;
life_canBill = _canBill;
life_karma = _karma;
life_deaths = _deaths;
life_firstTime = _first_time;
player setVariable ["rrpvar_questsList",_quests];

true