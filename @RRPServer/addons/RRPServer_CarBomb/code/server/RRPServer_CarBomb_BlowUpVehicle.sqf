params ["_player","_vehicle","_time"];
[
    "hell","","","",false,
    [
        [
            "Не выжил!",
            [
                format ["%1 не выжил на %2",_player call getFullName,getText(configOf _vehicle >> "displayName")],
                format ["Время выживания: %1",[_time,"MM:SS"] call BIS_fnc_secondsToString]
            ] joinString "\n",
            "",
            "FF0000",false,"","",[],[]
        ]
    ]
]call DiscordEmbedBuilder_fnc_buildSqf;
_player setVariable ["PlayOfTheGame",true];
_vehicle setDamage 1;
[_player,_vehicle] spawn {
    params ["_player","_vehicle"];
    uiSleep 5;
    _player action ["Eject",_vehicle];
    [_player] remoteExec ["RRPClient_system_revived",_player];
}; 
