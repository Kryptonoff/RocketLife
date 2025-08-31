/*
	Filename: 	RRPClient_system_setPlayerLicense.sqf
	Project: 	Rimas Altis Life RPG

*/
params [
	["_admin",ObjNull,[ObjNull]],
	["_mode","",[""]]
];

if (!isClass (missionConfigFile >> "LifeCfgLicenses" >> _mode)) exitWith {["Не удалось найти лицензию","error"] call hints};

private _gangLicense = getNumber(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "gang");
if (_gangLicense isEqualTo 0) exitWith {["Похоже, что это не лицензия группировки","error"] call hints};

if !(missionNamespace getVariable [format ["license_%1",getText(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "variable")],false]) then {
	missionNamespace setVariable [format ["license_%1",getText(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "variable")],true];

	[format["%1 включил вам лицензию ""%1""",_admin getVariable ["realname",""],getText(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "displayName")]] call hints;
	[1,format["Вы успешно прописали ""%1"" для %2",getText(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "displayName"),player getVariable ["realname",""]]] remoteExecCall ["RRPClient_system_broadcast",_admin];
} else {
	missionNamespace setVariable [format ["license_%1",getText(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "variable")],false];

	[format["%1 отключил вам лицензию ""%1""",_admin getVariable ["realname",""],getText(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "displayName")]] call hints;
	[1,format["Вы успешно отключили ""%1"" для %2",getText(missionConfigFile >> "LifeCfgLicenses" >> _mode >> "displayName"),player getVariable ["realname",""]]] remoteExecCall ["RRPClient_system_broadcast",_admin];
};

call RRPClient_system_setTag;
[2] call RRPClient_session_updatePartial;
