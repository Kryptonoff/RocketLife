if (player call RRPClient_util_isInStratis AND ([Player, "anti_vibros_zone_1"] call CBA_fnc_getDistance > 200)) then {
    titleText["","WHITE OUT",1];
    titleText["","WHITE IN",1];
    uiSleep 1;
    [3] call BIS_fnc_earthquake;
    playSound "blowoutStart";
    [
        ["Походу Anvil снова накосячил...", 4, 5],
        ["Нужно скорее найти укрытие...", 3, 5, 8]
    ] spawn BIS_fnc_EXP_camp_SITREP;
};
