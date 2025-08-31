/*
	Filename: 	fn_updateHouseContainers.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/
params [
    ["_box",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

if (isNull _box OR isNull _unit) exitWith {};

private _House = _box getVariable ["house_box_inHouse",objNull];
if (isNull _House) exitWith {}; //Dafuq?
private _invData = _box getVariable ["inventory",[[],0]];
private _trunkData = _box getVariable ["Trunk",[[],0]];
private _unitUid = getPlayerUID _unit;
private _id = owner _unit;
private _housePos = getPosATL _house;
private _houseClass = typeOf _house;

format ["updateHouseContainers:%1:%2:%3:%4",_housePos,_houseClass,_invData,_trunkData] call RRPServer_DB_fireAndForget;

diag_log format ["Filename:updateHouseContainers.sqf: %1 %2 %3 %4 %5",_housePos,_houseClass,_unitUid,_invData,_trunkData];
