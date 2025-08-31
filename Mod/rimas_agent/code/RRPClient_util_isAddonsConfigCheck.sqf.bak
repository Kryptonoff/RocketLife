
private _ClassName = param [0,"",[""]];
if (_ClassName isEqualTo "") exitWith {false};

private _cfg = switch (true) do {
	case (isClass (configFile >> "CfgMagazines" >> _ClassName)) : {"CfgMagazines"};
	case (isClass (configFile >> "CfgWeapons" >> _ClassName)) : {"CfgWeapons"};
	case (isClass (configFile >> "CfgVehicles" >> _ClassName)) : {"CfgVehicles"};
	case (isClass (configFile >> "CfgGlasses" >> _ClassName)) : {"CfgGlasses"};
	default {""};
};

if (_cfg isEqualTo "") exitWith {false};
if !(_cfg isEqualType "") exitWith {false};
if !(isClass (configFile >> _cfg >> _ClassName)) exitWith {
    format ["isAddonsConfigCheck: В [%2] Аддонах нету такого КлассНейма [%1]",_ClassName,_cfg] call RRPClient_system_log; 
	format["isAddonsConfigCheck: В [%2] Аддонах нет такого КлассНейма [%1]",_ClassName,_cfg] call chat;
	false
};

private _return = true;

switch (true) do {
	case (_cfg in ["CfgMagazines","CfgWeapons"]) : {
	    if !(isClass(missionConfigFile >> "LifeCfgItems" >> _ClassName)) then {
	        format["isConfigCheck: В [LifeCfgItems] нету такого КлассНейма [%1]",_ClassName] call RRPClient_system_log;
			format["isConfigCheck: В [LifeCfgItems] нет такого КлассНейма [%1]",_ClassName] call chat;
			_return = false;
		};
	};
	case (_cfg isEqualTo "CfgVehicles") : {
	    if !(isClass(missionConfigFile >> "LifeCfgVehicles" >> _ClassName)) then {
		    format["isConfigCheck: В [LifeCfgVehicles] нету такого КлассНейма [%1]",_ClassName] call RRPClient_system_log;
			format["isConfigCheck: В [LifeCfgVehicles] нет такого КлассНейма [%1]",_ClassName] call chat;
			_return = false;
	    };
	};
	default {_return = true};
};

_return