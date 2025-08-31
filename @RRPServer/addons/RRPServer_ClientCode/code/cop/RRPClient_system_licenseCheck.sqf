/*
	Filename: 	RRPClient_system_licenseCheck.sqf
	Project: 	Rimas Altis Life RPG
*/
private _cop = param[0, ObjNull, [ObjNull]];
if (isNull _cop) exitWith {};
private _licenses = "";

{
    if (missionNamespace getVariable[format["license_%1",getText(missionConfigFile >> "LifeCfgLicenses" >> configName _x >> "variable")], false]) then {
        _licenses = _licenses + ((getText(_x >> "displayName"))) + "<br/>";
    };
}forEach ("true" configClasses(missionConfigFile >> "LifeCfgLicenses"));

if (_licenses isEqualTo "") then { _licenses = "Лицензии отсутствуют" };
[player getVariable["realname", ""], _licenses] remoteExecCall["RRPClient_system_licensesRead", _cop];
