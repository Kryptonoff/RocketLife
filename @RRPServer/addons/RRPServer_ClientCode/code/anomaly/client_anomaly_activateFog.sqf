/*

	Filename: 	client_anomaly_activateFog.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
if !(LSALIVE(player)) exitWith {};
//дым (сажает фпс)
if (!life_anomalyFogActive) then {
	[vehicle player,"fog"] call client_anomaly_particlesIdle;
};

if ((PGOOGLES in life_anomalyGasMask) OR (PUNIFORM in life_anomalyUniqueDef) OR !life_anomalyGasDamage) then {
	if !(EQUAL(LIFE_PPE_ANOMALY_FOGBLUR,-1)) then {
		LIFE_PPE_ANOMALY_FOGBLUR ppEffectAdjust [0];
	    LIFE_PPE_ANOMALY_FOGBLUR ppEffectCommit 4;
		[{
		    ppEffectDestroy LIFE_PPE_ANOMALY_FOGBLUR;
			LIFE_PPE_ANOMALY_FOGBLUR = -1;
		},[],5] call CBA_fnc_waitAndExecute;
	};
} else {
	//Помутнение в глазах
	if (EQUAL(LIFE_PPE_ANOMALY_FOGBLUR,-1))	then {
		LIFE_PPE_ANOMALY_FOGBLUR = ppEffectCreate ["DynamicBlur", random 500];
		LIFE_PPE_ANOMALY_FOGBLUR ppEffectEnable true;
	};
	if !(EQUAL(LIFE_PPE_ANOMALY_FOGBLUR,-1))	then {
		LIFE_PPE_ANOMALY_FOGBLUR ppEffectAdjust [4];
		LIFE_PPE_ANOMALY_FOGBLUR ppEffectCommit 4;
	};

	//Кашель
	private _coughers = ["WoundedGuyA_02","WoundedGuyA_04","WoundedGuyA_05","WoundedGuyA_07","WoundedGuyA_08"];
	[player, selectRandom _coughers,35] remoteExecCall ["RRPClient_system_say3D",RCLIENT];

	//Урон
	[player,"damage",0.05] call client_system_setDamage;
};
