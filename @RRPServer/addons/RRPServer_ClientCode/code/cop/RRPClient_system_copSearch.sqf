/*
	Filename: 	RRPClient_system_copSearch.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
life_action_inUse = false;
params [
	["_civ",Objnull,[Objnull]],
	["_invs",[],[[]]],
	["_dcash",0,[0]]
];

if(isNull _civ) exitWith {};

private _illegal = 0;
private _inv = "";

if (count _invs > 0) then {
	private "_index";
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,ITEM_NAME(_x select 0)];
		_index = [_x select 0,RRPPublicEconomyIlegalItems] call RRPClient_system_index;
		if !(EQUAL(_index,-1)) then {
			_illegal = _illegal + ((_x select 1) * ((RRPPublicEconomyIlegalItems select _index) select 1));
		};
	} foreach _invs;
	
	if (_dcash > 0) then {
		[getPlayerUID _civ,"482"] remoteExecCall ["RRPServer_ws_wantedAdd",2];

		_illegal = _illegal + _dcash;
	};

	[getPlayerUID _civ,"481"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	
	[0,"У %1 имеется контрабанда на сумму $%2",true,[(GVAR_RNAME(_civ)),[_illegal] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_system_broadcast",west];
} else {
	_inv = "Нет незаконных предметов";
};

if (!alive _civ || {player distance _civ > 5}) exitWith {[format["Невозможно найти %1",GVAR_RNAME(_civ)]] call hints};
[format["<t size='2' color='#FF0000'>%1</t><br/><t size='1.5' color='#FFD700'><br/>" +("Нелегальные предметы")+ "</t><br/><br/>%2<br/><br/>Грязные деньги: <t color='#FF0000'>$%3</t>",(GVAR_RNAME(_civ)),_inv,[_dcash] call RRPClient_util_numberText]] call hints;

if (_illegal > 0) then {
	[[player,"atm","add",_illegal],"system_moneyChange"] call RRPClient_system_hcExec;

	_log = format ["copSearch: atm (add) %3 to NAME:%1 (%2)",name player,steamid,_illegal];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
};