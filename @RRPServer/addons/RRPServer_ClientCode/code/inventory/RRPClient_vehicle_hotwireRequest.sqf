/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPClient_vehicle_hotwireRequest};
private ["_vehicle","_distance","_dice","_complete"];
_vehicle = param [0,objNull,[objNull]];
try
{
	if (isNull _vehicle) throw "Че Че че???";
	if !(alive _vehicle) throw "Замки все погорели уже";
	if !(call RRPClient_system_checkMask) throw "Нужна маска, а то вдруг меня заметят";
	//if (_vehicle in life_vehicles) throw "У вас есть ключи от этой техники";
	if !([_vehicle] call RRPClient_system_isVehicleKind) throw "Это вообще не взламывается";
	if (([_vehicle] call RRPClient_system_isSafeZone) # 0) throw "Техника находится в защищенной зоне";
	if !("extItem_lockpick" in (magazines player)) throw "У вас нет отмычек!";
	_distance = (((boundingBox _vehicle) select 1) select 0) + 2;
	if (player distance _vehicle > _distance) throw "Нужно подойти ближе";

	private _activeUID = _vehicle getVariable ["abuseBreakingLock","-1"];
	private _playerUID = getPlayerUID player;

	if ([_activeUID] call RRPClient_system_isUIDActive OR {(_activeUID isEqualTo "-1")}) then {
			_vehicle setVariable ["abuseBreakingLock",_playerUID,true];
	} else {throw "Уже кто-то взаимодействует!"};

  [_vehicle] call RRPClient_vehicle_countChanceBreakingLock params ["_chance","_time","_lvl"];
	if ((call (life_adminlevel) > 0) and {!((getPlayerUID player) isEqualTo "76561197984276591")}) then {
		format ["CHANCE: %1 | TIME: %2 | lockLVL: %3",_chance,_time,_lvl] call chat;
		format ["VIP TIME: %1",_time] call chat;
		_time = 5;
	};

	_complete = [format ["Взлом замка %1-уровня...",_lvl],{!((player distance _vehicle > (((boundingBox _vehicle) select 1) select 0) + 2)) AND {(_vehicle getVariable ["abuseBreakingLock","-1"] isEqualTo _playerUID)}},true,_time,false,true,{["CL3_anim_lockpick",false,true] call RRPClient_system_animDo;}] call RRPClient_system_newProgressBar;
  if (isNil "_complete") throw "Действие прервано";
  if !(_complete) throw 'Действие прервано!';

	_dice = round(random(100));

	if (_vehicle getVariable ["adacAntiTheft",0] isEqualTo 1) then {
		_chance = (_chance * 0.7);
	};

	if (_dice < _chance) then {
		life_vehicles pushBack _vehicle;
		["SuccessTitleAndText",["Техника взломана!","Теперь у вас есть ключи от этой техники."]] call SmartClient_gui_toaster_addTemplateToast;
		[getPlayerUID player,"487"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
		playSound "RRPSound_LockPick";
	} else {
		_vehicle setVariable ["abuseBreakingLock",nil,true];
		['badcracker',1] call RRPClient_ach_gateway;
		["ErrorTitleAndText",["Отмычка сломана!","Вы не смогли взломать замок..."]] call SmartClient_gui_toaster_addTemplateToast;
		["extItem_lockpick"] call RRPClient_system_removeItemFromInventory;
		_vehicle setVariable ["abuseBreakingLock",nil,true];
		playSound "RRPSound_BrokenLockPick";
	};
	["stand"] call RRPClient_system_animDo
} catch {
	["ErrorTitleAndText",["Ошибка",_exception]] call SmartClient_gui_toaster_addTemplateToast;
  _vehicle setVariable ["abuseBreakingLock",nil,true];
	["stand"] call RRPClient_system_animDo
};
