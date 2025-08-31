/*
    Project: Credit System
	License: CC BY-ND
	Author: FairyTale5571
*/

#include "..\..\script_macros.hpp"
private _houses = param [0,[],[[]]];
if (EQUAL(_houses,[])) exitWith {"У вас нет недвижимости" call chat};

"Загрузка недвижимости..." call chat;

//_wait = round(random(8));
//uiSleep _wait;
//houses.pos, houses.classname, houses.servermap

life_houses_count = count _houses;
{
	if (EQUAL((_x select 2),worldName)) then 
	{
		life_houses pushBack [_x select 0,_x select 1];
	};
} forEach _houses;

private["_house","_houseName","_numOfDoors","_marker","_markerID"];
{	
	_house = nearestObject [_x select 0,_x select 1];
	if !(isNull _house) then 
	{
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_house SVAR ["locked",true,true];
		[_house,"house_forSell"] call RRPClient_system_clearGlobalVar;
		
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house animate [format["door_%1_rot",_i],0];
			_house SVAR [format["bis_disabled_Door_%1",_i],1,true];		
		};
		
		_dateText = [(_house getVariable ["HouseMaintanceDate",[0,0,0,0,0,0]])] call RRPClient_util_dateToString;
		_nameHouse = _house getVariable ["house_name",""];
		_markerID = round ((_x select 0) select 0);
		_marker = createMarkerLocal [format["house_%1",_markerID],_x select 0];
		_marker setMarkerTextLocal format["%1 | до: %2",_nameHouse,_dateText];
		
		if (_house getVariable ["PayTimeDude",false]) then
		{
			_marker setMarkerColorLocal "ColorRed";
			["Какой-то из Ваших домов требует оплату коммунальных услуг!"] call hints;
		}else{
			// _marker setMarkerColorLocal "ColorBlue";
		};
		_marker setMarkerTypeLocal "welmen_other_home";
		life_vehicles pushBack _house;
		
		life_netID_Houses pushBack (netID _house);
	}else{
		[format["(%1)<br/>Проблема с домом. Сообщите об этом администрации!",_x]] call hints;
	};
	
} forEach life_houses;

format ["Загрузка недвижимости на острове %1 завершена. Объектов во владении: %2 (В сумме: %3)",worldName,count life_houses,life_houses_count] call chat;