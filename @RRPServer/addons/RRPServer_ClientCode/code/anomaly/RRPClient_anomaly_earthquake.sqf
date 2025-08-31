if (player call RRPClient_util_isInStratis AND ([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance > 200)) then {
    [3] call BIS_fnc_earthquake;
    [
        ["Выброс уже совсем скоро..", 4, 5],
        ["Нужно найти укрытие!", 3, 5, 8]
    ] spawn BIS_fnc_EXP_camp_SITREP;
};
