
params [
	["_isSuccess",true],
	"_text"
];

if (_isSuccess) then {
	if !(canSuspend) exitWith {_this spawn RRPClient_char_confirmResponse};	
	["SuccessTitleAndText",["Создание персонажа",_text]] call toast;
	
	private _display = uiNamespace getVariable ["RRPDialogCharCreate",displayNull];
	{
		[_display, _x, ctrlPosition _x, 1, 0.5] call RRPClient_gui_util_animateAllCtrl;
		_x ctrlEnable false;
	} forEach (allControls _display);

	_script = [0, "BLACK",2, 0] spawn BIS_fnc_fadeEffect;
	waitUntil {scriptDone _script};
	closeDialog 0;
	cutText[format["Отправка запроса на сервер для информации об игроке с UID [%1]",getPlayerUID player],"BLACK FADED"];
	0 cutFadeOut 999999999;
	[1, "BLACK",2, 0] spawn BIS_fnc_fadeEffect;
	call RRPClient_session_dataQuery;
}else{
	ctrlEnable [26103,true];
	["ErrorTitleAndText",["Создание персонажа",_text]] call toast;
};
RRPClientAtmWaitingResponse = false;
true
