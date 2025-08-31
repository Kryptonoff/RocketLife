#include "..\..\script_macros.hpp"
private _shop = param [0,objNull,[objNull]];
if (isNull _shop) exitWith {false};
if (isNil {_shop GVAR "shop_inUseBy"}) exitWith {false};
private _ret = false;
private _usedByPID = _shop GVAR ["shop_inUseBy",""];

if !(EQUAL(_usedByPID,"")) then {
	if (!(EQUAL(_usedByPID,steamid)) && {[_usedByPID] call RRPClient_system_isUIDActive}) then {_ret = true};
};

_ret;