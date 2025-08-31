/*
    File: fn_combatVehicleReq.sqf

    Description:
    При попытке взять боевую технику, ставим счетчик если все норм - отдаем технику.
    [player,_cfgClass,life_combatVehMarker,_maximum] remoteExec ["RRPServer_system_combatVehicleReq",RSERV];
    [cop_21,"cop_gh","cop_air_2",0]
*/
private _unit = param [0,objNull,[objNull]];
private _classname = param [1,"",[""]];
private _vehmarker = param [2,"",[""]];
private _maximum = param [3,0,[0]];

//Error checks
if (isNull _unit || _classname isEqualTo "" || _vehmarker isEqualTo "") exitWith {
    if (!isNull _unit) then {
        [[]] remoteExec ["RRPClient_system_getCombatVehicleMenu",(owner _unit)];
    };
};

private _times = format ["combatVehGet:%1",_classname] call RRPServer_DB_selectSingleField;
if (_times >= _maximum) exitWith {
    ["У этой техники превышен лимит доставаний","error"] remoteExecCall ["RRPClient_system_hint",(owner _unit)];
};
format ["updateCombatVeh:%1",_classname] call RRPServer_DB_fireAndForget;


[_classname,_vehmarker] remoteExec ["RRPClient_system_getCombatVehicleDone",(owner _unit)];