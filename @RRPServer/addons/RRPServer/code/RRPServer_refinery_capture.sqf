/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
	["_refinery_control", objNull, [objNull]],
	["_refinery_var", "", [""]],
	["_player_gang_name", "", [""]],
	["_player_gang_id", -1,[-1]],
	["_license", "", [""]]
];

_refinery_control setVariable ["ref_status", "Captured", true];
_refinery_control setVariable ["ref_gang_id", _player_gang_id, true];
_refinery_control setVariable ["ref_gang_name", _player_gang_name, true];
_refinery_control setVariable ["ref_license", _license, true];

[_refinery_var,_license] call RRPServer_refinery_setFlag;
format ["refineryUpdateOwner:%1:%2:%3:%4", _player_gang_name, _player_gang_id,_license, _refinery_var] call RRPServer_DB_fireAndForget;

if (_license isEqualTo 'police') then {
	["Police",format ["Сотрудниками полицейского департамента была обезврежена %1!", (_refinery_control getVariable ["ref_name", "Нарколабу"])]] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];
} else {
	["Захват!",format ["Организация %1 захватила %2!", _player_gang_name, (_refinery_control getVariable ["ref_name", "Нарколабу"])]] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];
}
