
params ["_configPath","_var"];
private _config = getMissionConfig "CfgLtds" >> "casino";
private _ret = ["rrp_objects\textures\SM_R_01.paa","rrp_objects\textures\SM_R_02.paa"];

if !(isClass (_config >> _configPath)) exitWith {_ret};
{
	if (_x select 1 isEqualTo _var) exitWith 
	{
		_ret = _x select 2;
	};
}forEach getArray(_config >> _configPath >> "textureList");

_ret
