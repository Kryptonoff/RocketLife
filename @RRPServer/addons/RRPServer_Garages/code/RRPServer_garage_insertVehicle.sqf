/*
    File: fn_insertVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the vehicle into the database
*/
// 

private ["_query","_sql"];
params [
    "_uid",
    "_type",
    "_className",
    ["_color","default",[""]],
    ["_plate","",[""]],
	["_basePrice",0,[0]],
    ["_material","default",[""]],
	["_vehicle",objNull,[objNull]],
	["_active",1]
];
_exit = false;
if (isRemoteExecuted) then
{
	_array = allPlayers select {getPlayerUID _x isEqualTo _uid};
	if !(_array isEqualTo []) then
	{
		_player = _array select 0;
		if !(remoteExecutedOwner isEqualTo (owner _player)) exitWith
		{
			["Spawn vehicles"] remoteExecCall ["RRPClient_system_c834y9wq",remoteExecutedOwner];
			_exit = true;
		};
	}else{
		["Spawn vehicles"] remoteExecCall ["RRPClient_system_c834y9wq",remoteExecutedOwner];
		_exit = true;
	};
};

if (_uid isEqualTo "" || {_type isEqualTo ""} || {_className isEqualTo ""} || {_color isEqualTo ""} || {_plate isEqualTo -1} || {_material isEqualTo ""} || {_exit}) exitWith
{
    diag_log "--------------Error in InsertVehicle-----------";
    diag_log [_uid,_type,_className,_material,_plate,_basePrice,_material];
    diag_log "--------------Error in InsertVehicle-----------";
};

_query = format ["insertVehicle:%1:%2:%3:%4:%5:%6:%7:%8:%9",
	_className,
	_type,
	_uid,
	_active,
	_color,
	_plate,
	_basePrice,
	_material, 
	getNumber(getMissionConfig "LifeCfgVehicles" >> _className >> "vItemSpace")
] call RRPServer_DB_insertSingle;

if !(isNull _vehicle) then {_vehicle setVariable ["RRPDatabaseID",_query,true]};
