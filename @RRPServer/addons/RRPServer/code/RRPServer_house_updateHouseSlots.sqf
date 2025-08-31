/*
	Filename: 	RRPServer_house_updateHouseSlots
	Project: 	Rimas RP
*/

params [
    ["_house",objNull,[objNull]],
    ["_slots",0,[0]],
    ["_unit",objNull,[objNull]]
];
if (isNull _house || isNull _unit) exitWith {"updateHouseSlots - nulls" call RRPServer_util_log;};

private _id = owner _unit;
private _housePos = getPosATL _house;
private _houseClass = typeOf _house;
format ["updateHouseSlots:%1:%2:%3",_slots,_housePos,_houseClass] call RRPServer_DB_fireAndForget;
_house setVariable ["house_slotss",_slots,true];
[format ["Вы увеличили количество слотов до %1",_slots],"done"] remoteExecCall ["RRPClient_system_hint",_id];