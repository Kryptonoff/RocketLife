/*
	Filename: 	RRPClient_system_vehTakeItem.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\..\script_macros.hpp"
try{
	private["_ctrl","_num","_index","_data","_old","_value","_diff","_storeall","_vehTotalWeight"];
	_storeall = param [0,false,[true]];
	disableSerialization;
	if (isNull life_trunk_vehicle OR !alive life_trunk_vehicle) throw "Транспортного средства не существует.";
	if (LSNOTALIVE(player)) exitwith {closeDialog 0;};

	if (EQUAL((lbCurSel 3502),-1)) throw "Вы ничего не выбрали";
	_ctrl = CONTROL_DATA(3502);
	_num = ctrlText 3505;
	if (!([_num] call RRPClient_system_isnumber)) throw "Неверный формат номера";
	_num = parseNumber(_num);
	if(_num < 1) throw "Вы не можете ввести значение ниже 1!";

	_index = [_ctrl,((life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0)] call RRPClient_system_index;
	_data = (life_trunk_vehicle GVAR ["Trunk",[[],0]]) select 0;
	_old = life_trunk_vehicle GVAR ["Trunk",[[],0]];
	if (EQUAL(_index,-1)) exitWith {};
	_value = _data select _index select 1;
	if (_num > _value) throw "В автомобиле нет такого количества предметов.";
	if (_storeall) then {_num = _value};
	_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;
	if (EQUAL(_num,0)) throw "Ваш инвентарь переполнен.";
	if (EQUAL(_ctrl,"money") OR EQUAL(_ctrl,"dmoney")) then {
		if (EQUAL(_num,_value)) then {
			_data set[_index,-1];
			_data = _data - [-1];
		} else {
			_data set[_index,[_ctrl,(_value - _num)]];
		};

		if (EQUAL(_ctrl,"money")) then {
			[[player,"cash","add",_num],"system_moneyChange"] call RRPClient_system_hcExec;
			_log = format ["vehTakeItem: cash (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_num];	
			["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];

		} else {
			if (player call getSide in ["cop","med"]) then {
				[[player,"cash","add",_num],"system_moneyChange"] call RRPClient_system_hcExec;
				_log = format ["vehTakeItem: cash (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_num];	
				["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
			} else {
				[[player,"cash","add",_num],"system_moneyChange"] call RRPClient_system_hcExec;
				_log = format ["vehTakeItem: dcash (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_num];	
				["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
			};
		};
		
		_vehTotalWeight = 0;
		{
			_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
			_vehTotalWeight = _vehTotalWeight + _itemWeight;	  
		} forEach _data;
		
		[life_trunk_vehicle,"Trunk",[_data,_vehTotalWeight]] call CBA_fnc_setVarNet;
		[life_trunk_vehicle] call RRPClient_system_vehInventory;
	} else {
		if ([true,_ctrl,_num] call RRPClient_system_handleInv) then {
			if(EQUAL(_num,_value)) then {
				_data set[_index,-1];
				_data = _data - [-1];
			} else {
				_data set[_index,[_ctrl,(_value - _num)]];
			};

			_vehTotalWeight = 0;
			{
				_itemWeight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
				_vehTotalWeight = _vehTotalWeight + _itemWeight;
			} forEach _data;

			[life_trunk_vehicle,"Trunk",[_data,_vehTotalWeight]] call CBA_fnc_setVarNet;
			[life_trunk_vehicle] call RRPClient_system_vehInventory;
		} else {
			throw "Ваш инвентарь переполнен.";
		};
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};