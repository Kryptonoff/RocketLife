/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
private _list = param [0,controlNull,[controlNull]];
if (isNull _list) exitWith {};

private ["_value","_icon","_itemInfo"];
{
	_value = ITEM_VALUE(configName _x);
	if (_value > 0) then {
		_list lbAdd format ["%1 x %2",_value,(getText(_x >> "displayName"))];
		_list lbSetData [(lbSize _list)-1,configName _x];
		_icon = getText (_x >> "icon");
		if !(EQUAL(_icon,"")) then {
			_list lbSetPicture [(lbSize _list)-1,_icon];
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

private _playerItems = call RRPClient_util_getplayeritems;
{
	_itemInfo = [_x select 0] call RRPClient_util_itemDetails;
	if (!(EQUAL(_itemInfo,[])) && {ITEM_INVCANSELL(_x select 0) isEqualTo 1}) then {
		if (_x select 1 > 1) then {
			_list lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		} else {
			_list lbAdd format["%1",_itemInfo select 1];
		};
		_list lbSetData[(lbSize _list)-1,_itemInfo select 0];
		_list lbSetPicture[(lbSize _list)-1,_itemInfo select 2];
	};
} forEach _playerItems;