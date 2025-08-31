/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private ["_tick","_timeCreateroosters","_sleep","_startPos","_radius","_amountRoosters"];
_timeCreateroosters = getNumber(missionConfigFile >> "LifeCfgSettings" >> "timeCreateroosters");
_radius = getNumber(missionConfigFile >> "LifeCfgSettings" >> "roostersRadius");
_amountRoosters = getNumber(missionConfigFile >> "LifeCfgSettings" >> "amount_roosters");
comment "debug";
if (call life_adminlevel > 0) then {
    _timeCreateroosters = 30;
    _radius = 20;
};

_tick = 0;
_sleep = 10;
_startPos = [];
roostersList = [];


while {true} do {
    if (count([player] call RRPClient_WarZone_util_getZoneInside) > 0) then {
        if (_tick isEqualTo 0) then {
            _startPos = getPos player;
        };

        comment "засиделся";
        if (_timeCreateroosters/_sleep <= _tick) then {
            if ((_startPos distance player) < _radius) then {
                if ((count roostersList) isEqualTo 0) then {
                    for "_i" from 0 to _amountRoosters do {
                        private _rooster = createAgent ["Animal_Rooster_Brown", getPosATL player, [], _radius/2, "FORM"];
                        [_rooster] call BIS_fnc_animalBehaviour;
                        roostersList pushBack _rooster;
                    };
                };
            };
            _tick = -1;
        };

        comment "вышел с зоны";
        if (((_startPos distance player) > _radius)) then {
            if (count roostersList > 0) then {
                {deleteVehicle _x} forEach roostersList;
                roostersList = [];
            };
            _tick = -1;
        };
        _tick = _tick + 1;
    } else {_tick = 0};
    uiSleep _sleep;
};
