
params ["_hc"];
HC_UID = getPlayerUID _hc;

HC_Life = owner _hc;
publicVariable "HC_Life";
[true] call RRPServer_system_transferOwnership;
RRPHC_enable = true;
publicVariable "RRPHC_enable";

format ["Headless client is connected and ready to work! (%1 | %2) ~1111",HC_UID, HC_Life] call RRPServer_util_debugConsole;