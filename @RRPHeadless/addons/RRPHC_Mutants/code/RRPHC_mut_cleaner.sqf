
[{
	diag_log "SYSTEM_CLEANER INIT";
	
	life_mutants = life_mutants - [objNull];
	{
		_mutant = _x;
		_isPlayersNearby = (((getPosATL _mutant) nearEntities ["CaManBase",325]) select {isPlayer _x});
		if (_isPlayersNearby isEqualTo []) then {
			_zone = _mutant getVariable ["MUT_Zone", ""];
			if (missionNamespace getVariable [_zone, 0] > 0) then {missionNamespace setVariable [_zone, 0]};
			diag_log format["Удаление мута на позиции: %1 - %2", getPosATL _mutant, _zone];
			deleteVehicle _mutant;
		};
		if (!alive _mutant) then {[_mutant, 400] call RRPHC_system_objectClean};
		if (surfaceIsWater (getPosATL _mutant)) then {deleteVehicle _mutant};
	} forEach life_mutants;		
	life_mutants = life_mutants - [objNull];
},25] call CBA_fnc_addPerFrameHandler;

[{
	_mutantsOutside = (allMissionObjects "MUTANT_HUM") select {!(_x call RRPClient_util_isInStratis)};
	{deleteVehicle _x} forEach _mutantsOutside;
},5] call CBA_fnc_addPerFrameHandler;

/* 
[{
	{	
		_mutantsInSZ = ((markerPos _x) nearEntities ["Man", (markerSize _x) select 0]) arrayIntersect life_mutants;
		if (_mutantsInSZ isNotEqualTo []) then {
			{deleteVehicle _x} forEach _mutantsInSZ;
		};
	} forEach (getArray(missionConfigFile >> "LifeCfgSettings" >> worldName >> "life_anomaly_sz"))
}, 2.5] call CBA_fnc_addPerFrameHandler; 
*/

/*
		life_anomaly_sz[] = {"players_spawn_zone", "anomaly_safe_1","anomaly_safe_2","anomaly_safe_3","anomaly_safe_4","anomaly_safe_5","anomaly_safe_6","anomaly_safe_7","anomaly_safe_8","anomaly_safe_9","anomaly_safe_10"};
*/