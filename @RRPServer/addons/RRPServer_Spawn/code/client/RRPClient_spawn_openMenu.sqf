RRPClient_spawn_openMenu = {
	
if !(canSuspend) exitWith {_this spawn RRPClient_spawn_openMenu};
try{
	comment "Получаем список возможных спавнов в HashMap, ключ = название конфига";
	_hashSpawns = call RRPClient_spawn_getAllowedPoints;
	createDialog "RRPDialogSpawn";
	private _display = uiNamespace getVariable ["RRPDialogSpawn",displayNull];
	_display displaySetEventHandler ["keyDown","_this call RRPClient_spawn_onKeyDown"];

	_list = _display displayCtrl 38510;
	_ctrlMap = _display displayCtrl 38502;
	
	comment "Хеш с спавнами";
	_display setVariable ["spawns",_hashSpawns];

	comment "Включаем камеру";
	_camera = "camera" camCreate [0,0,0];
	_camera cameraEffect ["internal","back"];
	_camera camPrepareFov 0.9;
	_camera camSetFocus [-1,-1];
	_camera camCommitPrepared 0;
	showCinemaBorder true;
	_display setVariable ["camera",_camera];

	private _dir = 0;
	private _time_sleep = 0.1;
	private _height = 150;
	private _height_standart = _height;
	private _markerNameOld = "";

	comment "Рисуем список";
	{
		(_hashSpawns get _x) params ["_displayName","_icon","_spawnMarker","_city"];
		_index = _list lbAdd _displayName;
		_list lbSetPicture [_index, _icon];
		comment "В дату добавляем только ключ хеша, сам хеш висит на дисплее";
		_list lbSetData [_index, _x];
	} forEach (keys _hashSpawns);
	_list lbSetCurSel 0;

	waitUntil {
		comment "Получаем маркер, который выбрал игрок";
		_marker = (_hashSpawns get (_display getVariable ["marker","Stolica_1"])) select 2; 
		_markerPos = getMarkerPos _marker;

		comment "Рендерим камеру";
		_newPos = [_markerPos, 60, _dir] call BIS_fnc_relPos;

		_tempZ = _newPos select 2;
		_tempWaterZ = getTerrainHeightASL _newPos;
		if (_height < _tempWaterZ) then {_height = _tempWaterZ + _height};
		_newPos set [2,_height - _tempWaterZ];

		_camera camSetPos _newPos;
		_camera camSetTarget _markerPos;

		if !(missionNameSpace getVariable ["spawn_active",false]) then {
			_camera camCommit (if (_markerNameOld isEqualTo _marker) then {_time_sleep} else {0});
			waitUntil {camCommitted _camera};
		};

		if !(_markerNameOld isEqualTo _marker) then {
			ctrlMapAnimClear _ctrlMap;
			_ctrlMap ctrlMapAnimAdd [1,0.1,(getMarkerPos _marker)];
			ctrlMapAnimCommit _ctrlMap;
			_height = _height_standart;
			_markerNameOld = _marker;
		};

		comment "Крутим камеру";
		_dir = _dir + 1;
		if (_dir > 360) then {_dir = 0};

		((isNull _display) || {(missionNameSpace getVariable ["spawn_active",false])})

	};
}catch{
	call RRPClient_system_respawned;
};
true
}