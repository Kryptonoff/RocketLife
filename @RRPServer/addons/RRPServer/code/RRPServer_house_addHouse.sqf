/*
	Filename: 	fn_addHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Inserts the players newly bought house in the database.
*/
params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]],
	["_unit",objNull,[objNull]],
	["_name","",[""]]
];

if (isNull _house || _uid isEqualTo "" || isNull _unit) exitWith {};

private _housePos = getPosATL _house;
private _houseClass = typeOf _house;
_houseID = format ["insertHouse:%1:%2:%3:%4:%5:%6",_uid,_housePos,_houseClass,WorldName,_name,[_uid]] call RRPServer_DB_insertSingle;
_house setVariable ["house_id",_houseID,true];
_house setVariable ["house_name",_name,true];
_house setVariable ["Neighs",[_uid],true];
_day = ["Day",30] call RRPServer_util_addDate;
_house setVariable ["HouseMaintanceDate",_day,true];
