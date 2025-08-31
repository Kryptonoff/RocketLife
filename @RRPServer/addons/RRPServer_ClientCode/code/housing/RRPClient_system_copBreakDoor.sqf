/*
	Filename: 	RRPClient_system_copBreakDoor.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	private _house = param [0,ObjNull,[ObjNull]];
	if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
	if (isNil {(_house GVAR "house_owner")}) throw "Этот дом никому не принадлежит.";

	private _uid = (_house GVAR "house_owner") select 0;
	_neighs = _house getVariable ["Neighs",[]];
	_canBeRaided = false;
	{
		_toCheck = _x;
		if ([_toCheck] call RRPClient_system_isUIDActive) exitWith
		{
			_canBeRaided = true;
		};
	}forEach _neighs;

	if !(_canBeRaided) throw "Хозяев нет на острове!";

	private _door = [_house] call RRPClient_system_nearestDoor;
	if (EQUAL(_door,0)) throw "Вы не возле двери!";
	if ((_house GVAR [format["bis_disabled_Door_%1",_door],0]) == 0) throw "Дверь уже разблокирована!";

	call RRPClient_actions_inUse;

	if (_house getVariable ["security",false]) then
	{
		{
			if (getPlayerUID _x in _neighs) exitWith
			{
				if !(isNull _x) then
				{
					[1] remoteExecCall ["RRPClient_system_raidAlert",_x];
				};
			};
		}forEach playableUnits;
	};

	//Setup the progress bar
	disableSerialization;
	private _time = 45;
	_time = ["saveTimeAction",_time] call RRPClient_system_VIP;
	private _complete = ["Взлом замка на двери...",{(player distance _house < 10) OR {(call RRPClient_system_isInterrupted)}},true,_time,false,true,{call RRPClient_animation_kneelWork}] call RRPClient_system_newProgressBar;
	if (isNil "_complete") throw "Действие прервано";
	if !(_complete) throw "Действие прервано!";
	life_action_inUse = false;

	if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;

	if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"]};

	if !(_house in life_vehicles) then {
		life_vehicles pushBack _house;
		titleText["Дверь вскрыта и теперь у вас есть ключи от дома","PLAIN"];
	};
	[50,"взлом дома"] call addXP;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
