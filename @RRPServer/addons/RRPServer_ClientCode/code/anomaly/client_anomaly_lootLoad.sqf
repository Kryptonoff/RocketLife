/*

    Filename: 	client_anomaly_lootLoad.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
private _houseTemp = param [0,[],[[]]];
if (_houseTemp isEqualTo []) exitWith {life_anomalyHouseArray = []};

//Удаляем старые контейнеры
private _tmpArray = life_anomalyHouseArray;
if (anomalyDebug) then {diag_log format["Anomaly:Loot life_anomalyHouseArray до count %1",count life_anomalyHouseArray]};
private _houseRemove = _tmpArray - _houseTemp;

if !(_houseRemove isEqualTo []) then {
	{
	    [_x] call client_anomaly_lootDelete;
	} forEach _houseRemove;
};

life_anomalyHouseArray = _tmpArray - _houseRemove;

//Добавляем новые контейнеры
{
	if ((_x GVAR ["house_cooldown", serverTime]) <= serverTime) then {
		if !(_x in life_anomalyHouseArray) then {
			life_anomalyHouseArray pushBackUnique _x;
			[_x] spawn client_anomaly_lootCreate;
		};
	};
} forEach _houseTemp;
