/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745

    Syntax:
    [chanse] call RRPClient_farm_util_randomizer;

    Parameters:
    chanse : number

    Return:
    bool
*/
private ["_chanse","_random","_bingo"];
_chanse = param [0,0,[0]];

if (_chanse isEqualTo 0) then {};
_random = round random 99;
_bingo = if (_random <= _chanse) then {true} else {false};

_bingo
