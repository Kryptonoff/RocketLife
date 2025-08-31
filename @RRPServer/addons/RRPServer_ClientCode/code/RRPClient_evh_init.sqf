/*

	Filename: 	RRPClient_evh_init.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"

player addEventHandler ["WeaponAssembled", {
	params ["_unit","_uav"];
	_uav setVariable ["idUAV",format["#%1",call RRPClientPlayerID], true]

}];

// inGameUISetEventHandler ["Action", "_this call RRPClient_evh_onAction"]; 

player addEventHandler["Killed", {_this spawn RRPClient_evh_onPlayerKilled}];
player addEventHandler["HandleDamage",{_this call RRPClient_evh_damageHandle}];
player addEventHandler["Respawn", {_this call RRPClient_evh_onPlayerRespawn}];
player addEventHandler["Take",{_this call RRPClient_system_onTakeItem}];
player addEventHandler["Put",{_this call RRPClient_system_onPutItem}];
player addEventHandler["Fired",{_this call RRPClient_system_onFired}];
player addEventHandler["InventoryClosed", {_this call RRPClient_evh_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call RRPClient_evh_inventoryOpened}];
player addEventHandler["WeaponAssembled", {_this call RRPClient_system_WeaponAssembled}];

"mav_taxi_v_callQueue" addPublicVariableEventHandler {
	params ["_var", "_newValue"];

	if (count _newValue > (missionNamespace getVariable ["mav_taxi_v_callAmount", 0])) then {
		if (mav_taxi_v_isOnDuty) then {
			[["msgTaxiNewCallCreated"] call mav_taxi_fnc_getLocalization, false, "\rimas_gui\data\taxi\data\information-symbol.paa"] spawn mav_taxi_fnc_showLargeNotification;
		};
	};

	missionNamespace setVariable ["mav_taxi_v_callAmount", count _newValue];
};

addMissionEventHandler ["Map", {
	showMap !([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance < 200);
	showGPS !([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance < 200)
}];

call RRPClient_ach_events;
player addEventHandler ["SeatSwitchedMan", {
	params["_unit1", "_unit2", "_vehicle"];
	['switchseat', 1] call RRPClient_ach_gateway;
	[_vehicle] spawn RRPClient_evh_fuelConsumption;

	if ((driver _vehicle) isEqualTo _unit1) then {
		_vehicle removeAllEventHandlers "HandleDamage";
		_vehicle addEventHandler ["HandleDamage", RRPClient_system_HandlerDamVeh];
		_vehicle addEventHandler ["IncomingMissile", {
		_this call RRPClient_system_incomingMissile;
		}];
	} else {
		if (isNull (driver _vehicle))	then {
				_vehicle removeAllEventHandlers "HandleDamage";
				_vehicle removeAllEventHandlers "IncomingMissile";
			(netId _vehicle) remoteExecCall ["RRPClient_system_setOwner",2];
		};
	};

}];

["cameraView", {_this call RRPClient_evh_cameraView}] call CBA_fnc_addPlayerEventHandler;
["vehicle", {_this call RRPClient_evh_vehicleChange}] call CBA_fnc_addPlayerEventHandler;

addMissionEventHandler ["HandleChatMessage", {
	params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType"];
	diag_log format ["SYSCHAT: %1",_text];
}];

private _farmingModels = [];
private _pugaloModels = [];
{
	_farmingModels pushBackUnique getText(_x >> "model");
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgFarming"));
{
	_pugaloModels pushBackUnique getText(_x >> "model");
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPugalo"));

addMissionEventHandler ["Draw3D", format ['
	call RRPClient_evh_eachFrame;
	call RRPClient_evh_football;
	call RRPClient_draw3D_vehicle_numbers;
	call RRPClient_npc_drawNames;
	call RRPClient_tags_drawTags;
	call RRPClient_party_renderPartyPanel;
	call RRPClient_jail_notification;
	call RRPClient_draw3D_farm_vehicleMiner;
	call RRPClient_jobs_renderWaypoints;
	[%1, %2] call RRPClient_farming_drawEntities;
', _farmingModels, _pugaloModels]];

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	private _display = findDisplay 12;
	_edit = _display displayCtrl 615123;
	[_edit] call RRPClient_finder_markerFinderInput;
}];

player addEventHandler["SoundPlayed", {
	params["_unit", "_soundID"];
	switch (_soundID) do
	{
		case 7:
		{
			['burn', 1] call RRPClient_ach_gateway
		};
		case 8:
		{
			['bulp', 1] call RRPClient_ach_gateway
		};
	};
}];
player addEventHandler["WeaponDeployed",
{
	params["_unit", "_isDeployed"];
	if (_isDeployed) then {
		['deploy', 1] call RRPClient_ach_gateway;
	};
}];
addMissionEventHandler['EntityKilled', {
	params["_entity", "_killer", "_instigator", "_useEffects"];

	if (!isNull _instigator) then
	{
		_killer = _instigator
	};
	/*
	private _spotMarks = (findDisplay 46) getVariable['spotMarks', []];
	private _position = getPosATL _entity;
	private _bloodSplat = selectRandom["BloodPool_01_Large_New_F", "BloodSplatter_01_Large_New_F"];
	private _spotMark = _bloodSplat createvehicle(getPosASL _entity);
	_spotMark setPosASL (getPosASL _entity);
	_spotMark setvectorUp (surfaceNormal _position);
	switch(true) do
	{
		case(isNull _killer or {_killer isEqualto _entity}):
		{
			_spotMark setVariable['evidenceData', [servertime, ['suicide'], getPosASL _entity, _entity getVariable['name', name _entity]], true];
		};
		case(!isNull (objectParent _killer)):
		{
			private _vehicle = objectParent _killer;
			private _vehicleClass = typeOf _vehicle;
			private _type = switch(true) do
			{
				case(_vehicle isKindOf 'landvehicle'):{'landvehicle'};
				case(_vehicle isKindOf 'Air'):{'Air'};
				case(_vehicle isKindOf 'Ship'):{'Ship'};
				default{'undefined'}
			};
			_spotMark setVariable['evidenceData', [servertime, [_type, _killer getVariable['name', name _killer], _vehicleClass], getPosASL _vehicle, _entity getVariable['name', name _entity]], true];
		};
		default{
			private _currentWeapon=currentWeapon _killer;
			_spotMark setVariable['evidenceData', [servertime, ['player', _killer getVariable['name', name _killer], _currentWeapon], getPosASL _killer, _entity getVariable['name', name _entity]], true];
		};
	};
	_spotMarks = _spotMarks select {!(_x getVariable['wasinvestigated', false])};
	_spotMarks pushBack _spotMark;
	(findDisplay 46) setVariable['spotMarks', _spotMarks];
	[
		[_spotMarks apply {getPosATL _x}],
		{
			params['_positions'];
			{
				if (_x find "spotmark_" > -1) then
				{
					deleteMarkerlocal _x
				};
			}forEach allMapMarkers;

			{
				private _marker = createMarkerlocal [format['spotmark_%1', round random 999999], _x];
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerShapeLocal "ICON";
				_marker setMarkertypeLocal "mil_warning";
				_marker setMarkersizeLocal [0.8, 0.8];
			}forEach _positions;
		}
	]remoteExecCall ["spawn", allplayers];
	*/
	if ((_killer isEqualTo player) OR {(_instigator isEqualTo player)}) then
	{
		switch (true) do
		{
			case (_entity isKindOf "Animal"):
			{
				['animals', 1] call RRPClient_ach_gateway
			};
		};
	};
}];
player addEventHandler["FiredMan", {
	params["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

	if !(isNull _vehicle) then {
		private ["_inSZ","_allowedDamageSZ","_allowedDamageOnlySZ"];
		_inSZ = (player inArea getText(missionConfigFile >> "LifeCfgSettings" >> "zone_for_beginners"));
		_allowedDamageSZ = getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "allowedDamageSZ");
		_allowedDamageOnlySZ = getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "allowedDamageOnlySZ");

		if (_inSZ AND {(_allowedDamageSZ isEqualTo 0)}) then {
			deleteVehicle _projectile;
		};

		if (!_inSZ AND {(_allowedDamageOnlySZ isEqualTo 1)}) then {
			deleteVehicle _projectile;
		};
	};

	private _magTypes = _magazine call BIS_fnc_itemType;
	_magTypes params['_category', '_type'];
	private _weaponType = (_weapon call BIS_fnc_itemType) select 1;
	if !(_weapon in ['Throw', 'Put']) then
	{
		if (isNull _vehicle) then
		{
			['infshots', 1] call RRPClient_ach_gateway
		} else {
			['vehshots', 1] call RRPClient_ach_gateway
		};
		player setVariable['ShotsFired', (player getVariable['ShotsFired', 0]) + 1];
	};
	if (_weaponType isEqualTo 'SniperRifle') then
	{
		if !(cameraView isEqualTo 'GUNNER') then
		{
			['noscope', 1] call RRPClient_ach_gateway;
		};
	};
}];

