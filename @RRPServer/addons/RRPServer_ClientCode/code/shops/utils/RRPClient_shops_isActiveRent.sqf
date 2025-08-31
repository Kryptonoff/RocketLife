/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
private _groupID = (player getVariable ["groupID",-1]);
if (_groupID isEqualTo -1) then {false} else {
    [_this, _groupID] in groupRentItemsList
};
