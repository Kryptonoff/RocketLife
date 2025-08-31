
try
{
	if ( !alive player) throw "Вы мертв";
	disableSerialization;
	if (isNull (findDisplay 4679540)) throw "Ошибка!";
	private _display = findDisplay 4679540;

	/*****************************************************
	***dialog control*************************************
	******************************************************/
	private _ctrl_main_info = _display displayCtrl 4679541;
	private _ctrl_prog_text = _display displayCtrl 4679542;
	private _ctrl_prog_bar  = _display displayCtrl 4679543;
	private _ctrl_button    = _display displayCtrl 4679544;

	_ctrl_button ctrlEnable false;

	private _nalog = 10;
	_nalog = ["illegalNalog",_nalog] call RRPClient_system_VIP;

	private _tmp_iCash = RRPClientCashMoneyD;
	private _iCash = if (_nalog < 1) then {
		RRPClientCashMoneyD
	} else {
		(RRPClientCashMoneyD * (1 - (_nalog / 100)))
	};

	//Запускаем прогресс бар
	_ctrl_prog_bar progressSetPosition 0;
	_cancel = false;
	for "_i" from 0 to 100 do {
		uiSleep 0.03;
		_ctrl_prog_bar progressSetPosition (_i / 100);
		_ctrl_prog_text ctrlSetText format ["%1%2",_i,"%"];
		if ((isNull _display) || (call RRPClient_system_isInterrupted)) exitWith {_cancel = true};
	};

	_ctrl_prog_bar ctrlShow false;
	_ctrl_prog_text ctrlShow false;

	if (_cancel) throw "Ошибка";
	if !(_tmp_iCash isEqualTo RRPClientCashMoneyD) throw "Ошибка";

	closeDialog 0;

	if ((call RRPClient_system_isInterrupted) || {(player getVariable ["restrained",false])}) throw "Ошибка";

	[[player,"dcash","swap",_iCash,[format["%1 (%2) отмыл %3",name player,getPlayerUID player,[_iCash] call RRPClient_util_numberText]]],"system_moneyChange"] call RRPClient_system_hcExec;
	["InfoTitleOnly", [format ["$%1 получилось отмыть",[_iCash] call RRPClient_util_numberText]]] call SmartClient_gui_toaster_addTemplateToast;
	['blm',iCash] call RRPClient_ach_gateway;

}catch{
	["InfoTitleOnly",[_exception]] call toast;
};
true
