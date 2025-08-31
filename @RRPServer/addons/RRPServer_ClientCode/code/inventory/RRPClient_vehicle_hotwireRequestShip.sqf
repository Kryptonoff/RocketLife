/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ["_boat","_complete","_time","_bingo","_userID","_useCar"];
_boat = cursorObject;
if (life_action_inUse) exitWith {	["ErrorTitleAndText", ["Действие прервано!", "Вы уже выполняете какое то действие!"]] call SmartClient_gui_toaster_addTemplateToast;};
try {
	life_action_inUse = true;
	if !(typeOf(_boat) isKindOf "ship") throw "Объект с которым вы пытаетесь взаимодействовать не является лодкой!";
	if !((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") throw "Вы в агонии";
	if !(vest player in ["V_RebreatherB","V_RebreatherIA"]) throw "У вас должен быть ребризер";
	if !(uniform player in ["U_B_Wetsuit","U_I_Wetsuit"]) throw "У вас должен быть костюм для погружения под воду";
	if ((speed _boat) > 1) throw "Нельзя взламывать судно которое находится на ходу!";
	if !("extItem_lockpick" in (itemsWithMagazines player)) throw "У вас нет отмычек для взлома";
	if ((_boat distance player) > 10) throw "Подплывите ближе к лодке";
	if !((crew _boat) isEqualTo []) throw "В технике есть пассажир!";

	_userID = _boat getVariable ["htw","-1"];
	if (_userID isEqualTo "-1") then {
	  _boat setVariable ["htw",getPlayerUID player, true];
	  _useCar = false;
	} else {
	  if (_userID isEqualTo (getPlayerUID player)) then {_useCar = false} else {
	   _useCar = if ([_userID] call RRPClient_system_isUIDActive) then {true} else {false};
	  };
	};

	if (_useCar) throw "Данный автомобиль уже используется другим игроком!";
	[_boat] remoteExecCall ["RRPClient_vehicles_alarmSound",-2];

	_time = 30;
	_complete = ["Взлом техники...",{!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player)},true,_time,false,true,{player playActionNow "FT_Act_Craft_Thing";}] call RRPClient_system_newProgressBar;
  if (isNil "_complete") throw "Действие прервано";
  if !(_complete) throw 'Действие прервано!';
	_bingo = floor(random 100);
	if (_bingo > 69) then {
		life_vehicles pushBack _boat;
		["extItem_lockpick"] call RRPClient_system_removeItemFromInventory;
		["SuccessTitleOnly",["Теперь у вас есть ключи от этой техники."]] call SmartClient_gui_toaster_addTemplateToast;
		if (player call getSide != "cop") then {
				[getPlayerUID player,"487"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
		};
	} else {
		["ErrorTitleAndText", ["Не удалось взломать!", "Попробуйте еще раз..."]] call SmartClient_gui_toaster_addTemplateToast;
		['badcracker',1] call RRPClient_ach_gateway;
	};

	_boat setVariable ["htw",nil,true];
	life_action_inUse = false;
	[50,"взлом лодки"] call addXP;
} catch {
	if ((_boat getVariable ["htw","-1"]) isEqualTo getPlayerUID player) then {_boat setVariable ["htw",nil,true]};
	life_action_inUse = false;
	["ErrorTitleAndText", ["Действие прервано!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
