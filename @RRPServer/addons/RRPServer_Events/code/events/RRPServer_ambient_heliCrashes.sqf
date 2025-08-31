
private _spawnLoot = {

};

try 
{
	private _config = configfile >> "CfgEvents" >> "HeliCrash" >> "config";
	private _maxCrashes = getNumber(_config >> "maxCrashes");
	private _classnames = getArray(_config >> "wrecks");
	private _smoke = getNumber(_config >> "smoke") isEqualTo 1;
	private _marker = getNumber(_config >> "marker") isEqualTo 1;
	if (_maxCrashes == 0) throw "Spawning Heli Crashes turned off";
	_center = [[4096,4096],5000];
	
	private _blacklistPos = [];
	for "_i" from 1 to _maxCrashes do
	{
		_classname = selectRandom _classnames;
		_spawnPos = [];
		_spawnPos = [(_center select 0), 0, (_center select 1), 20, 0, 0.25, 0, _blacklistPos,[0,0]] call BIS_fnc_findSafePos;
		_spawnPos set [2,0];
		_blacklistPos pushBack [_spawnPos,500];
		_heliCrash = createSimpleObject [_classname, ATLToASL _spawnPos];
		
		_heliCrash setDir (random 360);
		_heliCrash setPosATL _spawnPos;
		_heliCrash setVectorUp surfaceNormal position _heliCrash;
		
		if(_smoke) then 
		{
			_effect = "test_EmptyObjectForSmoke" createVehicle (getPosWorld _heliCrash);
			_effectPos = _spawnPos vectorAdd [0,0,-1];
			_effect setPosWorld _effectPos;
		};
		diag_log format["RRPServer_ambient_heliCrashes: %1 spawned at %2", _classname, _spawnPos];

		if (_marker) then
		{
			_mark = createmarker [format["Crash Position %1 - 2",_spawnPos], _spawnPos];
			_mark setMarkerShape "ICON";
			_mark setMarkerColor "ColorWhite";
			_mark setMarkerType "KIA";
		};
		
		_spawnPos call _spawnLoot;
	};
}
catch
{
	format ["RRPServer_ambient_heliCrashes: %1", _exception] call RRPServer_util_log;
};