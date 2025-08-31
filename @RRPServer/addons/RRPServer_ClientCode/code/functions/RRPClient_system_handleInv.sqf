/*

	Filename: 	RRPClient_system_handleInv.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
	
*/
#include "..\..\script_macros.hpp"
params [["_math",false,[false]],["_item","",[""]],["_num",0,[0]]];
if (EQUAL(_item,"") OR EQUAL(_num,0)) exitWith {false};
private _var = ITEM_VARNAME(_item);
if (EQUAL(_var,"")) exitWith {false};
if (_math) then {
	private _diff = [_item,_num,life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;
	_num = _diff;
	if (_num <= 0) exitWith {false};
};
player setVariable ["plrTrunk",(player getVariable ["plrTrunk",[]]),true];
private _weight = (ITEM_WEIGHT(_item)) * _num;
private _value = ITEM_VALUE(_item);
private _return = false;
if (_math) then {
	//Lets add!
	if ((life_carryWeight + _weight) <= life_maxWeight) then {
		SVAR_MNS [_var,(_value + _num)];		
		
		if ((GVAR_MNS _var) > _value) then {
			life_carryWeight = life_carryWeight + _weight;
			_return = true;
			_yItem = player getVariable ["plrTrunk",[]];
			_find = [_yItem,_item] call RRPClient_util_find;
			if !(_find isEqualTo -1) then
			{
				// systemChat format ["handleInv %1",_find];
				_yItem set [_find,[_item,(_value + _num)]];
				player setVariable ["plrTrunk",_yItem,true];
				[netId player, "session_updatePlrTrunk"] call RRPClient_system_hcExec;
			}else{_yItem pushBack [_item,(_num)];};
		} else {
			_return = false;
		};
	} else {
		_return = false;
	};
} else {
	//Lets subtract!
	if ((_value - _num) < 0) then {
		_return = false;
	} else {
		SVAR_MNS [_var,(_value - _num)];
		if ((GVAR_MNS _var) < _value) then {
			life_carryWeight = life_carryWeight - _weight;
			_return = true;
			_yItem = player getVariable ["plrTrunk",[]];
			_find = [_yItem,_item] call RRPClient_util_find;
			if !(_find isEqualTo -1) then
			{
				// systemChat format ["handleInv %1",_find];
				if ((_value - _num) <= 0) then {_yItem deleteAt _find;}else{_yItem set [_find,[_item,(_value - _num)]];};
				player setVariable ["plrTrunk",_yItem,true];				
				[netId player, "session_updatePlrTrunk"] call RRPClient_system_hcExec;
			};
		} else {
			_return = false;
		};
	};
};

_return;