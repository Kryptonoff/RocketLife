#include "..\..\macros.hpp"
if !(RRPServerVarAnomalyInit) exitWith {LOG("Server anomaly OFF")};
if (isNil "anomalyHolder") exitWith {LOG("Server anomalyHolder nil")};

private _anomaliesFound = [];

	//Включение травы
	if (life_grassIndex != 7) then {
	   life_grassIndex = 7;
	   setterrainGrid life_grassIndex;
	};

    //Дальность видимости
	if (life_viewDistanceFoot != 260 OR life_viewDistanceCar != 300 OR life_viewDistanceAir != 500) then {
		life_viewDistanceFoot = 260;
		life_viewDistanceCar = 300;
		life_viewDistanceAir = 500;
	    [] call RRPClient_system_updateViewDistance;
	};

	//Визуальные эффекты
	if (EQUAL(LIFE_PPE_ANOMALY_COLOR,-1)) then {
	    //Затемняем экран
	    LIFE_PPE_ANOMALY_COLOR = ppEffectCreate ["ColorCorrections", 1000];
	    LIFE_PPE_ANOMALY_COLOR ppEffectEnable true;
	    LIFE_PPE_ANOMALY_COLOR ppEffectAdjust [1,1,0,[0,0,0,0],[0.626402,0.565262,0.473549,0.400501],[0.5,0.25,0.25,0]];
	    LIFE_PPE_ANOMALY_COLOR ppEffectCommit 10;
    };
    if (EQUAL(LIFE_PPE_ANOMALY_FILMGRAIN,-1)) then {
	    //Рябь
	    LIFE_PPE_ANOMALY_FILMGRAIN = ppEffectCreate ["FilmGrain", 1100];
	    LIFE_PPE_ANOMALY_FILMGRAIN ppEffectEnable true;
	    LIFE_PPE_ANOMALY_FILMGRAIN ppEffectAdjust [0.04,0.2,1,0.2,1.0,true];
	    LIFE_PPE_ANOMALY_FILMGRAIN ppEffectCommit 10;
    };

	//Загрузка лута в домах
	_nearHouseTemp = [player,70] call client_anomaly_lootSearch;
	_newHouseArray = _nearHouseTemp - life_anomalyHouseArray;
	if !(_newHouseArray isEqualTo []) then {
	    LOG_1("Loot",_nearHouseTemp);
		[_nearHouseTemp] call client_anomaly_lootLoad;
	};

	//Дамаг от газов
	[] call client_anomaly_activateFog;

	// поиск триггеров
	{
		_type = _x GVAR ["anomaly_type", nil];
		// принимать только триггеры, которые являются аномалиями
		if !(isNil "_type") then {
			if ((player distance _x) <= life_anomalyIdleDistance) then {
				_anomaliesFound pushBackUnique _x;
				if (_x GVAR ["anomaly_cooldown", false]) exitWith {};
				private _source = _x GVAR ["anomaly_particle_source", []];
				if (_source isEqualTo []) then {
					// создать эффект холостого хода
					_source = [_x,_type] call client_anomaly_particlesIdle;
					if (!isNil "_source" && {!(_source isEqualTo [])}) then {
						_x SVAR ["anomaly_particle_source",_source];
					};
				};
			};

			if ((player distance _x) <= life_anomalyTriggerDistance) then {
				// проверка включена ли анамалия
				if !(simulationEnabled _x) then {
					_x enableSimulation true;
				};
			};
		};
		nil
	} count anomalyHolder;

	_diff = life_anomalyActiveArray - _anomaliesFound;
	{
	    //Удаление эффектов анамалии и отключениение триггера
		[_x] call client_anomaly_particlesDelete;
		_x enableSimulation false;
		if (_x in life_anomalyArtefactArray) then {
			life_anomalyArtefactArray deleteAt (life_anomalyArtefactArray find _x);
			[_x] call client_anomaly_lootDelete;
		};
		nil
	} count _diff;
	life_anomalyActiveArray = _anomaliesFound;
