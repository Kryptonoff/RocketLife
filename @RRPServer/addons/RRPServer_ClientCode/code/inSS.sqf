/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_res","_groupID"];
_res = false;
_groupID = (player getVariable ["groupID",-1]);

{
    if ((_x in secretShop) OR ([_x,_groupID] in groupRentItemsList)) exitWith {_res = true};
} forEach _this;

_res
