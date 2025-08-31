/*

	Filename: 	client_anomaly_suckToLocation.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

	Description:
       засасывает заданный объект чуть выше заданной позиции

    Parameter:
        _obj - Объект, который собирается быть засосанным
        _pos - заданная позиция
        _intensity - Force Multiplier (по умолчанию: 1)
        _duration - длительность эффекта (по умолчанию: 10)

*/
#include "..\..\macros.hpp"
params["_obj","_pos",["_intensity",1], ["_duration", 10]];

_time = diag_tickTime + _duration;

[{
    params ["_obj","_pos","_intensity","_time"];

	_pos2 = getpos _obj;
	_a = ((_pos select 0) - (_pos2 select 0));
	_b = ((_pos select 1) - (_pos2 select 1));
	_obj setVelocity [_a * _intensity, _b * _intensity, 0.2];

	!(alive _obj) OR diag_tickTime >= _time
},{},[_obj,_pos,_intensity,_time]] call CBA_fnc_waitUntilAndExecute;
