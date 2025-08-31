/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/

private["_item","_diff","_curAmount","_time","_defaultTime","_complete","_zone","_posATL","_resourceCfg","_curConfig","_resource","_maxAmount","_zoneSize","_resourceZones","_profName","_side"];

try {
	if (life_action_inUse) throw "Вы заняты";
	if ((vehicle player) != player) throw "Выйдите из транспорта";
	if (player getVariable ["restrained",false]) throw "Ваши руки связаны";

	life_action_inUse = true;
	life_interrupted = false;

	_posASLW = getPosASLW player;
	_posATL = getPosATL player;
	_defaultTime = 5;
	_zone = "";
	_side = [];
	_resourceCfg = missionConfigFile >> "CfgClams" >> "Resources";

	for "_i" from 0 to count(_resourceCfg)-1 do {
		_curConfig 			= _resourceCfg select _i;
		_resource 			= configName _curConfig;
		_maxAmount 			= getNumber(_curConfig >> "amount");
		_zoneSize 			= getNumber(_curConfig >> "zoneSize");
		_resourceZones 		= getArray(_curConfig >> "zones");
		_profName 			= getText(_curConfig >> "profName");
		_side 				= getArray(_curConfig >> "side");
		_item 				= getText(_curConfig >> "item");

		{
			if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
		} forEach _resourceZones;
		if (_zone != "") exitWith {};
	};

	while {true} do {
		if !((player call getSide) in _side) throw "Для вашей фракции этот вид фарма недоступен!";
		if (_zone isEqualTo "") throw "Зона не определена";

		if !(surfaceIsWater position player) throw "Для поиска моллюсков вам нужно зайти в воду и отплыть от берега! Морские гребешки водятся под водой!";
		if !((_posATL select 2) < 0.6) throw "Вы должны быть ближе ко дну!";


		_time = _defaultTime;
		(_profName call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl"];
		_time = ([_maxLvl,_curLvl,_defaultTime] call RRPClient_util_countSavingTime);

		_complete = [
		"Добываем морские гребешки...",
		{
			(speed player < 20) AND
			{((player getVariable ["lifeState",""]) isEqualTo "HEALTHY")} AND
			{(alive player)}
		},
		true,
		_time * RRPClientBuffs_CoefFarmTime,
		false,
		true,
		{player playMove "CL3_anim_GatheringIn1";}
		] call RRPClient_system_newProgressBar;

		if (isNil "_complete") throw "Действие прервано";
		if !(_complete)  throw 'Действие прервано';

		_curAmount = switch (call life_donator) do {
		    case (4): {2};
			case (5): {3};
			default {1}
		};

		_diff = [_item,_curAmount,life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;
		if (_diff < 1) throw "Недостаточно места в инвентаре!";

		if ([true,_item,_diff] call RRPClient_system_handleInv) then {
			[[[_item,_curAmount]],"virtual"] call RRPClient_farm_util_notificationADDitems;
			_xp = [5,_curLvl,_profName] call RRPClient_farm_util_countAmountXP;
			[_profName, _xp] call RRPClient_skills_addXP;
			[5, "добычу"] call addXP;
		};
	};

	player switchMove "";
	life_action_inUse = false;
	life_interrupted = true;
} catch {

	player switchMove "";
	life_action_inUse = false;
	life_interrupted = true;
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
