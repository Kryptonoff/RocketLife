#include "..\..\macros.hpp"
life_anomalyActive = false;
SVAR_PRNS ["PRNS_inAnomalyZone",nil];

//Удаляем PFH для начала
[ANOMALY_AMBIENT_PFH] call CBA_fnc_removePerFrameHandler;

//Удаление эффектов анамалии, отключениение триггера и удаления лута
{
	[_x] call client_anomaly_particlesDelete;
	_x enableSimulation false;
	if (_x in life_anomalyArtefactArray) then {
		life_anomalyArtefactArray deleteAt (life_anomalyArtefactArray find _x);
		[_x] call client_anomaly_lootDelete;
	};
	nil
} count life_anomalyActiveArray;

//Удаление лута в домах
{
	[_x] call client_anomaly_lootDelete;
	nil
} count life_anomalyHouseArray;

//Сбрасываем переменые
ANOMALY_AMBIENT_PFH = nil;
playMusic "";

life_anomalyFogActive = false;
life_anomalyActiveArray = [];
life_anomalyHouseArray = [];
life_anomalyArtefactArray = [];

life_radiationTerrain = 0;
life_radiationSpentTime = 0;

life_viewDistanceFoot = life_anomaly_viewDistanceFoot;
life_viewDistanceCar = life_anomaly_viewDistanceCar;
life_viewDistanceAir = life_anomaly_viewDistanceAir;
[] call RRPClient_system_updateViewDistance;

//Убираем эффекты
if !(EQUAL(LIFE_PPE_ANOMALY_COLOR,-1)) then {
	LIFE_PPE_ANOMALY_COLOR ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
	LIFE_PPE_ANOMALY_COLOR ppEffectCommit 10;
	[{ppEffectDestroy [LIFE_PPE_ANOMALY_COLOR]; LIFE_PPE_ANOMALY_COLOR = -1},[],11] call CBA_fnc_waitAndExecute;
};
if !(EQUAL(LIFE_PPE_ANOMALY_FILMGRAIN,-1)) then {
	LIFE_PPE_ANOMALY_FILMGRAIN ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
	LIFE_PPE_ANOMALY_FILMGRAIN ppEffectCommit 10;
	[{ppEffectDestroy [LIFE_PPE_ANOMALY_FILMGRAIN]; LIFE_PPE_ANOMALY_FILMGRAIN = -1},[],11] call CBA_fnc_waitAndExecute;
};
if !(EQUAL(LIFE_PPE_ANOMALY_FOGBLUR,-1)) then {
	LIFE_PPE_ANOMALY_FOGBLUR ppEffectAdjust [0];
	LIFE_PPE_ANOMALY_FOGBLUR ppEffectCommit 5;
	[{ppEffectDestroy LIFE_PPE_ANOMALY_FOGBLUR; LIFE_PPE_ANOMALY_FOGBLUR = -1;},[],5] call CBA_fnc_waitAndExecute;
};
