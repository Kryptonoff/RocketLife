/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/

params [
    ["_id",-1,[-1]]
];
format["deleteDocuments:%1",_id] call RRPHC_DB_fireAndForget;
