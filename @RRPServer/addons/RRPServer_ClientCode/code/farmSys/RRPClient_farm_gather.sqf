/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

if !(canSuspend) exitWith {_this spawn RRPClient_farm_gather};
params [
    ["_vehicle",objNull, [objNull]],
	["_inCar",false,[false]]
];

try {
	if (life_action_inUse) throw "Вы уже выполняете какое-то действие!";
	if ((vehicle player) != player) throw "Вы не должны находится в технике";
	if (player getVariable ["restrained",false]) throw "У вас связаны руки";
	if (player getVariable ["surrender",false]) throw "3";
	if (player getVariable ["surrender",false]) throw "Нельзя добывать с поднятыми рукми";
    if (isNull _vehicle AND _inCar) throw "Техника неопределенна!";

	private ["_insufficientWeightBP","_insufficientWeightBPVehicle"];
	_insufficientWeightBP = "Недостаточно места в инвентаре!";
	_insufficientWeightBPVehicle = "Недостаточно места в технике!";

	private ["_amimation","_item","_defaultTime","_condition","_interactionOjb","_resourceCfg","_zone","_zone","_resource","_maxAmount","_zoneSize","_resourceZones","_requiredItem","_profName"];
	_resourceCfg = missionConfigFile >> "CfgFarm" >> "Resources";
	_zone = "";
	for "_i" from 0 to count(_resourceCfg)-1 do
	{

	    private _curConfig = _resourceCfg select _i;
        _zoneSize = getNumber(_curConfig >> "zoneSize");
        _resourceZones = getArray(_curConfig >> "zones");
	    {
	        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {
                _zone = _x;

                _resource = configName _curConfig;
                _requiredItem = getText(_curConfig >> "tool");
                _profName = getText(_curConfig >> "profName");
                _interactionOjb = getText(_curConfig >> "interactionObject");
                _condition = getText(_curConfig >> "condition");
                _defaultTime = getNumber(_curConfig >> "defaultTime");
                _item = getText(_curConfig >> "mined");
                _maxAmount = getNumber(_curConfig >> "maxAmount");
            };
	    } forEach _resourceZones;
	};

    if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
        systemChat format ["%1 %2 %3 %4",_resource,_profName,_requiredItem,_item];
    };

	if (_zone isEqualTo "") throw "Нужно находится в зоне добычи!";

    if (!(_interactionOjb isEqualTo "") AND !_inCar) then {
        if !((typeOF _vehicle) isEqualTo _interactionOjb) throw "Для начала добычи нужно навестить на объект!";
    };

	if !([_condition] call RRPClient_util_conditionsCheck) throw "4";

    if !(_requiredItem in ["treeSearch"]) then {
        if !(currentWeapon player isEqualTo _requiredItem) throw "У вас нет инструмента для добычи";
    };

	if _inCar then {
		private _weight = [_vehicle] call RRPClient_system_vehicleWeight;
		if (_weight # 1 >= _weight # 0) throw _insufficientWeightBPVehicle;
	} else {
		if (life_maxWeight - (getNumber(missionConfigFile >> "VirtualItems" >> _requiredItem >> "weight" )) <= life_carryWeight) throw _insufficientWeightBP;
	};

    if !(_inCar) then {
        private _resWeight = getNumber(missionConfigFile >> "VirtualItems" >> _item >> "weight");
        if (life_maxWeight <= life_carryWeight + _resWeight) throw _insufficientWeightBP;
    };

	private _amimation = switch (_requiredItem) do {
		case "Extremo_Tool_Shovel": 	{"FT_Act_Dig_Shovel_Loop"};
		case "Extremo_Tool_Axe": 		{"FT_Act_Axe_Swing"};
		case "Extremo_Tool_PickAxe": 	{"FT_Act_Dig_PickAxe_Loop_Full_3x"};
		case "Extremo_Tool_Hoe": 		{"FT_Act_Dig_PickAxe_Loop_Full_3x"};
		case "treeSearch" : 			{"apple_search"};
		case "": {
			format ["AG_anim_Gathering%1",[1,6] call BIS_fnc_randomInt]
		};
        default {
            "error"
        };
	};

    if (_amimation isEqualTo "error") throw "Ошибка в определении инструмента!";


	life_action_inUse = true;
	life_interrupted = false;
	if (_inCar) then {RRPClientMinerVehList pushBack _vehicle};

	while {true} do {
		if (_inCar) then {
			private _weight = [_vehicle] call RRPClient_system_vehicleWeight;
			if (_weight # 1 >= _weight # 0) throw _insufficientWeightBPVehicle;
		} else {
			if (life_maxWeight <= life_carryWeight) throw _insufficientWeightBP;
		};

		(_profName call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl"];

		private _time = ([_maxLvl,_curLvl,_defaultTime] call RRPClient_util_countSavingTime);

        if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
            systemChat format ["_maxLvl %1 | _curLvl %2 | _defaultTime  %3 | _time %4 | _profName %5",_maxLvl,_curLvl,_defaultTime,_time,_profName];
        };


        if (_requiredItem isEqualTo "treeSearch") then {
            [_amimation] call RRPClient_system_animDo
        } else {
            player playActionNow _amimation;
        };

		private  _complete = ["Добыча...",{!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player) AND (if (_requiredItem isEqualTo "") then {currentWeapon player isEqualTo _requiredItem} else {true})},false,_time * RRPClientBuffs_CoefFarmTime,false,true,{}] call RRPClient_system_newProgressBar;
        if (isNil "_complete") throw "Добыча прервана";
        if !(_complete) throw "Добыча прервана!";

		private _amount = [_maxAmount] call RRPClient_util_countAmountItems;
		if (_inCar) then {

            if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
                systemChat "В машину!";
            };

			private _success = [_vehicle,_item,_amount,true] call RRPClient_system_vehicleInv;
	        if !(_success) throw _insufficientWeightBPVehicle;
	        if (_success) then {
                _xp = [3,_curLvl,_profName] call RRPClient_farm_util_countAmountXP;
				[_profName, _xp] call RRPClient_skills_addXP;
				[3, "добычу"] call addXP;
	            [[[_item,_amount]],'virtual',0] call RRPClient_farm_util_notificationADDitems;
	        };
		} else {

            if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
                systemChat "В рюкзак!";
            };

			if !([true,_item,_amount] call RRPClient_system_handleInv) throw _insufficientWeightBP;
            _xp = [3,_curLvl,_profName] call RRPClient_farm_util_countAmountXP;
			[_profName, _xp] call RRPClient_skills_addXP;
			[3, "добычу"] call addXP;
            [[[_item,_amount]],'virtual',0] call RRPClient_farm_util_notificationADDitems;
		};
	};
	if (_inCar) then {RRPClientMinerVehList = RRPClientMinerVehList - [_vehicle]};
	player switchMove "stand";
    life_action_inUse = false;
    life_interrupted = true;
} catch {
	if (_inCar) then {RRPClientMinerVehList = RRPClientMinerVehList - [_vehicle]};
	life_action_inUse = false;
	life_interrupted = true;
	player switchMove "stand";
	[_exception] call hints
};
