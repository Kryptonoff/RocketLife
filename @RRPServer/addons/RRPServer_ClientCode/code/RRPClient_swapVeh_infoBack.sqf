_unit = param [0,objNull,[objNull]];
_vehicle = param [1,objNull,[objNull]];
_price = param [2,0,[0]];
_vid = param [3,0,[0]];

_uid = getPlayerUID _unit;
_name = _unit call getFullName;

[[player,"atm","add",_price],"system_moneyChange"] call RRPClient_system_hcExec;

life_vehicles = life_vehicles - [_vehicle];

_vehicle setVariable ["vehicle_info_owners",[[_uid,_name]],true];
_vInfo = _vehicle getVariable ["dbInfo",[]];
_vehicle setVariable ["dbInfo",[_uid,(_vInfo select 1)],true];

[_vehicle,_vInfo,player,_unit,_price] remoteExecCall ["RRPServer_garage_swapVehicle",2];
[format ["Вы передали ключи от %1 %2.",getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName"),_name]] call hints;
