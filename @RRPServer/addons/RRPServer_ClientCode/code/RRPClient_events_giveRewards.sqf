

_cur = curTarget;
try{
	if (isNil "_cur") throw "Игрок не найден";
	if (isNull _cur) throw "Игрок не найден";
	if !(isPlayer _cur) throw "Это не игрок";
	if (player isEqualTo _cur) throw "Нельзя дать себе";
	if (player distance _cur > 5) throw "Слишком далеко";
	if !(alive _cur) throw "Игрок мертв";

	createDialog "RRPDialogGiveEvent";
	private _display = uiNamespace getVariable ["RRPDialogGiveEvent",displayNull];
	_display setVariable ["cur",_cur];
	_textCtrl = _display displayCtrl 3901;
	_textCtrl ctrlSetStructuredText parseText format ["<t size='1' align='center'>Вы даете игроку %1 награду в тайник</t>",_cur call getNickFullName];
	
	_currencyComboCtrl = _display displayCtrl 3902;
	{
		_x params ["_currency","_currencyName"]; 
		_index = _currencyComboCtrl lbAdd _currencyName;
		_currencyComboCtrl lbSetData [_index,_currency];
		_currencyComboCtrl lbSetPicture [_index,_currency call RRPClient_util_currencyIcon];
	}forEach [
		["RRPAtm","A.D."],
		["RRPTRX","TRX"]
	];
	_currencyComboCtrl lbSetCurSel 0;
	
	_giveButton = _display displayCtrl 3904;
	_giveButton ctrlSetText "Выдать";
	_giveButton ctrlEnable true;
	_giveButton ctrlAddEventHandler ["ButtonClick",{
		params ["_ctrl"];
		_display = ctrlParent _ctrl;
		_unit = _display getVariable ["cur",objNull];
		_currencyComboCtrl = _display displayCtrl 3902;
		_currency = _currencyComboCtrl lbData (lbCurSel _currencyComboCtrl);
		_val = parseNumber (ctrlText(_display displayCtrl 3903));
		[
			(uiNamespace getVariable ["RRPDialogGiveEvent",displayNull]),
			{
				["addRewardsRequest", 
					[
						getPlayerUID (_this select 0), 
						[
							[_this select 1,_this select 2]
						]
					]
				] call RRPClient_system_send;
				["Награда выдана"] call toastSuccess;
				closeDialog 0;
			},[_unit,_currency,_val],
			"Выдать награду?",
			format["Вы хотите выдать игроку %1 %2<img size='1' image='%3'/>?",_unit call getNickFullName,[_val] call RRPClient_util_numberText,_currency call RRPClient_util_currencyIcon]
		] call RRPClient_util_prompt;
	}];
}catch{
	[_exception] call toastError;
};
true