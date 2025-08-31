/*

	Filename: 	RRPClient_system_jailMe.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params [
	["_ret",[],[[]]],
	["_bad",false,[false]]
];

if (_bad) then {waitUntil {uiSleep 0.03; LSALIVE(player)}};
detach player;
[player,"restrained"] call RRPClient_system_clearGlobalVar;
call RRPClient_system_inJail;
[0] call RRPClient_system_removeLicenses;
["all"] call RRPClient_system_removeBuff;

player setVariable ["ATMRobber", false, true];
life_atm_robCounter = 0;
profileNamespace setVariable ["PRNS_atm_robCounter", life_atm_robCounter];
saveProfileNamespace;

life_is_arrested = true;
[player,"isArrested",true] call CBA_fnc_setVarNet;
[5] call RRPClient_session_updatePartial;

if (!(EQUAL(PUNIFORM,"mgsr_robe"))) then
{
	[[player],"playerSaveQueue_playerUpdate"] call RRPClient_system_hcExec;
	call RRPClient_system_saveGear;
	call RRPClient_util_stripDownPlayer;

	{
		SVAR_MNS [ITEM_VARNAME(configName _x),0];
	} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

	life_carryWeight = 0;
	player setVariable ["inJail",true,true];
	player forceAddUniform "mgsr_robe";
};

private _mylistText = "";

if (!(EQUAL(_ret,[]))) then {
	private _mylist = [];
	life_bail_amount = 0;
	_mylistText = "";
	{
		_crime = _x select 1;
		if (!(_crime in _mylist)) then
		{
			_mylist pushBack _crime;
			_mylistText = _mylistText + format["%1<br/>",getText(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "displayName")];
		};
		_cost = getNumber(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "reward");
		life_bail_amount = life_bail_amount + _cost;
	} forEach _ret;
} else {
	life_bail_amount = 2000;
};

private _esc = false;
private _bail = false;
private _updateTime = time;
private _jailTime = life_jail_time;

private _postBailAction = player addAction["<t color='#07C945'>Выйти под залог",RRPClient_system_postBail,"[player]",0,false,false,"",'isNil "life_canpay_bail" && life_is_arrested  && life_jail_time > 0'];
private _bail_amount = if (_bad) then {life_bail_amount * 3} else {life_bail_amount};

[_bad] spawn {
	life_canpay_bail = false;
	if (_this select 0) then {
		life_bail_amount = life_bail_amount * 2;
		uiSleep ((life_jail_time - 5) * 60);
	} else {
		uiSleep (round((life_jail_time - (life_jail_time / 3))*60));
	};
	life_canpay_bail = nil;
};

if (!(EQUAL(_mylistText,""))) then {
	[format["Вы отбываете тюремный срок за следующие правонарушения: <br/><br/><t color='#ffc900'>%1</t><br/>Срок заключения: <t color='#ffc900'>%2 минут</t><br/><br/>Сумма залога для досрочного освобождения после отсидки трети срока: <t color='#90ff00'>$%3</t> (временно недоступно)<br/><br/>Вы можете оспорить срок заключения подав жалобу в соответствующие органы.",_mylistText,life_jail_time,[_bail_amount] call RRPClient_util_numberText],"police"] call RRPClient_system_hint;
};

disableSerialization;
private _uiDisp = GVAR_UINS ["jail_timer",displayNull];
if (isNull _uiDisp) then {
	["jail_timer","PLAIN"] call RRPClient_gui_CreateRscLayer;
	_uiDisp = GVAR_UINS ["jail_timer",displayNull];
};
private _timer = _uiDisp displayCtrl 38305;
["prison",1] call RRPClient_ach_gateway;
private _second = 60;
while {true} do {

	if (life_jail_time > 0) then {
		_timer ctrlSetStructuredText parseText format ["Срок заключения: %1:%2 мин<br/>%3",
		life_jail_time,
		_second,
		if(isNil "life_canpay_bail") then {format["Выход под залог: $%1",[life_bail_amount] call RRPClient_util_numberText]} else {""}
		];
	};

	if (_second isEqualTo 0) then {
		life_jail_time = life_jail_time - 1;
		life_hunger = 100;
		life_thirst = 100;

		if (life_jail_time > 0) then {
			[steamid,life_jail_time] remoteExecCall ["RRPServer_jail_wantedUpdateJailTime",2];
			"Отсиженное время учтено..." call chat;
		};
		_second = 60;
	};

	if (player distance (getMarkerPos "grp_jail_marker") > 100 && life_jail_time > 15) then {call RRPClient_system_inJail};
	if (life_bail_paid) exitWith {_bail = true};
	if (!(player getVariable ["isArrested",false])) exitWith {_esc = true};
	if (life_jail_time < 1) exitWith {hint ""};
	if (LSNOTALIVE(player) && (life_jail_time > 0)) exitWith {};

	RRPClientHunger = 100;
	RRPClientThirst = 100;


	_second = _second - 1;
	uiSleep 1;
};

["jail_timer"] call RRPClient_gui_DestroyRscLayer;

switch (true) do
{
	case (_bail):
	{
		life_jail_time = 0;
		life_is_arrested = false;
		[player,"isArrested"] call RRPClient_system_clearGlobalVar;
		life_bail_paid = false;
		["Вы оплатили залог и теперь свободны."] call hints; 
		serv_wanted_remove = [player];
		if (ISPSIDE("civ")) then {player setPos (getMarkerPos "jail_release_civ");} else {player setPos (getMarkerPos "jail_release_reb");};
		[steamid] remoteExecCall ["RRPServer_ws_wantedRemove",2];
		[5] call RRPClient_session_updatePartial;
		player removeAction _postBailAction;
		player setVariable ["inJail",false,true];
		player remoteExecCall ["RRPServer_system_loadPlayerLoot",2];
		["down",10] call RRPClient_system_updateKarma;
	};

	case (_esc):
	{
		life_jail_time = 0;
		life_is_arrested = false;
		[player,"isArrested"] call RRPClient_system_clearGlobalVar;
		["Вы совершили побег из тюрьмы и теперь находитесь в национальном розыске."] call hints;
		player setVariable ["inJail",false,true];
		[0,"%1 совершил побег из тюрьмы!",true,[GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];

		[steamid,"901"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
		[5] call RRPClient_session_updatePartial;
	};

	case (LSALIVE(player) && !_esc && !_bail):
	{
		life_jail_time = 0;
		life_is_arrested = false;
		[player,"isArrested"] call RRPClient_system_clearGlobalVar;
		["Вы отсидели свой срок в тюрьме и были освобождены"] call hintss;
		if (ISPSIDE("civ")) then {player setPos (getMarkerPos "jail_release_civ");} else {player setPos (getMarkerPos "jail_release_reb");};
		player remoteExecCall ["RRPServer_system_loadPlayerLoot",2];
		[steamid] remoteExecCall ["RRPServer_ws_wantedRemove",2];
		[5] call RRPClient_session_updatePartial;
		player setVariable ["inJail",false,true];
		["down",10] call RRPClient_system_updateKarma;
	};
};
player removeAction _postBailAction;
if (EQUAL(PUNIFORM,"mgsr_robe")) then {removeUniform player};
