#include "..\..\macros.hpp"
if !(RRPServerVarAnomalyInit) exitWith {};
if (isNil "anomalyZones") exitWith {};

private _inZone = false;
private _markerZone = "";
{
    if (player inArea _x AND ([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance > 200)) exitWith {
	    _markerZone = _x;
		_inZone = true;
	};
} forEach anomalyZones;

if (_inZone) then {
    if (player getVariable ["isIBlowout",false]) then {
        player setVariable ["isIBlowout",false,true];
    };

    if (AnomalyBlowout > 0) then {
        if !(player getVariable ["isIBlowout",false]) then {
            player setVariable ["isIBlowout",true,true];
        };
        if (AnomalyBlowout isEqualTo 2 AND (isNil "blowoutEffect")) then {
            blowoutEffect = ppEffectCreate ["colorCorrections", 1555];
            blowoutEffect ppEffectEnable true;
            blowoutEffect ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.2, 0.2, 0.0], [1.0, 0.4, 0.0, 0.1],[1.0,0.3,0.3, 0.5]];
            blowoutEffect ppEffectCommit 2;

        };
        if (AnomalyBlowout isEqualTo 3) then {
            if  (isNil "blowoutEffectHard") then {
                blowoutEffectHard = ppEffectCreate ["colorCorrections", 1555];
                blowoutEffectHard ppEffectEnable true;
                blowoutEffectHard ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.1, 0.1, 0.0], [1.0, 0.1, 0.0, 0.1],[1.0,0.1,0.0, 0.5]];
                blowoutEffectHard ppEffectCommit 6;
            };
            player setDamage (getDammage player + 0.1);
        };
    } else {
        if !(isNil "blowoutEffect") then {
         ppEffectDestroy blowoutEffect;
         blowoutEffect = nil;
        };

        if !(isNil "blowoutEffectHard") then {
         ppEffectDestroy blowoutEffectHard;
         blowoutEffectHard = nil;
        };
    };

    if !(life_anomalyActive) then {
		[] call client_anomaly_buffInit;
		ANOMALY_CYCLE_PFH = [client_anomaly_buffCycle,5] call CBA_fnc_addPerFrameHandler;

		life_anomalyZone = _markerZone;
		life_anomalyActive = true;
		SVAR_PRNS ["PRNS_inAnomalyZone",true];
		LOG_1("Anomaly Info",life_anomalyZone);
		LOG("Anomaly activeted");
    };
    if !(cameraView in ["INTERNAL", "GUNNER"]) then {
        player switchCamera "INTERNAL";
    };

	if (currentVisionMode player == 1) then {
		player action["nvGogglesOff", player];
		life_nightVision = true;
	};
	if (currentVisionMode player == 2) then {
		life_thermalVision = true;
		player action["nvGoggles", player];
		player action["nvGogglesOff", player];
		showGPS false;
	};

	//Тормозим технику
	private _vehicle = objectParent player;
	private _curDriver = currentPilot _vehicle;
	if (!isNull _vehicle && {EQUAL(_curDriver,player)}) then {

	    private _vehicleCheck = false;
		{
		    _x params ["_cassname","_condition"];
			if (EQUAL(_cassname,typeOf _vehicle) && ([_condition] call RRPClient_util_conditionsCheck)) exitWith {
		        _vehicleCheck = true;
		    };
		} forEach (getArray(missionConfigFile >> "LifeCfgAnomaly" >> "vehicles"));

		_relDir = player getRelDir (getMarkerPos _markerZone);
		if !(_vehicleCheck) then {
			if ((speed _vehicle) >= 20) then {
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = -11;
				_vehicle setVelocity [
				    (_vel select 0) + (sin _dir * _speed),
				    (_vel select 1) + (cos _dir * _speed),
				    (_vel select 2)
				];
			} else {
			    if ((speed _vehicle) < 20 && {EQUAL(_vehicle getHitPointDamage "hitEngine",0)}) then {
				    //Выбиваем движок жфект
			        if (local _vehicle) then {
			            _vehicle setHitPointDamage ["hitEngine",1];
			        } else {
			            [_vehicle, ["hitEngine",1]] remoteExec ["setHitPointDamage", _vehicle];
			        };
			        //Накладываем жфект
			        ["tgt_sfx",[_vehicle]] remoteExec ["client_effects_emp",RCLIENT];
				};
			};
		};
	};
} else {
    if (player getVariable ["isIBlowout",false]) then {
        player setVariable ["isIBlowout",false,true];
    };

    if !(isNil "blowoutEffect") then {
     ppEffectDestroy blowoutEffect;
     blowoutEffect = nil;
    };

    if !(isNil "blowoutEffectHard") then {
     ppEffectDestroy blowoutEffectHard;
     blowoutEffectHard = nil;
    };

    if (life_anomalyActive) then {
		[ANOMALY_CYCLE_PFH] call CBA_fnc_removePerFrameHandler;
		ANOMALY_CYCLE_PFH = nil;
		[] call client_anomaly_buffRemove;
		life_anomalyZone = "";
		life_anomalyActive = false;
		SVAR_PRNS ["PRNS_inAnomalyZone",nil];
		LOG("Anomaly deactiveted");
		showGPS true;
    };
};
