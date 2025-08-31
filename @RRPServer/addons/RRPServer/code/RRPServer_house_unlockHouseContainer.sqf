/*
    Description:
    Update inventory "y" in container
	
	_house,_housePos,_houseClass,houses.trunk, houses.inventory, houses.slots
	
*/

params ["_house","_unit"];

if (isNull _house OR isNull _unit) exitWith {};

private _owner = owner _unit;
private _id = _house getVariable ["house_id",-1];
if (_id isEqualTo -1) exitWith {"ERROR fn_unlockHouseContainer: house_id -1 #1001" call RRPServer_util_debugConsole};

private _housePos = getPosATL _house;
private _houseClass = typeOf _house;

_containers = format ["unlockHouseContainer:%1",_id] call RRPServer_DB_selectSingle;
if (isNil "_containers") exitWith {format ["ERROR fn_unlockHouseContainer:_containers = %1 #1001",_containers] call RRPServer_util_debugConsole};
format ["setStatusContainer:1:%1",_id] call RRPServer_DB_fireAndForget;
[_containers select 0,_containers select 1,_containers select 2,_house,_housePos,_houseClass] remoteExecCall ["RRPClient_system_houseContainer",_owner];
format ["OK fn_unlockHouseContainer:_containers = %1 #0101",[_containers select 0,_containers select 1,_containers select 2,_house,_housePos,_houseClass]] call RRPServer_util_debugConsole;
