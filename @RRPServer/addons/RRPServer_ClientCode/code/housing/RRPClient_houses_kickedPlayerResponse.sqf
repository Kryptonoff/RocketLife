/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

private _house = _this;
_netIDHouse = netId _house;
private _markerID = round ((getPosATL _house) select 0);
deleteMarkerLocal format["house_%1",_markerID];

_index = life_vehicles find _house;
if(_index != -1) then 
{
	life_vehicles set [_index,-1];
	life_vehicles = life_vehicles - [-1];
};

{
	if ((_x select 0) isEqualTo ([_house] call RRPClient_system_getHousePos)) then 
	{
		life_houses set[_forEachIndex,-1];	
	};
} forEach life_houses;

{
	if (_x isEqualTo _netIDHouse) then 
	{
		life_netID_Houses set [_forEachIndex,""];	
	};
} forEach life_netID_Houses;

life_houses = life_houses - [-1];
life_houses_count = life_houses_count - 1;
