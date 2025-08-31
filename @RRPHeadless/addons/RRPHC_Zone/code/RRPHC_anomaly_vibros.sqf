private ["_timeWait","_timeStart","_timeFinal"];


//generate scenarion 27.5 - 32.5 мин
_timeWait = 60 * (55 + round(random 10));
comment "Начало выброса, дает понять что он начался и дает фору что бы спрятатся от 3 до 5 мин";
_timeStart = ((3 + round(random 2)) * 60);
comment "Дамажит от 1 до 2 мин";
_timeFinal = ((2 + round(random 2)) * 30);

missionNamespace setVariable ["AnomalyBlowout",0,true];
format ["Время до начала выброса: %1 мин | Начало выброса: %2 | Финал: %3",_timeWait/60,(_timeWait/60 + _timeStart/60),(_timeWait/60 + _timeStart/60 + _timeFinal/60)] call RRPHC_util_debugConsole;

uiSleep _timeWait;
missionNamespace setVariable ["AnomalyBlowout",1,true];
format ["blowout init: %1 сек",_timeStart] call RRPHC_util_debugConsole;
remoteExec ["RRPClient_anomaly_blowoutStart",-2];
[] spawn {
    while {AnomalyBlowout > 0} do {
        [round(random 1)] remoteExec ["RRPClient_anomaly_blowoutEffect",-2];
        uiSleep (4 + round(random 5));
    };
};


uiSleep _timeStart;
missionNamespace setVariable ["AnomalyBlowout",2,true];
format ["blowout action: %1 сек",_timeStart] call RRPHC_util_debugConsole;
[] spawn {
    while {AnomalyBlowout isEqualTo 2} do {
        remoteExec ["RRPClient_anomaly_earthquake",-2];
        uiSleep 30;
    };
};

uiSleep _timeFinal;
missionNamespace setVariable ["AnomalyBlowout",3,true];
remoteExec ["RRPClient_anomaly_BlowoutFinal",-2];
format ["blowout final: %1 сек",_timeFinal] call RRPHC_util_debugConsole;

uiSleep 60;
comment "Начинает заново";
missionNamespace setVariable ["AnomalyBlowout",0,true];
[] spawn RRPHC_anomaly_vibros;
