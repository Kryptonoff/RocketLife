#include "..\..\script_macros.hpp"
params [["_playerUID","",[""]]];
if (_playerUID isEqualTo "") exitWith {false};
private _isFriends = false;
{
    if ((_x select 1) isEqualTo _playerUID) exitWith {
	    _isFriends = true;
	};
} forEach RRPClientTGFriends;

_isFriends