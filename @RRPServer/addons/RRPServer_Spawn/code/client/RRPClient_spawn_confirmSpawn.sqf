
_display = uiNamespace getVariable ["RRPDialogSpawn",displayNull];
_spawnMarker = _display getVariable ["marker","Stolica_1"];
_hashSpawn = _display getVariable ["spawns",createHashMap];
_spawnData = (_hashSpawn get _spawnMarker) params ["","","_marker",["_city",false]];

private _camera = _display getVariable ["camera",objNull];
if !(isNull _camera) then {
	_camera camSetTarget player;
	_camera camSetPos (getPos player);
	_camera camCommit 3;
	waitUntil {(camCommitted _camera || isNull _camera)};
	if !(isNull _camera) then {
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
	};
};

player setAnimSpeedCoef 1;
player setUnitRecoilCoefficient 1;
