/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
try{
	private _building = param [0,ObjNull,[ObjNull]];
	if (isNull _building) exitWith {};
	if !(_building isKindOf "House_F") throw "Вы смотрите не на дверь...";
	if (([player] call RRPClient_system_isSafeZone) # 0) throw "Вы находитесь в зеленой зоне! Запрещено грабить, угонять технику и связывать людей!";
	if !(call RRPClient_system_checkMask) exitWith {}; //забыл надеть маску
	if (_building in life_vehicles OR _building in life_tempHouses) throw "У вас уже есть ключи от этого здания";
	if (typeOf _building isEqualTo "EXT_Land_em_mansion_01_reversed") throw "У домов такого типа очень сильная охрана.";
	private _isFed = if ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {true} else {false};

	private ["_marker","_uid"];
	private _error = "";
	if !(_isFed) then {
		if (isNil {_building GVAR "house_owner"}) exitWith {_error = "У дома не прописан владелец"};
		
		private _uid = (_building GVAR "house_owner") select 0;
		_neighs = _building getVariable ["Neighs",[]];
		_canBeRaided = false;
		{
			if ([_x] call RRPClient_system_isUIDActive) exitWith
			{
				_canBeRaided = true;
			};
		}forEach _neighs;
		if !(_canBeRaided) then {_error = "Никого из проживающих нет дома";};
	} else {
		private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
		if (["cop"] call RRPClient_system_playerCount < _minCops) exitWith {_error = format ["Должно быть минимум %1 полицейских на острове, чтобы продолжить.",_minCops]};
	};
	if (_error != "") exitWith {[_error,"error"] call hints};

	private _door = [_building] call RRPClient_system_nearestDoor;
	if (EQUAL(_door,0)) exitWith {["Вы не рядом с дверью!"] call hints};

	if ((_building GVAR [format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {
		["Дверь уже была открыта, возможно в связи аномалиями на острове. Теперь она заперта и вы можете снова попробовать ее вскрыть"] call hints;
		_building SVAR [format["bis_disabled_Door_%1",_door],1,true];
	};

	if (_isFed) then {
		[[1,2],"!!! КТО-ТО ПРОНИК В НАЦИОНАЛЬНЫЙ РЕЗЕРВ !!!",true,[]] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];
	} else {
		_marker = createMarker [format["%1_houserob", steamid], position player];//make dynamic markers. for each player!
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "!Внимание! Домушник!";
		_marker setMarkerType "mil_warning";
		
		if (_building getVariable ["security",false]) then
		{
			{
				_neighs = _building getVariable ["Neighs",[]];
				if (getPlayerUID _x in _neighs) then
				{
					if !(isNull _x) then 
					{
						[0] remoteExecCall ["RRPClient_system_raidAlert",_x];
					};
				};
			}forEach playableUnits;
		};
	};
	call RRPClient_actions_inUse;

	//Setup the progress bar
	disableSerialization;
	private _title = "Вскрытие замка на двери";
	private _cP = 0;

	private _cpRate = switch (typeOf _building) do {
		case "Land_Dome_Big_F": {0.001;};
		case "Land_Research_house_V1_F": {0.001;};
		default {0.0015;}
	};
	_cpRate = ["BoltCutter", _cpRate] call RRPClient_perks_activatePerk;
	titleText[_title,"PLAIN"];

	while {true} do 
	{
		_cP = _cP + _cpRate;
		[_cP,"lock"] call RRPClient_system_progressBar;
		if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};
		call RRPClient_animation_kneelWork;
		uiSleep 0.26;
	};

	["life_progress"] call RRPClient_gui_DestroyRscLayer;
	life_action_inUse = false;
	if (!isNil "_marker") then {deleteMarker _marker;};

	if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;

	if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"];};

	if (_isFed) then 
	{
		_building SVAR [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
	} else {

		_chance = if (_building getVariable ["security",false]) then {70}else{40};
		// systemChat format ["Шанс взлома %1%2",_chance,"%"];
		if(random(100) > _chance) then 
		{
			if (!(_building in life_tempHouses)) then {life_tempHouses pushBack _building};

			[steamid,"459"] remoteExecCall ["RRPServer_ws_wantedAdd",2];

			titleText["Вы вскрыли входную дверь и завладели ключами!","PLAIN"];
		} else {
			titleText["Не удалось вскрыть дверь. Попробуйте еще.","PLAIN"];
		};
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};