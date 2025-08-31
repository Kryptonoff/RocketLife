/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPServer_system_prepareToRestart};

_time = systemTime;
private _savePlayers = {
	private _timestamp = diag_tickTime;
	private _p = 0;
	{
		_p = _p + 1;
		format ["#kick %1",getPlayerUID _x] call RRPServer_DB_sendRconCommand;
		waitUntil {diag_fps > 3};
	}forEach (allPlayers - (entities 'HeadlessClient_F'));
	
	_t = diag_tickTime - _timestamp;
	format ["Сохранение игроков завершено за %1 секунд, игроков сохранено %2",_t,_p] call RRPServer_util_debugConsole;
	true
};

private _saveVehicles = {
	private ["_vehicle","_db","_gear","_query","_trunk","_asl"];
	private _timestamp = diag_tickTime;
	private _p = 0;
	{
		if !(_x getVariable ["RRPDatabaseID",-1] isEqualTo -1) then
		{
			_vehicle = _x;
			if (isClass(getMissionConfig "LifeCfgVehicles" >> typeOf _vehicle)) then
			{
				_db = _vehicle getVariable ["RRPDatabaseID",-1];
				_gear = [getItemCargo _vehicle,getMagazineCargo _vehicle,getWeaponCargo _vehicle,getBackpackCargo _vehicle];
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
				private _pos = getPosWorld _vehicle;
				if (_vehicle isKindOf "Car") then
				{
					private _asl = getPosASL _vehicle;
					if ((_asl select 2) < -1.5 and {surfaceIsWater _asl}) then
					{
						_trunk = [[],0];
						format ["vehicleParkingStore:[%1,""Спасена из водяного плена!""]:%2",(getNumber(configFile >> "CfgCleanup" >> "CleanupVehicle" >> "costForWaterPenny")),_db] call RRPServer_DB_fireAndForget;
					};
				};
				if !(_trunk isEqualTo [[],0]) then
				{
					if (_vehicle isKindOf "Car") then
					{
						_nGar = if (_vehicle call RRPClient_util_isInStratis) then 
						{
							getText(getMissionConfig "LifeCfgSettings" >> "CfgGaragesPublic" >> "stratisGarage");
						}else{
							_garages = getArray(getMissionConfig "LifeCfgSettings" >> "CfgGaragesPublic" >> "carsGarages");
							([_garages,[],{_pos distanceSqr (getMarkerPos _x)},"ASCEND"] call BIS_fnc_sortBy) select 0;
						};
						format ["setGarage:%1:%2",_nGar,_db] call RRPServer_DB_fireAndForget;
					};
				};
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
				deleteVehicle _vehicle;
				_p = _p + 1;
			};
		};
		waitUntil {diag_fps > 3};
	}forEach vehicles;
	_t = diag_tickTime - _timestamp;
	format ["Сохранение транспорта завершено за %1 секунд, транспорта сохранено %2",_t,_p] call RRPServer_util_debugConsole;
	true
};
"Вызываем сохранение игроков" call RRPServer_util_debugConsole;

"Вызываем сохранение техники" call RRPServer_util_debugConsole;
_v = [] spawn _saveVehicles;
waitUntil {scriptDone _v};
"Вызываем сохранение растений" call RRPServer_util_debugConsole;
_p = [] spawn {
	_plants = rrp_plants select {!(isNull _x)};
	{
		_growState = _x getVariable ["growState", []];
		_growState params ["_curState","_totalState","_curGrowKoef","_growUp","_isWatered","_isFertilized"];
		_growOwner = _x getVariable ["growOwner", ""];
		_plantClass = _x getVariable ["plantClass", ""];
		_position = getPosWorld _x;
		_classname = typeOf _x;
		
		format["insertPlant:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10", _classname, _position, _growOwner, _plantClass, _curState, _totalState, _curGrowKoef, _growUp, _isWatered, _isFertilized] call RRPServer_DB_fireAndForget;
	} forEach _plants;
};
waitUntil {scriptDone _p};
"Подготовка к рестарту завершена" call RRPServer_util_debugConsole;
