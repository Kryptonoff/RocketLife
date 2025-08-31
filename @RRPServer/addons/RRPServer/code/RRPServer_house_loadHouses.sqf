/**
	File: RRPServer_house_loadHouses
	Project: Aurora Role Play
	Author: FairyTale
*/

private _query = format ["getHouseFromID:%1",_this] call RRPServer_DB_selectSingle;
// format ["getHouseFromID - %1",_query] call RRPServer_util_log;
if (isNil "_query") exitWith {true};
_query params ["_id","_owner","_className",["_pos",[],[[]]],"_nameOwner","_neigh","_datePay","_name","_payTime","_security","_slots"];

private _house = nearestObject [_pos, _className];
if !(getPosATL _house isEqualTo _pos) then 
{
	format ["updateHousePos:%1:%2",getPosATL _house,_this] call RRPServer_DB_fireAndForget;
	format ["Позиция в БД %1 в мире %2 ID %3 дом в бд %4 : %5",_pos,getPosATL _house,_this,_className,typeof _house] call RRPServer_util_debugConsole;
};
_house setVariable ["house_owner",[_owner,_nameOwner],true];
_house setVariable ["house_id",_id,true];
_house setVariable ["house_name",_name,true];
_house setVariable ["locked",true,true];
_house setVariable ["house_owned",true,true];

if(_neigh isEqualTo []) then 
{
	_neigh pushBack _owner;
	format ["updateNeighsHouse:%1:%2", _neigh, _id] call RRPServer_DB_fireAndForget;
};

_house setVariable ["Neighs",_neigh,true];
_house setVariable ["LastPayTime",_datePay];
_house setVariable ["PayTimeDude",_payTime,true];
_house call RRPServer_house_setPayTime;
_house setVariable ["security",[_security] call RRPServer_util_tinyIntConverter,true];
_house setVariable ["house_slotss",_slots,true];
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> _className >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house animate [format["door_%1_rot",_i],0];
	_house setVariable [format["bis_disabled_Door_%1",_i],1,true];		
};
_house