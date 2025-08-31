/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
#include "\RRPServer\script_macros.hpp"

life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {};
if (life_session_tries > 3) exitWith {cutText["При настройке вашего клиента возникла ошибка.","BLACK FADED"]; 0 cutFadeOut 999999999;};

uiNamespace setVariable ["loading_desc_text","Получение данных от сервера…. Проверка..."];

if (isNil "_this") exitWith { call RRPClient_session_insertPlayerInfo };
if (_this isEqualType "") exitWith { call RRPClient_session_insertPlayerInfo };
if (_this isEqualTo []) exitWith { call RRPClient_session_insertPlayerInfo };
params [
	"_data",
	"_settings",
	"_partyMeat"
];
_data params [
	"_main",
	"_profs",
	"_ach",
	["_perks",createHashMap],
	"_arrested",
	"_slave",
	"_secret_shop_new"
];


_main params [
	"_id",
	"_name",
	"_first_name",
	"_last_name",
	"_nick_name",
	"_cash",
	"_bankacc",
	"_dcash",
	"_EPoint",
	"_trx",
	"_garageSlots",
	"_age",
	"_ltd_id",
	"_group_id",
	"_group_level",
	"_side",
	"_adminlevel",
	"_donorlevel",
	"_accessory",
	"_face",
	"_jail_coin",
	"_jail_time",
	["_prestige",0],
	["_xp",0],
	["_level",0],
	"_total_time"
];

["Query",_data,false] call RRPClient_util_logArray;
["Main",_main,false] call RRPClient_util_logArray;


CONST(RRPClientPlayerID,(_id));

if (!isServer && {(!isNil "life_adminlevel" OR {!isNil "life_donator"})}) exitWith
{
	diag_log format["you admin or donator ? %1 %2",isNil "life_adminlevel",isNil "life_donator"];
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

_settings call RRPClient_session_initSettings;
call RRPClient_session_initLicense;
private _arr = (toArray(getPlayerUID player select [12,17])); reverse _arr; _arr = toString _arr;
player setVariable ["tsNickName",(format ["PLR%2_%1",_arr,call RRPClientPlayerID]),true];
//Parse basic player information.
RRPClientCashMoney = _cash;
RRPClientAtmMoney = _bankacc;
RRPClientCredits = _Epoint;
RRPClientCashMoneyD = _dcash;
RRPClientGarageSlots = _garageSlots;
RRPClientTRX = _trx;
CONST(life_adminlevel,(_adminlevel));
COMPIL(life_donator,(_donorlevel));

player setVariable ["lvl",_level,true];
call RRPClient_groups_setLicense;
RRPClientGroupLevel = _group_level;

life_is_arrested = _arrested;
life_jail_time = _jail_time;
life_slave = _slave;
RRPClientCompleteAch = [_ach,[]] select (_ach isEqualType "");
call RRPClient_ach_verify;

if !(_profs isEqualTo []) then {
    {
        missionNamespace setVariable [(_x select 0),[_x select 1,_x select 2]];
    } forEach _profs;
};

life_jail_coin = _jail_coin;
if (life_jail_coin > 0) then {
	player setVariable ["corrective_work",true,true];
};

if ((server_govinfo select 0 isEqualto steamid) && (ISPSIDE("civ"))) then {life_gov = true};
if ((count life_death_markers > 0)) then {[] spawn RRPClient_dz_deathTimer};

secretShop = _secret_shop_new;
life_maxWeightT = 24;
life_maxWeightT = ["virtualWeight",life_maxWeightT] call RRPClient_system_VIP;

VRP_Perks = createHashMapFromArray _perks;
VRP_Prestige = _prestige;
VRP_Level = _level;
VRP_XP = _xp;


{
	_item = _x;
	_config = getMissionConfig "secret_shop_items" >> _item;
	if !(isClass _config) then {continue};
	if (getText(_config >> "type") isNotEqualTo "func") then {continue};
	call compile (getText(_config >> "executeCode"));
} forEach secretShop;

{
	player setUnitTrait _x;
}foreach [
	["audibleCoef",0],
	["camouflageCoef",0],
	["loadCoef",0],
	["engineer",false],
	["explosiveSpecialist",false],
	["medic",true],
	["UAVHacker",false]
];


if !(isNil {_partyMeat}) then {
	if (_partyMeat # 4) then {
		player setVariable ["RRPVariablePartyMeatActive", true,true];
		partyMeat = _partyMeat;
	};
};

life_session_completed = true;

private _drpc =
{
	private _packet =
	[
		"rocket-rp.fun",
		format ["Playing: %1/%2 players on server",(count allPlayers),155],
		"_256_256",
		"Real life is real!",
		"_256_256",
		format ["My ID %1",(call RRPClientPlayerID)],
        ["Aurora Role Play","https://rocket-rp.fun/", "Rocket Discord", "https://discord.gg/5a3vHrnUT6"],
		true
	];
	_packet  params [
		"_defaultDetails","_defaultState",
		"_defaultLargeImageKey","_defaultLargeImageText",
		"_defaultSmallImageKey","_defaultSmallImageText",
		"_defaultButtons","_showTimeElapsed"
	];
	private _settings = [
		["UpdateDetails",_defaultDetails],
		["UpdateState",_defaultState],
		["UpdateLargeImageKey",_defaultLargeImageKey],
		["UpdateLargeImageText",_defaultLargeImageText],
		["UpdateSmallImageKey",_defaultSmallImageKey],
		["UpdateSmallImageText",_defaultSmallImageText],
		["UpdateButtons",_defaultButtons]
	];
	_settings call RRPClient_discord_drpc_update;
};
[30, _drpc, [], true] call RRPClient_system_thread_addTask;
