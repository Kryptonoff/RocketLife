/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private _res = [];
if (((player getVariable ["groupID",-1]) isEqualTo _this)) then {
    {
        if ([_x # 2] call RRPClient_util_conditionsCheck) then {_res pushBack _x};
    } forEach getArray(missionConfigFile >> "labs_items" >> "items");
};


_res
