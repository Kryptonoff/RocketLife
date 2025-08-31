/*

	Filename:	RRPClient_hotkeys_deleteBind.sqf
	Project:	Fatum Altis Life
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
disableSerialization;
private _display = findDisplay 15700;
if (isNull _display) exitWith {diag_log "Error tablet: Init failed, display does not load."};

params [
	["_type_del","",[""]],
	["_advInfo",[],[[]]]
];

private _getControl = _display getVariable "getControl";

switch (_type_del) do {
	case "number": {
		for "_i" from 0 to 8 do {
			_ctrlPicture = ("main_button_pic_" + str _i) call _getControl;
			_ctrlPicture ctrlSetText "";
			bind_number_array set [_i,["",""]];
		};
	};
	case "f_nubmer": {
		for "_i" from 9 to 16 do {
			_ctrlPicture = ("main_button_pic_" + str _i) call _getControl;
			_ctrlPicture ctrlSetText "";
			bind_f_number_array set [(_i - 9),["",""]];
		};
	};
	default {
		/* code */
	};
};