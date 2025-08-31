/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
params [
  ["_kills", 0, [0]],
  ["_deaths", 0, [0]],
  ["_deposit", 0, [0]],
  ["_lvl", 0, [0]],
  ["_pid", "", [""]]
];
format ["updateStats:%1:%2:%3:%4:%5",_kills,_deaths,_deposit,_lvl,_pid] call RRPServer_DB_fireAndForget;
