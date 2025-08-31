if (isServer) exitWith {};
params[["_trigger",objNull],["_triggerList",[]]];
if (isNull _trigger) exitWith {};
if (_trigger getVariable ["anomaly_cooldown", false]) exitWith {};

private _type = _trigger getVariable ["anomaly_type",""];
private _damage = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "damage");
private _damageTypeObject = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "damageTypeObject");
private _damageRange = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "damageRange");
private _damageDelay = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "damageDelay");
private _damageOverTime = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "damageOverTime");
private _damageOverTimeTick = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "damageOverTimeTick");
private _damageOverTimeTickCount = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "damageOverTimeTickCount");
private _reloadTime = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "Settings" >> _type >> "reloadTime");
if (anomalyDebug) then {
    format["CFG Anomaly:%1 | %2 |",_type,[_damage,_damageRange,_damageTypeObject,_damageDelay,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_reloadTime]] call RRPClient_system_log
};
private _anomalyPos = [_trigger] call CBA_fnc_getPos;


private _objectsList = nearestObjects [_anomalyPos,[],_damageRange];
_objectsList = (_objectsList select {
    (isPlayer _x && {_x getVariable ["lifeState",""] isEqualTo "HEALTHY"} && {isNull objectParent _x}) OR
    ([_x] call RRPClient_system_isVehicleKind && {alive _x}) OR
    typeOf _x isEqualTo life_anomalyBoltAmmo
});


_triggerList = (_triggerList select {
    (isPlayer _x && {_x getVariable ["lifeState",""] isEqualTo "HEALTHY"} && {isNull objectParent _x}) OR
    ([_x] call RRPClient_system_isVehicleKind && {alive _x}) OR
    typeOf _x isEqualTo life_anomalyBoltAmmo
});

if (anomalyDebug) then {
    format["Anomaly:%1 | Trigger:%2 | Objects:%3",_type,_triggerList,_objectsList] call RRPClient_system_log
};

if (_triggerList isEqualTo [] && _objectsList isEqualTo []) exitWith {"Gravi exitWith " call RRPClient_system_log};
[_trigger,"anomaly_cooldown",true] call CBA_fnc_setVarNet;
[_trigger,_type] remoteExecCall ["client_anomaly_particlesActive",-2 ];

{
    if (isPlayer _x && {_x getVariable ["lifeState",""] isEqualTo "HEALTHY"} && {isNull objectParent _x}) then {
        if (local _x) then {
            [_x, _anomalyPos,0.8,_damageDelay + 0.2] call client_anomaly_suckToLocation;
        } else {
            [_x,_anomalyPos,0.8,_damageDelay + 0.2] remoteExecCall ["client_anomaly_suckToLocation",_x];
        };
    } else {
        if ([_x] call RRPClient_system_isVehicleKind && {alive _x}) then {
            if (local _x) then {
                [_x, _anomalyPos,0.8,_damageDelay + 0.2] call client_anomaly_suckToLocation;
            } else {
                [_x,_anomalyPos,0.8,_damageDelay + 0.2] remoteExecCall ["client_anomaly_suckToLocation",_x];
            };
        } else {
            diag_log format["Anomaly:%3 | typeOf:%1 | Trigger:%2",typeOf _x,_triggerList,_type];
            deleteVehicle _x;
        };
    };
} forEach _objectsList;


[{
params["_trigger","_objectsList","_argDmg"];

_argDmg call client_system_damageArea;

{
if (_x distance _trigger > (_argDmg # 1)) then {
[_x,2] remoteExecCall ["client_anomaly_meatSplash"];
};
} forEach (_objectsList select {isPlayer _x && {_x getVariable ["lifeState",""] isEqualTo "HEALTHY"} && {isNull objectParent _x}});
},[_trigger,_objectsList,[_anomalyPos,_damageRange,_damage,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_damageTypeObject,["HitEngine","HitBody"]]],_damageDelay] call CBA_fnc_waitAndExecute;



[{

_this remoteExecCall ["client_anomaly_particlesDelete",-2 ];
},[_trigger],_damageDelay] call CBA_fnc_waitAndExecute;


[{
[_this,"anomaly_cooldown",false] call CBA_fnc_setVarNet
},_trigger,_reloadTime + _damageDelay] call CBA_fnc_waitAndExecute;
