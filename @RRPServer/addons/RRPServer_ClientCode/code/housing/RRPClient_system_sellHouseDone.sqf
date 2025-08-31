/*
	
	Filename: 	RRPClient_system_sellHouseDone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_house","_price","_index","_house_box","_numOfDoors"];
_house = param [0,ObjNull,[ObjNull]];
_price = param [1,0,[0]];

if(isNull _house) exitWith {["Ошибка. Обратитесь к администратору."] call hints};

[_house,"locked"] call RRPClient_system_clearGlobalVar;
private _markerID = round ((getPosATL _house) select 0);
deleteMarkerLocal format["house_%1",_markerID];

_index = life_vehicles find _house;
if(_index != -1) then {
	life_vehicles set[_index,-1];
	life_vehicles = life_vehicles - [-1];
};
////houses.pos, houses.classname
{   
	if ((_x select 0) isEqualTo ([_house] call RRPClient_system_getHousePos)) then {
		life_houses set[_forEachIndex,-1];	
	};
} forEach life_houses;
life_houses = life_houses - [-1];
life_houses_count = life_houses_count - 1;
	
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house SVAR[format["bis_disabled_Door_%1",_i],0,true];
};

_house_box = _house GVAR ["house_box",objNull];
if (!isNull _house_box) then {
	deleteVehicle _house_box;
};
_netIDHouse = netID _house;
{
	if (_x isEqualTo _netIDHouse) then 
	{
		life_netID_Houses deleteAt _forEachIndex;	
	};
} forEach life_netID_Houses;

[_house,"house_owner"] call RRPClient_system_clearGlobalVar;
[_house,"house_owned"] call RRPClient_system_clearGlobalVar;
[_house,"house_sold"] call RRPClient_system_clearGlobalVar;

_house SVAR ["house_forSell",true,true];

[player,"atm","add",_price] remoteExecCall ["RRPServer_system_moneyChange",2];

_log = format ["sellHouseDone: atm (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,[_price] call RRPClient_util_numberText];	
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
[format["Дом успешно продан за $%1!",[_price] call RRPClient_util_numberText]] call hints;
RRPClientWaitHouseSellResponse = false;