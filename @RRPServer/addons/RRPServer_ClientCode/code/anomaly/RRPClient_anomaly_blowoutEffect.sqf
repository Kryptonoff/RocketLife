if (player call RRPClient_util_isInStratis AND ([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance > 200)) then {
    if ((_this # 0) isEqualTo 0) then {
        playSound "bl_begin";
       "dynamicBlur" ppEffectAdjust [8];
       "dynamicBlur" ppEffectEnable true;
       "dynamicBlur" ppEffectCommit 0;
       "dynamicBlur" ppEffectAdjust [0.1];
       "dynamicBlur" ppEffectCommit 0.75;
       "chromAberration" ppEffectAdjust [0.25,0,true];
       "chromAberration" ppEffectEnable true;
       "chromAberration" ppEffectCommit 0.5;
       uiSleep 0.5;
       "chromAberration" ppEffectAdjust [-0.15,0,true];
       "chromAberration" ppEffectCommit 0.35;
       uiSleep 0.5;
       "chromAberration" ppEffectAdjust [-0.05,0,true];
       "chromAberration" ppEffectCommit 0.20;
       uiSleep 0.20;
       "chromAberration" ppEffectAdjust [0,0,true];
       "chromAberration" ppEffectCommit 0.20;
    } else {
        player setVariable ["isIBlowout",true,true];
        playSound selectRandom ["ns_fx_drone1","ns_fx_drone2","ns_fx_misc4","ns_fx_drone1","ns_fx_drone2","ns_fx_drone1","ns_fx_drone2","ns_fx_drone1","ns_fx_drone2", "ns_fx_drone1", "ns_fx_drone2", "ns_fx_misc4","ns_fx_drone1", "ns_fx_drone2"];
        "chromAberration" ppEffectAdjust [0.25,0,true];
        "chromAberration" ppEffectEnable true;
        "chromAberration" ppEffectCommit 0.5;
        uiSleep 0.2;
        "chromAberration" ppEffectAdjust [-0.15,0,true];
        "chromAberration" ppEffectCommit 0.35;
        uiSleep 0.1;
        "chromAberration" ppEffectAdjust [-0.05,0,true];
        "chromAberration" ppEffectCommit 0.20;
        uiSleep 0.1;
        "chromAberration" ppEffectAdjust [0,0,true];
        "chromAberration" ppEffectCommit 0.20;
        uiSleep 0.25;
        "chromAberration" ppEffectEnable false;
    }
};
