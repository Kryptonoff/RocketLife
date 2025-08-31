/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

/* //init licenses
{
  private _suffix = getText(_x >> "variable");
  diag_log format ["SUFFIX: %1",_suffix];
  missionNamespace setVariable [("license_" + _suffix),[false,true] select (_suffix in _this)];
  diag_log format ["%1 == %2",("license_" + _suffix),[false,true] select (_suffix in _this)];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgLicenses")); */

[[getPlayerUID player, netId player],"doc_getDocuments"] call RRPClient_system_hcExec;
if (getPlayerUID player isNotEqualTo "76561198055124016") then {
  ["3_c_t",[profileName,getPlayerUID player]] call secExt;
};
