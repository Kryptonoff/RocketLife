
Goggles_Thread = [3,{
	if ((goggles player) in (getArray(getMissionConfig "LifeCfgSettings" >> "gasMask"))) then 
	{
		if !(RRPClientGasMaskVisible) then {
			RRPClientGasMaskVisible = true;
			LayerGasMask cutRsc ["RscGasMask", "PLAIN", 1, false];
		};
		if (alive player) then 
		{
			if (diag_tickTime >= GasMaskNextSoundAt) then 
			{
				playSound format ["Sound_GasMaskBreathing0%1", 1 + (floor (random 2))];
				GasMaskNextSoundAt = diag_tickTime + (2.2 + (random 1));
			};
		};
	}
	else 
	{
		RRPClientGasMaskVisible = false;
		LayerGasMask cutText ["", "PLAIN"]; 
	};

},[],true] call RRPClient_system_thread_addTask;

//-- Loop first person on stratis
FP_Stratis_Thread = [3, {
	RRPClientPlayerOnStratis = player call RRPClient_util_isInStratis;
	private _isInJail = player inArea 'prison_zone';
	if (RRPClientPlayerOnStratis OR {_isInJail}) then
	{
		if !(cameraView in ["INTERNAL","GUNNER"])  then
		{
			player switchCamera "INTERNAL";
		};
	};
}, [], true] call RRPClient_system_thread_addTask;

//-- Spawn units
NPC_Thread = [10,RRPClient_npc_spawnUnit,[],true] call RRPClient_system_thread_addTask;

//-- Enable whisper
Whisper_Thread = [3,{
	private _config = getArray(getMissionConfig "LifeCfgSettings" >> "whisperMarkers");
	if (player call getSide in ["cop","med"]) exitWith {};
	{
		_x params ["_marker","_radius"];
		_pos = getMarkerPos _marker;
		if (_pos isEqualTo [0,0,0]) then {continue};
		if (player distance2D _pos < _radius) then {
			if !(missionNamespace getVariable ["volume_change_block",false]) then 
			{
				["Зона тишины","Вы переключены на шепот"] call toastInfo;
				volume_change_block = true;
				TF_speak_volume_meters = 5;
			};
		}else{
			if (missionNamespace getVariable ["volume_change_block",false]) then {
				["Зона тишины","Переключение громкости разблокировано"] call toastInfo;
				volume_change_block = false;
			};
		};
	} forEach _config;
},[],true] call RRPClient_system_thread_addTask;

//-- Limit speed in green zones
LimitSpeed_Thread = [1,{
	_vehicle = objectParent player;
	if !(isNull _vehicle) then {
		if (_vehicle isKindOf "Air") exitWith {};
		getCruiseControl _vehicle params ["_speed","_limiter"];
		if (([_vehicle] call RRPClient_system_isSafeZone) select 0 || {([_vehicle] call RRPClient_system_isSafeZone) select 1}) then 
		{
			if (_speed isEqualTo 0) then 
			{
				["Безопасная зона!","Ограничитель скорости включен"] call toastInfo;
				_vehicle setCruiseControl [50,false];
			};
		}else{
			if (_speed isNotEqualTo 0) then 
			{
				["Безопасная зона!","Ограничитель скорости выключен"] call toastInfo;
				_vehicle setCruiseControl [0,false];
			};
		};
	};
},[],true] call RRPClient_system_thread_addTask;

CacheSystem = [1, RRPClient_cache_loop, [], true] call RRPClient_system_thread_addTask;
