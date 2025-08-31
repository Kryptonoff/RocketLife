
params ["_vehicle","_currentConfig"];
_config = getMissionConfig "LifeCfgAdac" >> "AdacSettings";

{
	_x params ["_upgrade",["_levels",0]];
	if (getText(_config >> _upgrade >> "type") isEqualTo "INT") then 
	{
		[
			_vehicle, 
			getText(_config >> _upgrade >> "variable"),
			_levels
		] call CBA_fnc_setVarNet;
		continue;
	};
	[
		_vehicle, 
		getText(_config >> _upgrade >> "variable"),
		true
	] call CBA_fnc_setVarNet;
} forEach _currentConfig;

true
