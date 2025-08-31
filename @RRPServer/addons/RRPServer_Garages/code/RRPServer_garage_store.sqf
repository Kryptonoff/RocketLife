/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo","_saveItems","_storetext","_resourceItems","_fuel","_damage","_itemList","_totalweight","_weight","_thread","_save_vehicle_inventory"];
params
[
	["_vehicle",objNull,[objNull]],
	["_impound",false,[true]],
	["_sp","none",[""]]
];
try
{
	
	_unit = remoteExecutedOwner call RRPServer_util_get_RE_player;
	if (isNull _unit) throw "Вы не существуете";

	if (isNull _vehicle) throw "Техники не существует";
	_db = _vehicle getVariable ["RRPDatabaseID",-1];
	_vInfo = _vehicle getVariable ["dbInfo",[]];
	if !(_impound) then
	{
		if (_db isEqualTo -1) throw "ID Техники отсутствует в базе данных. Сохранение невозможно!";
		if (_vInfo isEqualTo []) throw "Автомобиль взят в аренду и не может быть поставлен в гараж";
		if !(_vInfo#0 isEqualTo getPlayerUID _unit) throw "Этот автомобиль не принадлежит вам поэтому не может быть убран в гараж";
	};
	_gear = if (getNumber(configFile >> "CfgCleanup" >> "CleanupVehicle" >> "savePhysInventory") isEqualTo 1) then {[getItemCargo _vehicle,getMagazineCargo _vehicle,getWeaponCargo _vehicle,getBackpackCargo _vehicle]}else{[]};
	_availableHitpoints = getAllHitPointsDamage _vehicle;
	_vehicleHitpoints = [];
	if !(_availableHitpoints isEqualTo [])then
	{
		{
			_vehicleHitpoints pushBack [_x ,_vehicle getHitPointDamage _x];
		}
		forEach (_availableHitpoints select 0);
	};
	_trunk = _vehicle getVariable ["Trunk", [[],0]];
	_sp = if !(_trunk isEqualTo [[],0]) then {_sp}else{"none"}; 
	_fuel = fuel _vehicle;
	_damage = damage _vehicle;
	_distance = _vehicle getVariable ["allDistance",0];
	if (_impound) then
	{
		if (_vInfo isEqualTo []) then
		{
			if (!isNil "_vehicle" && {!isNull _vehicle}) then 
			{
                _vehicle call RRPServer_vehicleSaveQueue_removeVehicle;
				deleteVehicle _vehicle;
				[[],{	
					life_action_inUse = false;
					life_interrupted = true;
				}] remoteExecCall ["call",remoteExecutedOwner];
				throw "Транспорт был арендован";
			};
		} else {
			_query = ["garageVehicleStore",[
				_sp,
				_gear,
				_trunk,
				_fuel,
				_damage,
				_vehicleHitpoints,
				_distance,
				_db
			]] call RRPServer_DB_createMessage;
			_query call RRPServer_DB_fireAndForget;

			if (!isNil "_vehicle" && {!isNull _vehicle}) then 
			{
                _vehicle call RRPServer_vehicleSaveQueue_removeVehicle;
				deleteVehicle _vehicle;
			};
			[[],{	
				life_action_inUse = false;
				life_interrupted = true;
			}] remoteExecCall ["call",remoteExecutedOwner];
			throw "Техника конфискована!";
		};
	};
    _query = ["garageVehicleStore",[
        _sp,
        _gear,
        _trunk,
        _fuel,
        _damage,
        _vehicleHitpoints,
        _distance,
        _db
    ]] call RRPServer_DB_createMessage;
    _query call RRPServer_DB_fireAndForget;
	if (!isNil "_vehicle" && {!isNull _vehicle}) then 
	{
        _vehicle call RRPServer_vehicleSaveQueue_removeVehicle;
		deleteVehicle _vehicle;
	};
	["store","Ваша техника успешно сохранена!"] remoteExecCall ["RRPClient_garage_responseServer",remoteExecutedOwner];
}catch{
	["store",_exception] remoteExecCall ["RRPClient_garage_responseServer",remoteExecutedOwner];
};

true
