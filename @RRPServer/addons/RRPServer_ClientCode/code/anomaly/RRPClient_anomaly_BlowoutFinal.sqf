if (player call RRPClient_util_isInStratis AND ([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance > 200)) then {
    [3] call BIS_fnc_earthquake;

};

if ([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance > 200) then {
    uiSleep 60;
    [
        ["Выброс закончился...", 4, 5]
    ] spawn BIS_fnc_EXP_camp_SITREP;
}
