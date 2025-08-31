/*

	[] spawn {
		sr_mut_doSpawn = false; 
		uisleep 0.2;
		{deletevehicle _x} foreach life_mutants;
		sr_mut_doSpawn = true; [] spawn RRPHC_mut_spawnerGlobal
	}
*/
#define DOG_TIMEOUT 600
#define LIGHT_TIMEOUT 420
#define NOZONE_TIMEOUT 900

while {sr_mut_doSpawn} do {
	_allPlayers = (allPlayers - entities "HeadlessClient_F") select {!(isObjectHidden _x) AND {!(_x call RRPClient_system_isAnomalySafeZone)} and {_x call RRPClient_util_isInStratis}};

	{deleteGroup _x} count (allGroups select {(units _x) isEqualTo []});
	{
		
		_class = configName _x;
		
		_mut_class = getText(_x >> "MutantClass"); //тип мутанта в зоне
		_amount = getNumber(_x >> "Amount"); //количество мутантов
		_cooldown = getNumber(_x >> "Cooldown"); //кулдаун спавна
		_radius = getNumber(_x >> "Radius"); // радиус территории
		_isFixedPos = getNumber(_x >> "isFixedPos"); //Спавним ли на фиксированных позициях? 
		_pos = getArray(_x >> "Position"); // центр территории мутов
		
		if (_cooldown isEqualTo 0 OR {missionNamespace getVariable [_class, 0] < serverTime}) then { //проверяем кулдаун спавна
			format ["Mutants: %1 | %2 %3 %4",_class, _pos,_radius,_allPlayers] call RRPHC_util_debugConsole;
			_CountPlayersNearby = count ((_pos nearEntities ["CaManBase",(_radius + 120)]) arrayIntersect _allPlayers); //количество игроков в радиусе 200 от края территории мутантов
			_CountPlayersInArea = count ((_pos nearEntities ["CaManBase",_radius]) arrayIntersect _allPlayers); //количество игроков на территории мутантов
			_CountMutantInArea = count (_pos nearEntities [_mut_class,(_radius + 30)]); //количество мутантов на своей территории
			//_CountPlayersNearArea = count ((_pos nearEntities ["CaManBase",(_radius + 25)]) select {isPlayer _x}); // количество игроков, совсем близко к границе спавна
			//if (_CountPlayersNearArea > 0) then {_radius = _radius * 0.5};
			
			_init = switch (_mut_class) do {
				case "BS_Ex_Mutant_01" : {RRPHC_mut_initBloodsucker};
				case "Chimera_RIMAS" : {RRPHC_mut_initChimera};
				case "Controller_Ex_Mutant_01" : {RRPHC_mut_initController};
				case "Snork_Ex_Mutant_01" : {RRPHC_mut_initSnork};
				case "Zombie_Ex_Mutant_01" : {RRPHC_mut_initZombie};
				case "Pseudo_RIMAS" : {RRPHC_mut_initGiant};
				case "Burer_RIMAS" : {RRPHC_mut_initBurer};
				default {{diag_log format ["undefined mutant: %1",_mut_class]}};
			};

			format ["CANT SPAWN MUTANT CONDITION: %1 | %2:%3:%4",_class, (_CountPlayersNearby > 0),(_CountMutantInArea < _amount),(_CountPlayersInArea == 0) ] call RRPHC_util_debugConsole;
			if ((_CountPlayersNearby > 0) && (_CountMutantInArea < _amount) && (_CountPlayersInArea == 0)) then {
				if (_isFixedPos isEqualTo 1) then {
					{
						[_x, _class] spawn _init;
						uiSleep 0.2;
					} forEach getArray(_x >> "FixedPos");
				} else {
					for "_i" from 1 to (_amount - _CountMutantInArea) do {
						for "_i" from 1 to 10 do {
							_spawn_pos = _pos getPos [0.7 * _radius * sqrt random 1, random 360];
							
							format ["CANT SPAWN MUTANT CONDITION IN WHILE: %1 | %2",_class, (!(surfaceIsWater _spawn_pos) AND {!([_spawn_pos] call RRPClient_system_isAnomalySafeZone)})] call RRPHC_util_debugConsole;
							if (!(surfaceIsWater _spawn_pos) AND {!([_spawn_pos] call RRPClient_system_isAnomalySafeZone)}) exitWith {
								uiSleep 0.1;
								[_spawn_pos, _class] spawn _init;	
							};
							if (_i isEqualTo 10) exitWith {diag_log ["ERROR _i = 10", _class, _mut_class, _spawn_pos, _spawn_pos]};
						};
					};
				};
				if (_cooldown != 0) then {missionNamespace setVariable [_class, serverTime + _cooldown]};
			};
		};
	} forEach ("true" configClasses (configFile >> "CfgMutSpawnPos"));

	{
		if !(_x call RRPClient_util_isInStratis) then {continue};
		_nearPlayers = (_x nearEntities ["CaManBase", 50]) arrayIntersect _allPlayers;
		if (count _nearPlayers > 2) then {
			if ((_x getVariable ["mut_dogTime", -1]) < serverTime) then {
				for "_i" from 1 to 10 do {
					_spawn_pos = _x getPos [300, random 360];
					if (!(surfaceIsWater _spawn_pos) AND {!([_spawn_pos] call RRPClient_system_isAnomalySafeZone)}) exitWith {
						{_x setVariable ["mut_dogTime", serverTime + DOG_TIMEOUT]} forEach _nearPlayers;
						[_spawn_pos] spawn RRPHC_mut_initDog;
					};
				};				
			};
			if ((_x getVariable ["mut_lightTime", -1]) < serverTime) then {
				for "_i" from 1 to 10 do {
					_spawn_pos = _x getPos [200, random 360];
					if (!(surfaceIsWater _spawn_pos) AND {!([_spawn_pos] call RRPClient_system_isAnomalySafeZone)} AND {((_spawn_pos nearEntities ["CaManBase",175]) arrayIntersect _allPlayers) isEqualTo []}) exitWith {
						{_x setVariable ["mut_lightTime", serverTime + LIGHT_TIMEOUT]} forEach _nearPlayers;
						[_spawn_pos] spawn (selectRandom [RRPHC_mut_initSnork, RRPHC_mut_initZombie]);
					};
				};
			};
		};

		_mutants = (_x nearEntities ["CaManBase", 300]) arrayIntersect life_mutants;
		if (_mutants isEqualTo [] AND {(_x getVariable ["mut_noZoneTime", -1]) < serverTime}) then {
			for "_i" from 1 to 10 do {
				_spawn_pos = _x getPos [200, random 360];
				if (!(surfaceIsWater _spawn_pos) AND {!([_spawn_pos] call RRPClient_system_isAnomalySafeZone)} AND {((_spawn_pos nearEntities ["CaManBase",175]) arrayIntersect _allPlayers) isEqualTo []}) exitWith {
					[_spawn_pos] spawn (selectRandom [RRPHC_mut_initSnork, RRPHC_mut_initZombie]);
				};
			};
		};
	} forEach _allPlayers;

	uiSleep 10;
};
