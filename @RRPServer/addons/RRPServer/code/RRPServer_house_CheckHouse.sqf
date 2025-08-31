/*
	Filename: 	fn_checkHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Check House owned.
*/
params [
    ["_house",objNull,[objNull]],
    ["_unit",objNull,[objNull]]
];
if (isNull _house || isNull _unit) exitWith {};

private _id = owner _unit;
private _housePos = getPosATL _house;
private _houseClass = typeOf _house;

private _queryResult = format ["checkHouse:%1:%2",_housePos,_houseClass] call RRPServer_DB_selectSingleField;
if(isNil "_queryResult") then {_queryResult = "";};

if !(_queryResult isEqualTo "") exitWith
{
    _house setVariable ["house_owned",true,true];
    [_house,"Этот дом уже находится в собственности!"] remoteExecCall ["RRPClient_system_houseMenu",_id];
};

[_house,_housePos] remoteExecCall ["RRPClient_system_buyHouseDone",_id];