/*
	Filename: 	fn_fetchPlayerHouses.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    1. Fetches all the players houses and sets them up.
    2. Fetches all the players containers and sets them up.
*/
params [
    ["_uid","",[""]]
];
if (_uid isEqualTo "") exitWith {};
private _houses = format ["fetchPlayerHouse:%3%1%3:%2",_uid, worldName,"%"] call RRPServer_DB_selectFull;

if(isNil "_houses") then {_house = [];};
private _return = [];
{
	_position = call compile format ["%1",_x select 0];
	private _house = nearestObject [_x select 0,_x select 1];
    _house allowDamage false;
    _return pushBack [_position,_x select 1,_x select 2];
} forEach _houses;

missionNamespace setVariable [format ["houses_%1",_uid],_return];