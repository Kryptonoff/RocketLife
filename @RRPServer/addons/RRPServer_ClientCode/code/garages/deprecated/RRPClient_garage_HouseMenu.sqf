/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params [
	["_house",ObjNull,[ObjNull]],
	["_type","",[""]]
];

if (isNull _house) exitWith {};
if (isNull (player call RRPClient_util_getBuildingInside)) exitWith {["Вы должны находится внутри гаража!","error"] call hints};
if !((player call RRPClient_util_getBuildingInside) isEqualTo _house) exitWith {["Вы должны находится внутри гаража!","error"] call hints};


private _garageSpawnPos = getArray (getMissionConfig "LifeCfgHousing" >> worldName >> typeOf _house >> "garageSpawnPos");
private _garageSpawnDir = getNumber(getMissionConfig "LifeCfgHousing" >> worldName >> typeOf _house >> "garageSpawnDir");;

["request",_type,[(_house modelToWorld _garageSpawnPos),(getDir _house)-_garageSpawnDir],true] call RRPClient_garage_actions;
