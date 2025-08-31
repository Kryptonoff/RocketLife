/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/

private ["_unit","_return"];
_unit = param [0,ObjNull,[ObjNull,[]]];
_return = [false, false];
{
	if (_unit inArea (_x # 0)) exitWith {
		_return = [if ((_x # 2) isEqualTo "default") then {true} else {false}, if ((_x # 2) isEqualTo "full") then {true} else {false}];
	};
} forEach (getArray(missionConfigFile >> "LifeCfgSettings" >> worldName >> "life_sz"));

_return
