/*
	File: fn_read.sqf
	Function: asct_fnc_read
	Author: Vitaly 'mind' Chizhikov
	
	Description: Get and execute provided expressions
	WARNING! ASCT is supposed to be used ONLY as server addon.
	
*/


if (isNil "asct_lc") then {asct_lc = 0};
if (isNil "asct_buffer") then {asct_buffer = ""};
if (asct_lc == -1) exitWith {};

if (asct_lc < 1) exitWith {asct_lc = asct_lc + (2/diag_fps)};

private _dataInRequest = format ["IN:%1", (if (isNil "asct_instanceID") then {0} else {asct_instanceID})];
asct_data = "asct_ext" callExtension _dataInRequest;

if (asct_data == "no_data") exitWith {
	asct_lc = 0;
};
if (asct_data == "error_data") exitWith {
	diag_log "ASCT ERROR: Unable to correctly read data";
	asct_lc = 0;
};
if (asct_data == "error_input") exitWith {
	diag_log "ASCT ERROR: Incorrect input detected";
	asct_lc = 0;
};
switch (asct_data) do {
	case "data_start": {asct_buffer = ""; asct_lc = 1;};
	case "data_end": {0 call compile asct_buffer; asct_lc = 0;};
	default {asct_buffer = asct_buffer + asct_data; asct_lc = 1;};
};
