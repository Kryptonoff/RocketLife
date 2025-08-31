
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide =     _mainGroup controlsGroupCtrl 26000;
private _cPlayerList = 		_slide controlsGroupCtrl 88881;
private _cMessageList = 	_slide controlsGroupCtrl 88882;
private _cMessageHeader = 	_slide controlsGroupCtrl 88886;
_cMessageHeader ctrlSetText format["От кого: Сообщение:"];
ctrlEnable[887892, false];

lbClear _cPlayerList;
lbClear _cMessageList;
private _west = [];
private _east = [];
private _civ = [];
private _ind = [];
private _color = [255, 235, 205, 1];
private _text = "";

{
	if (alive _x && {_x getVariable ["lifeState", ""] isEqualTo "HEALTHY"} && {_x != player} && {_x getVariable ["realname", ""] != ""}) then
	{
		switch(_x call getSide) do
		{
			case "cop": {_west pushBack _x;};
			case "civ": {_civ pushBack _x};
			case "med": {_east pushBack _x};
			case "reb": {_ind pushBack _x};
		};
	};
} forEach playableUnits;

{
	_cPlayerList lbAdd format ["%1", _x call getFullName];
	_cPlayerList lbSetData [(lbSize _cPlayerList)-1, str(_x)];
} forEach _west;

{
	_cPlayerList lbAdd format ["%1", _x call getFullName];
	_cPlayerList lbSetData [(lbSize _cPlayerList)-1, str(_x)];
} forEach _east;

{
	_cPlayerList lbAdd format ["%1", _x call getFullName];
	_cPlayerList lbSetData [(lbSize _cPlayerList)-1, str(_x)];
} forEach _ind;

{
	_cPlayerList lbAdd format ["%1", _x call getFullName];
	_cPlayerList lbSetData [(lbSize _cPlayerList)-1, str(_x)];
	_cPlayerList lbSetColor [(lbSize _cPlayerList)-1, _color];
} forEach _civ;

lbSort [_cPlayerList, "ASC"];
[[player], "msg_msgRequest"] call RRPClient_system_hcExec;

ctrlEnable[887892, false];
