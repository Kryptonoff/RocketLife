/*
	File: fn_init.sqf
	Function: asct_fnc_init
	Author: Vitaly 'mind' Chizhikov
	
	Description: Initizlize eventhandler
	WARNING! ASCT is supposed to be used ONLY as server addon.
	This function must not be directly called, it have postInit = 1 attribute.
*/

private _extVersion = "asct_ext" callExtension "VERSION";
private _pboVersion = "0.9.0.1";
if (_extVersion == "") then {
	diag_log "---ASCT initialization failed---";
	diag_log "---asct_ext.dll was not found---"
} else {
	diag_log "---ASCT initialized---";
	diag_log format ["---asct.pbo version %1---", _pboVersion];
	diag_log format ["---asct_ext.dll version %1---",_extVersion];
	asct_instanceID = "5b2342R";
	if (_extVersion != _pboVersion) then {
		diag_log "---Warning! Versions are not equal, there might be unpredictable errors!---";
	};
	
	asct_oefid = addMissionEventHandler ["EachFrame", {0 call asct_fnc_read}];
};