player addEventHandler["Reloaded", {
	params["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
	_oldMagazine params['', '_oldCount'];
	player setVariable['ShotsFired', 0];
	if (_oldCount isEqualTo 0) then {
		['reloads', 1] call RRPClient_ach_gateway;
	};
}];


GetOutManEVH = player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (_role isEqualTo "driver") then {
			//_vehicle removeAllEventHandlers "HandleDamage";
			_vehicle removeAllEventHandlers "IncomingMissile";
			//(netId _vehicle) remoteExecCall ["RRPClient_system_setOwner",2];
	};
}];

GetInManAchies = player addEventHandler["GetInMan", {
	params["_unit", "_role", "_vehicle", "_turret"];
	_this call RRPClient_system_GetInVeh;

	if (_role isEqualTo "driver") then {
			_vehicle removeAllEventHandlers "HandleDamage";
			_vehicle addEventHandler ["HandleDamage", RRPClient_system_HandlerDamVeh];
			_vehicle addEventHandler ["IncomingMissile", {
					_this call RRPClient_system_incomingMissile;
			}];
	};

	_vehicle disableTIEquipment true;
	[_vehicle] spawn RRPClient_evh_fuelConsumption;
	if (_vehicle isKindOf "ParachuteBase") then {
		if ((getPosATL _vehicle select 2) >= 500) then {
			['halo', 1] call RRPClient_ach_gateway;
		};
	};
	if (_vehicle isKindOf "Air") then {
		if (getStamina player < 6) then {
			['getchoppa', 1] call RRPClient_ach_gateway;
		};
	};
	private _crew = fullCrew[_vehicle, '', true];
	if (count _crew >= 4) then
	{
		private _crewCount = count _crew;
		_crew = _crew apply {_x select 0};
		if (({_x in (units group player)}count _crew) isEqualTo _crewCount) then {
			['dudes', 1] call RRPClient_ach_gateway;
		};
	};
	if !(_vehicle getVariable['EVHSet', false]) then
	{
		switch (true) do
		{
			case (_vehicle isKindOf "LandVehicle"):
			{
					_vehicle addEventHandler["EpeContactStart",
					{
						params["_object1", "_object2", "_selection1", "_selection2", "_force"];
						['bta', 1] call RRPClient_ach_gateway;
					}];
				};
			case (_vehicle isKindOf "Air"):
			{
				_vehicle addEventHandler['ControlsShifted',
				{
					params ["_vehicle", "_activeCoPilot", "_oldController"];
					[_vehicle] spawn RRPClient_evh_fuelConsumption;
					if (_oldController isEqualTo player) then {
						['heliswitch', 1] call RRPClient_ach_gateway;
						_vehicle removeAllEventHandlers "HandleDamage";
						_vehicle removeAllEventHandlers "IncomingMissile";
					};
					if (_activeCoPilot isEqualTo player) then {
						_vehicle removeAllEventHandlers "HandleDamage";
						_vehicle addEventHandler ["HandleDamage", RRPClient_system_HandlerDamVeh];
						_vehicle addEventHandler ["IncomingMissile", {
								_this call RRPClient_system_incomingMissile;
						}];
					};
				}];
			};
			case (_vehicle isKindOf "Ship"):{};
		};
		_vehicle removeAllEventHandlers "Engine";
		_vehicle addEventHandler ["Engine", {
			params ["_vehicle", "_engineState"];
			private _driver = driver _vehicle;
			if ( 
				(local _vehicle and 
				{!(_vehicle in life_vehicles)} and 
				{!(_vehicle getVariable ["spawnedByAdmin",false])} AND
				{_driver isEqualTo player}) AND
				!(
					(call life_adminlevel > 4) OR 
					(('cop' call RRPClient_groups_getSideLevel) > 5) OR
					(('med' call RRPClient_groups_getSideLevel) > 0)
				) 
			) then {
				"Нужны ключи чтобы завести эту технику!" call chat;
				_vehicle engineOn false;
			};

			if (_driver isEqualTo player) then {
				if !((typeOf _vehicle) call RRPClient_ptn_vehicleDnkCheck) then {
					"Вы не можете завести этот автомобиль" call chat;
					_vehicle engineOn false;
				};

				private _empEffectTime = _vehicle getVariable ["empEffectActive",-1];
				if (_empEffectTime >= time) then {
					titleText [format ["Техника находится под воздействием EMP, осталось %1 сек",round(_empEffectTime - time)],"PLAIN"];
					_vehicle engineOn false;
				};

			};
			if !(_vehicle getVariable['EngineTurned', false]) then {
				if (_engineState) then {
					_vehicle setVariable['EngineTurned', true];
					_t = profileNamespace getVariable ["PRNS_VehiclesHistoryAch",[]];
					if !(_vehicle getVariable ["RRPDatabaseID",-1] in _t) then
					{
						['fireup', 1] remoteExecCall ["RRPClient_ach_gateway",_driver];
						_t pushBackUnique (_vehicle getVariable ["RRPDatabaseID",-1]);
						profileNamespace setVariable ["PRNS_VehiclesHistoryAch",_t];
						saveProfileNamespace;
					};
				};
			};
			true
		}];
		_vehicle removeAllEventHandlers "Fuel";
		_vehicle addEventHandler["Fuel", {
			params["_vehicle", "_fuel"];
			if !(local _vehicle) exitWith {};
			if !(_fuel) then {
				['fuel', 1] call RRPClient_ach_gateway;
			};
		}];
		_vehicle setVariable['EVHSet', true];
	};
}];
