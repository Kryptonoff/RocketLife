params [
    ["_kills", 0, [0]],
    ["_deaths", 0, [0]],
    ["_lvl", 0, [0]],
    ["_pid", "", [""]]
];
format ["partyMeatFinish:%1:%2:%3:%4",_kills,_deaths,_lvl,_pid] call RRPServer_DB_fireAndForget;
