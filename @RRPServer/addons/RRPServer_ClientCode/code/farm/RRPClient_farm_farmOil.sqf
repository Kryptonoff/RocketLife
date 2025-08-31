/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/
private["_profName","_prof","_item", "_defaultTime","_complete","_time","_curlvl","_maxLVL","_profName","_itemName","_model","_object","_amount","_posPlayerATL"];
try {
	if (life_action_inUse) throw "Вы уже выполняеете действие!";
	if ((vehicle player) != player) throw "";
	if (player getVariable ["restrained",false]) throw "У вас связаны руки!";
	if (player getVariable ["surrender",false]) throw "";
	if (!isNull life_DraggedBody) throw "Вы кого-то несете. Положите его сперва на землю";


	private _zone = "";
  {
    {
      if ((player distance (getMarkerPos (_x select 0))) < (_x select 1)) exitWith {_zone = (_x select 0)};
    } forEach (getArray(_x >> 'zones'));

    if !(_zone isEqualTo "") Exitwith {
      	_profName = (getText(_x >> 'prof'));
      	_item = (getText(_x >> 'item'));
      	_amount = (getNumber(_x >> 'amount'));
		_defaultTime = (getNumber(_x >> 'defaultTime'));
    };
  } forEach ('true' configClasses (missionConfigFile >> 'RRPConfig_oilPumping'));
  if (_zone isEqualTo "") throw "Вы находитесь не в зоне добычи!";

	_prof   = missionNamespace getVariable [_profName,[]];
	_curlvl = _prof select 0;
	_maxLVL = getNumber(missionConfigFile >> "CfgSkills" >> _profName >> "maxLevel");

	private _timeXP   = [_maxLVL,_curlvl,_DefaultTime] call RRPClient_util_countSavingTime;
	_time   = _timeXP;
	if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
		systemChat format ["default:%1 | +XP:%2 | +VIP:%3 | Max-lvl:%4 | current-lvl:%5",_defaultTime,_timeXP,_time,_maxLVL,_curlvl];
		_time = 5;
	};
	if (life_turbo_used) then {_time = _time * 0.85};

	life_action_inUse = false;
	_complete = [
		format ["Добываем %1",(getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],
		{(speed player < 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player) and !((vehicle player) != player) and !(player getVariable ["restrained",false])},
		true,
		_time,
		false,
		true,
		{}
	] call RRPClient_system_newProgressBar;
	if (isNil "_complete") throw "Действие прервано";
	if !(_complete)  throw 'Действие прервано';


	_itemName = getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName");
	_model = getText(missionConfigFile >> "VirtualItems" >> _item >> "model");
	_object = _model createVehicleLocal [0,0,0];
	_posPlayerATL = getPosATL player;

	life_local_oil_objects pushBack _object;
	if (count life_local_oil_objects >= 10) then {
		deleteVehicle	(life_local_oil_objects deleteAt 0);
		["ErrorTitleAndText", ["Бочки переполнены", "Нельзя что-бы было более 10 бочек одновременно!"]] call SmartClient_gui_toaster_addTemplateToast;
	};

	_object setPosATL [_posPlayerATL # 0, (_posPlayerATL # 1) + 2, (_posPlayerATL # 2) + 0.1];

	[_object,"info",[_item,_itemName,_amount,_profName]] call CBA_fnc_setVarNet;
	private ["_target","_resource","_amountResource","_diff","_addExpAmount","_data"];
	[
		_object,
		"Подобрать бочку",
		"",
		"",
		"!(call RRPClient_system_isInterrupted) AND !(life_action_inUse)",
		"(alive player) OR !(life_action_inUse) OR (_caller distance _target < 3) OR !(call RRPClient_system_isInterrupted)",
		{
		_data = _target getVariable ["info",objNull];
		_itemName = _data # 1;
		},
		{},
		{
			_data = _target getVariable ["info",objNull];
			_resource = _data # 0;
			_itemName = _data # 1;
			_amountResource = _data # 2;
			_profName = _data # 3;
			_diff = [_resource,_amountResource,life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;
			_addExpAmount = [_profName,3,_diff] call RRPClient_farm_countAddExp;
			if (_diff isEqualTo 0) then {
				["ErrorTitleAndText", ["Ошибка!", "Не достаточно места в инвентаре!"]] call SmartClient_gui_toaster_addTemplateToast;
			} else {
				if ([true,_resource,_diff] call RRPClient_system_handleInv) then {
					life_local_oil_objects = life_local_oil_objects - [_target];
					deleteVehicle _target;
					["SuccessTitleAndText", ["Успех!", format ["Вы добыли: %1",(_itemName)]]] call SmartClient_gui_toaster_addTemplateToast;
					if (player call getSide in ["civ","reb"]) then {
						[_profName,_addExpAmount] call RRPClient_skills_addXP;
					};
				};
			};
		},
		{},
		[],
		2,
		1,
		false,
		false
	] call RRPClient_holdAction_Add;

} catch {
	life_action_inUse = false;
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
