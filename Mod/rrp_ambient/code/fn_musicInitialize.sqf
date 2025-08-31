if (isNil "RRPClient_system_thread_addtask") exitWith {};

// Если музыка выключена в настройках - останавливаем всё и выходим
if (!isNil "life_music" && {!life_music}) exitWith {
    playMusic "";
    0 fadeMusic 0;
    setMusicEventHandler ["MusicStart", ""];
    setMusicEventHandler ["MusicStop", ""];
    if (!isNil "MusicLoop") then {
        [MusicLoop] call RRPClient_system_thread_removeTask;
        MusicLoop = nil;
    };
};

// Если музыка включена - запускаем систему
RRPClientCurrentMusic = "";
RRPClientLastMusicmode = "";
RRPClientCurrentMusicMode = "ambients";
0 fadeMusic 0.01;
setMusicEventHandler ["MusicStart","RRPClientCurrentMusic = _this select 0"];
setMusicEventHandler ["MusicStop","RRPClientCurrentMusicMode call FT_fnc_musicChange"];
playMusic "Soft_Ambient";
15 fadeMusic 0.3;

// Удаляем старый MusicLoop, если он есть
if (!isNil "MusicLoop") then {
    [MusicLoop] call RRPClient_system_thread_removeTask;
};

// Запускаем новый MusicLoop
MusicLoop = [1 ,FT_fnc_musicLoop, [], true] call RRPClient_system_thread_addtask;
true