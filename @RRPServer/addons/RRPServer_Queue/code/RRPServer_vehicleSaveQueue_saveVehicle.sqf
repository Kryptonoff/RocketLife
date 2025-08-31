/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_vehicle","_db","_gear","_query","_trunk","_availableHitpoints","_vehicleHitpoints"];
_vehicle = _this;
_db = _vehicle getVariable ["RRPDatabaseID",-1];
if !(_db isEqualTo -1) then
{
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
	_data =	[
		_gear,
		_trunk,
		fuel _vehicle,
		damage _vehicle,
		_vehicleHitpoints,
		(_vehicle getVariable ["allDistance",0]),
		_db
	];
	_query = ["updateVehicles",_data] call RRPServer_DB_createMessage;
	_query call RRPServer_DB_fireAndForget;
	format ["Vehicle: %1 ID: %2 Saved #0101",typeOf _vehicle,_db] call RRPServer_util_debugConsole;
}else{
	format ["Vehicle: %1 ID: %2 Not Saved: DB must be != -1 #0101",typeOf _vehicle,_db] call RRPServer_util_debugConsole;
};
true
