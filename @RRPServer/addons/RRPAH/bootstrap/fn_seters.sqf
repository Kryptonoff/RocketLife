
setInspect = {

	params ["_object"];
	[_object, (getObjectTextures _object) select 0] call BIS_fnc_initInspectable; 

};
setInspect = compileFinal ([setInspect] call RRPAH_util_compilableString);
publicVariable "setInspect";

insertKillLog = {
	params [
		"_uid",
		["_weapon",""],
		"_log"
	];
	if (_weapon isEqualTo "") then {_weapon = "undefined"};
	format ["insertKillLog:%1:%2:%3",_uid, [_weapon] call RRPClient_util_stripChars, _log] call RRPServer_DB_fireAndForget;
	true
};
