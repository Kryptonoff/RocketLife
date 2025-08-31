/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_uid","_side","_query","_queryResult","_tickTime","_tmp","_queryS"];
_player = objectFromNetId _this;
_uid = getPlayerUID _player;
if (isNull _player) exitWith
{
	format ["#kick %1",_uid] call RRPServer_DB_sendRconCommand;
	"Player nulled, exit from queryRequst" call RRPServer_util_log;
};
_baned2 = format["checkBan:%1",_uid] call RRPServer_DB_selectSingleField;
format ["Check ban %1 ? %2 #0111",_uid,_baned2] call RRPServer_util_debugConsole;
if (_baned2) exitWith
{
	["Banned",false,false] remoteExecCall ["BIS_fnc_endMission",_player];
};

/*
if !([name _player] call RRPClient_system_checkName) exitWith {
	["BadProfileName2",false,false] remoteExecCall ["BIS_fnc_endMission",_player];
};
*/

_confirmed = format ["char_isConfirmed:%1",_uid] call RRPServer_DB_selectSingleField;
if (_confirmed isNotEqualTo 1) exitWith
{
	switch _confirmed do
	{
		case 2: {
			_player setVariable ["haveAcc",true,true];
			_names = format ["char_getName:%1",_uid] call RRPServer_DB_selectSingle;
			_names remoteExecCall ["RRPClient_char_open2Menu",_player];
		};
		default {
			[] remoteExecCall ["RRPClient_char_openMenu",_player];
		};
	};
};

_query = format ["loadPlayer:%1",_uid];
_tickTime = diag_tickTime;
_queryResult = _query call RRPServer_DB_selectSingle;
diag_log "------------- Client Query Request -------------";
diag_log format ["QUERY: %1",_query];
diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format ["Result: %1",_queryResult];
diag_log "------------------------------------------------";
/**
	TODO:
		Добавить
			group_id
			side
**/

_queryResult params [
	"_main",
	"_profs",
	"_ach",
	["_perks",createHashMap],
	"_arrested",
	"_slave"
];

private _secret_shop = [];
{_secret_shop pushBack (_x # 0)} forEach (format ["getSecretShopItems:%1",_uid] call RRPServer_DB_selectFull);
_queryResult pushBack _secret_shop;

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

["Query",_queryResult,false] call RRPClient_util_logArray;
["Main",_main,false] call RRPClient_util_logArray;

_player setVariable ["name_surname",[_first_name,_last_name],true];
_player setVariable ["nickname",_nick_name,true];
_player setVariable ["age",_age,true];
_player setVariable ["accessory",_accessory,true];
_player setVariable ["GarageSlots",_garageSlots];
_player setVariable ["CountVehicles",_uid call RRPServer_garage_countVehicles,true];
_player setVariable ["PlayerTime", _total_time, true];
_player setVariable ["isBeginner",[false,true] select (_total_time < (getNumber(missionConfigFile >> "LifeCfgSettings" >> "beginnerTime"))),true];

[_player, _face] remoteExec ["setFace", 0, _player];

_player addMPEventHandler ["MPKilled", {_this call RRPServer_event_player_MPKilled}];
_player setVariable ["RRPDatabasePID",_id];
_player setVariable ["RRPCash",_cash];
_player setVariable ["RRPAtm",_bankacc];
_player setVariable ["RRPPoint",_Epoint];
_player setVariable ["RRPDcash",_dcash];
_player setVariable ["RRPTRX",_trx,true];
_player setVariable ["RRPSide",_side,true];

_groupData = missionnamespace getVariable [format ["ServerGroupsInfo_%1",_group_id],createHashMap];
_player setVariable ["GroupID", _group_id, true];
_player setVariable ["GroupData", _groupData];

_data = [];
_houseData = _uid spawn RRPServer_house_fetchPlayerHouses;
waitUntil {scriptDone _houseData};
_data pushBack (missionNamespace getVariable [format ["houses_%1",_uid],[]]);
_ltdData = _uid spawn RRPServer_ltd_queryPlayer;
waitUntil{scriptDone _ltdData};

_data pushBack (missionNamespace getVariable [format ["ltd_%1",_uid],[]]);
_data pushBack (missionNamespace getVariable [format ["%1_KEYS",_uid],[]]);
_data pushBack _groupData;

_data remoteExec ["RRPClient_session_initQuery",_player];

_settings = format ["loadPlayerSettings:%1",_uid] call RRPServer_DB_selectSingle;
_settings deleteAt 0;


// private _partyMeat = format["isRegPartyMeat:%1",_uid] call RRPServer_DB_selectSingle;

[
	_queryResult,
	_settings
	// _partyMeat
] remoteExecCall ["RRPClient_session_loadPlayer",_player];

_player spawn RRPServer_system_loadPlayerLoot;

missionNamespace setVariable ["JT_" + _uid,serverTime];
