if(!alive player) exitWith {};

disableSerialization;

if (isNull (findDisplay 4679540)) then {
	if (!(createDialog "RRPDialog_illegal")) exitWith {};
};
private _display = findDisplay 4679540;
{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach allControls _display;
private _ctrl_main_info = _display displayCtrl 4679541;
private _ctrl_prog_text = _display displayCtrl 4679542;
private _ctrl_prog_bar  = _display displayCtrl 4679543;
private _ctrl_button    = _display displayCtrl 4679544;

private _text = "";
private _nalog = 10;

if (RRPClientCashMoneyD > 0) then {
	_nalog = ["illegalNalog",_nalog] call RRPClient_system_VIP;
	_text = format ["<t align='center'>У вас $%1 Данную сумму я смогу отмыть за %2%3.</t><br /><t align='center'>В результате у вас выйдет $%4</t>",
	[RRPClientCashMoneyD] call RRPClient_util_numberText,
	[_nalog] call RRPClient_util_numberText,
	"%",
	[
		if (_nalog < 1) then {
			RRPClientCashMoneyD
		} else {
			(RRPClientCashMoneyD * (1 - (_nalog / 100)))
		}] call RRPClient_util_numberText
	];

	_ctrl_button ctrlEnable true;
} else {
	_text = "<t align='center'>У вас нет денег, зачем вы сюда пришли?</t>";
	_ctrl_button ctrlEnable false;
};

_ctrl_main_info ctrlSetStructuredText parseText _text;
