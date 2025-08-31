/*
	Filename: 	RRPClient_system_raidHouse.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	private _house = param [0,ObjNull,[ObjNull]];
	if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
	if (isNil {(_house GVAR "house_owner")}) throw "Этот дом никому не принадлежит.";
	if (('cop' call RRPClient_groups_getSideLevel) < 8) throw "Конфисковывать ресурсы могут только офицеры";
	private _uid = (_house GVAR "house_owner") select 0;
	private _neighs = _house getVariable ["Neighs",[]];
	private _canBeRaided = false;

	{
		_toCheck = _x;
		if ([_toCheck] call RRPClient_system_isUIDActive) exitWith
		{
			_canBeRaided = true;
		};
	}forEach _neighs;

	if !(_canBeRaided) throw "Хозяев нет на острове!";

	private _house_box = _house GVAR["house_box",objNull];
	if (isNull _house_box) throw "Ящик не найден";

	if ([_house_box] call RRPClient_system_isTrunkInUse) throw "Багажник уже используется.";

	private _houseInv = _house_box GVAR ["Trunk",[[],0]];
	if (EQUAL((_houseInv select 0),[])) throw "В этом доме ничего нет.";
	if (_house GVAR ["inRaid",false]) throw "Уже идет обыск...";

	call RRPClient_actions_inUse;
	_house SVAR["inRaid",true,true];

	//Setup the progress bar
	private _time = 45;
	_time = ["saveTimeAction",_time] call RRPClient_system_VIP;
	private _complete = ["Обыск дом...",{(player distance _house < 10) OR {(call RRPClient_system_isInterrupted)}},true,_time,false,true,{call RRPClient_animation_kneelWork}] call RRPClient_system_newProgressBar;
	if (isNil "_complete") throw "Действие прервано";
	if !(_complete) throw "Действие прервано!";
	life_action_inUse = false;

	[_house,"inRaid"] call RRPClient_system_clearGlobalVar;

	if (call RRPClient_system_isInterrupted) throw "Действие прервано";

	if (player distance _house > 13) throw "Вы отошли слишком далеко от дома!";

	private _reward = 0;
	{
		private _var = _x select 0;
		private _val = _x select 1;

		private _index = [_var,RRPPublicEconomyIlegalItems] call RRPClient_system_index;
		if !(EQUAL(_index,-1)) then {
			_reward = _reward + (_val * ((RRPPublicEconomyIlegalItems select _index) select 1));
		};
	} foreach (_houseInv select 0);

	//TODO изменить систему группировок
	if (_reward > 0) then {
		[0,"В доме было обнаружено и изъято запрещенных веществ на сумму $%1",true,[[_reward] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
		private _gangID = RRPClientGroupInfo get "premialVar";
		if (EQUAL(_gangID, "police")) then {
			[player getVariable ["GroupId",-1],"add",_reward] remoteExecCall ["RRPServer_groups_moneyChange",2];
		} else {
			[player,"atm","add",STR(_reward)] remoteExecCall ["RRPServer_system_moneyChange",2];
			_log = format ["raidHouse: atm (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_reward];
			["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
		};
		[_house_box] call RRPClient_system_clearVehicleTrunk;

		[_house_box,player] remoteExecCall ["RRPServer_house_updateHouseContainers",2];
	} else {
		throw "В этом доме нет запрещенных веществ.";
	};
}catch{
	life_interrupted = false;
	["ErrorTitleAndText",[_exception]] call toast;
};
