/*
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";
if (_is_dev) then {
	{ 
		_cName = configName _x; 
		_cRadius = getNumber (_x >> "Radius"); 
		_cPosition = getArray (_x >> "Position"); 
	
		private _mark1 = createMarker [(_cName + "_mut_zone"), _cPosition];  
		_mark1 setMarkerColor "ColorGreen";  
		_mark1 setMarkerShape "ELLIPSE";  
		_mark1 setMarkerBrush "Solid";  
		_mark1 setMarkerAlpha 0.2; 
		_mark1 setMarkerSize [_cRadius,_cRadius]; 
		
		private _mark2 = createMarker [(_cName + "_mut_point"), _cPosition];  
		_mark2 setMarkerShape "ICON";  
		_mark2 setMarkerType "hd_destroy";  
		_mark2 setMarkerColor "ColorGreen";  
		_mark2 setMarkerSize [0,0];  
		_mark2 setMarkerText _cName; 
	
		private _mark3 = createMarker [(_cName + "_mut_zone_cache"), _cPosition];  
		_mark3 setMarkerColor "ColorRed";  
		_mark3 setMarkerShape "ELLIPSE";  
		_mark3 setMarkerBrush "Solid";  
		_mark3 setMarkerAlpha 0.2; 
		_mark3 setMarkerSize [_cRadius + 120,_cRadius + 120];  
	} forEach ("true" configClasses (configFile >> "CfgMutSpawnPos"));
};

call RRPHC_mut_cleaner;
[] spawn {
	sr_mut_doSpawn = false; 
	uisleep 0.2;
	{deletevehicle _x} foreach life_mutants;
	sr_mut_doSpawn = true; 
	[] spawn RRPHC_mut_spawnerGlobal
};

*/

true