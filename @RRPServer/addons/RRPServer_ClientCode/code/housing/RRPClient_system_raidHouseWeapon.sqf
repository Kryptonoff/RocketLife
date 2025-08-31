/*
	Filename: 	RRPClient_system_raidHouseWeapon.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
try{
	if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
	if (isNil {(_house GVAR "house_owner")}) throw "Этот дом никому не принадлежит.";
	if (('cop' call RRPClient_groups_getSideLevel) < 8) throw "Конфисковывать оружие могут только офицеры";

	private _uid = (_house GVAR "house_owner") select 0;
	if (!([_uid] call RRPClient_system_isUIDActive)) throw "Владелец дома не в сети и вы не можете обыскать этот дом!";

	private _house_box = _house GVAR["house_box",objNull];
	if (isNull _house_box) throw "Ящик не найден";

	if ([_house_box] call RRPClient_system_isTrunkInUse) throw "Багажник уже используется.";

	private _houseInv = _house_box GVAR ["inventory",[[],0]];
	if (EQUAL((_houseInv select 0),[])) throw "В этом доме ничего нет.";
	if (_house GVAR ["inRaid",false]) throw "Уже идет обыск...";

	call RRPClient_actions_inUse;
	_house SVAR ["inRaid",true,true];

	private _time = 45;
	_time = ["saveTimeAction",_time] call RRPClient_system_VIP;
	private _complete = ["Обыск дом...",{(player distance _house < 10) OR {(call RRPClient_system_isInterrupted)}},true,_time,false,true,{call RRPClient_animation_kneelWork}] call RRPClient_system_newProgressBar;
	if (isNil "_complete") throw "Действие прервано";
	if !(_complete) throw "Действие прервано!";
	life_action_inUse = false;

	[_house,"inRaid"] call RRPClient_system_clearGlobalVar;

	if (call RRPClient_system_isInterrupted) throw "Действие прервано!";

	if (player distance _house > 13) throw "Вы отошли слишком далеко от дома!";

	private _houseInv = _houseInv select 0;
	private _reward = 0;
	{
		private _itemPrice = M_CONFIG(getNumber,"LifeCfgItems",_x select 0,"price");
		if (_itemPrice > 0) then {
			_reward = _reward + ( (round(_itemPrice / 4)) * (_x select 1) );
		};
	} forEach _houseInv;


	if (_reward > 0) then {
		private _gangID = RRPClientGroupInfo get "premialVar";
		if (EQUAL(_gangID, "police")) then {
				[player getVariable ["GroupId",-1],"add",_reward] remoteExecCall ["RRPServer_groups_moneyChange",2];
		} else {
			[player,"atm","add",STR(_reward)] remoteExecCall ["RRPServer_system_moneyChange",2];
			_log = format ["raidHouseWeapon: atm (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_reward];
			["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
		};

		_house_box SVAR ["inventory",[[],0],true];

		[_house_box,player] remoteExecCall ["RRPServer_house_updateHouseContainers",2];


		[0,"В доме было обнаружено и изъято вооружения на сумму $%1",true,[[_reward] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
	} else {
		throw "В этом доме нет запрещенного вооружения";
	};
}catch{
	life_interrupted = false;
	["ErrorTitleAndText",[_exception]] call toast;
};
