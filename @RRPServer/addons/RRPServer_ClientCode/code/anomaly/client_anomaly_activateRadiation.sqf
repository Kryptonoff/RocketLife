/*

	Filename: 	client_anomaly_activateRadiation.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
if (isServer) exitWith {};
params[["_trigger",objNull],["_triggerList",[]]];
if (isNull _trigger) exitWith {};
if ((_trigger GVAR ["anomaly_cooldown", false] && {life_radiationCooldown}) OR LSNOTALIVE(player)) exitWith {};
_trigger SVAR ["anomaly_cooldown",true];
life_radiationCooldown = true;

//Определение влияющего  источника
private _area = triggerArea _trigger;
LOG_1("Var",_area);
private _rDistance = player distance _trigger;
LOG_1("Var",_rDistance);
private _rRadius = (_trigger GVAR "radiationRadius");
LOG_1("Var",_rRadius);
private _rLevel = (_trigger GVAR "radiationLevel");
LOG_1("Var",_rLevel);
private _rLevelMax = (_rRadius * _rLevel) / 4;
LOG_1("Var",_rLevelMax);
private _rProtect = 0;

LOG_1("if 1",(_rDistance <= _rRadius));
LOG_1("if 2",(player inArea _trigger));

//Поиск ближайших к игроку радиактивных объектов
if (_rDistance <= _rRadius) then {
    //Уровень облучения вокруг
    life_radiationTerrain = ((_rRadius - _rDistance) * _rLevel) / 4;
	LOG_1("Var",life_radiationTerrain);
	//Уровень облучения с учотом зашиты
	_rProtect = ([life_radiationTerrain] call client_anomaly_radiationProtect);
	LOG_1("Var",_rProtect);

    //Уровень облучения игрока
    if (_rProtect > life_radiationInfection) then {
	    life_radiationInfection = life_radiationInfection + (_rProtect / 500);
    };

    //Урон от облучения
    if (life_radiationInfection > 0) then {
	    _rDamage = (life_radiationInfection / 50);
	    [player,"damage",_rDamage] call client_system_setDamage;
	    if (LSNOTALIVE(player)) then {
		    life_radiationInfection = 0;
	    };
    };

    //Время воздействия радицаии
    life_radiationSpentTime = life_radiationSpentTime + 1;
} else {
    life_radiationTerrain = 0;
	life_radiationSpentTime = 0;
	life_radiationInfection = 0;
};

if (isNull life_radiationTrigger) then {
    life_radiationTrigger = _trigger;
    [{!(player inArea _this)},{
	    life_radiationTrigger = objNull;
		life_radiationTerrain = 0;
		life_radiationSpentTime = 0;
		life_radiationInfection = 0;

	    if !(EQUAL(LIFE_PPE_RADIATION_CHROM,-1)) then {
		    LIFE_PPE_RADIATION_CHROM ppEffectEnable false;
            ppEffectDestroy LIFE_PPE_RADIATION_CHROM;
			LIFE_PPE_RADIATION_CHROM = -1;
	    };
	    if !(EQUAL(LIFE_PPE_RADIATION_FILM,-1)) then {
	        LIFE_PPE_RADIATION_FILM ppEffectEnable false;
	        ppEffectDestroy LIFE_PPE_RADIATION_FILM;
	        LIFE_PPE_RADIATION_FILM = -1;
	    };
	},life_radiationTrigger] call CBA_fnc_waitUntilAndExecute;
};

//Эффект радиции на лицо
if (EQUAL(LIFE_PPE_RADIATION_CHROM,-1)) then {LIFE_PPE_RADIATION_CHROM = ppEffectCreate ["ChromAberration", 205]};
if (EQUAL(LIFE_PPE_RADIATION_FILM,-1)) then {LIFE_PPE_RADIATION_FILM = ppEffectCreate ["FilmGrain", 2005]};

private _linearConversion = (linearConversion [0,_rLevelMax,_rProtect,0,1]);
LIFE_PPE_RADIATION_CHROM ppEffectEnable true;
LIFE_PPE_RADIATION_CHROM ppEffectAdjust [0.02 * _linearConversion,0.02 * _linearConversion,true];
LIFE_PPE_RADIATION_CHROM ppEffectCommit 1;

LIFE_PPE_RADIATION_FILM ppEffectEnable true;
LIFE_PPE_RADIATION_FILM ppEffectAdjust [_linearConversion,0.2,1,0.2,1.0,true];
LIFE_PPE_RADIATION_FILM ppEffectCommit 1;

[{
	_this SVAR ["anomaly_cooldown",false];
	life_radiationCooldown = false;
}, _trigger, 1] call CBA_fnc_waitAndExecute;
