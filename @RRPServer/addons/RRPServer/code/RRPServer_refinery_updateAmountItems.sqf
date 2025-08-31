/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
    ["_ref","",[""]],
    ["_netID", "", [""]],
    ["_amount",-1,[-1]]
];
format ["refineryUpdateOil:%1:%2",_amount,_ref] call RRPServer_DB_fireAndForget;
