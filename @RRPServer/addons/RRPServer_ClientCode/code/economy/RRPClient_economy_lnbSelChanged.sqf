
params ["_control","_index"];
private _res = _control lnbData [_index,0];
(_res call RRPClient_economy_getResInfo) params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until"];

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
_display setVariable ["selected",_res];

private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 32000;

private _tabDescription = _slide controlsGroupCtrl 32016;
private _descCtrl = _tabDescription controlsGroupCtrl 32018;

// private _manText = _tabDescription controlsGroupCtrl 32017;
// _manText ctrlSetStructuredText parseText format ["<t size='1.1' align='center' font='RobotoCondensedBold'>%1</t>",_localize];

private _textPosition = ctrlPosition _descCtrl;
_descCtrl ctrlSetStructuredText parseText format [
"<t size='1.35' align='center' font='RobotoCondensedBold'>%1</t><br/>
<t align='center' font='RobotoCondensedLight' size='1' >%3</t><br/><br/><br/>
<t align='center' font='RobotoCondensed' size='0.9' >%8</t><br/><br/>
<t align='left' font='RobotoCondensed' size='0.85' >Блокировка: </t><t size='0.85' font='RobotoCondensedLight'>%7 Час.</t><br/>
<t align='left' font='RobotoCondensed' size='0.85' >Легальность: </t><t size='0.85' font='RobotoCondensedLight'>%5</t><br/>
<t align='left' font='RobotoCondensed' size='0.85' >Статус: </t><t size='0.85' font='RobotoCondensedLight'>%4</t><br/>
<t align='left' font='RobotoCondensed' size='0.85' >Вес: </t><t size='0.85' font='RobotoCondensedLight'>%9</t>
",
	_localize,
	nil,
	if (_locked_until isEqualTo "") then {format["<t color='#00af4c' >Активен</t><br/>"]} else {format ["<t color='#bb0000'>Заморожен<br/></t>До: %1",[_locked_until] call RRPClient_util_dateToString]},
	if (_prem) then {"Премиальный"} else {"Общий"},
	if (_legal) then {"Легальный"} else {"Нелегальный"},
	"",
	round(_locked_time/60),
	"",
	getNumber(missionConfigFile >> "VirtualItems" >> _resName >> "weight")
];
_textPosition set [3,((ctrlTextHeight _descCtrl) + (0.005 * safezoneH))];
_descCtrl ctrlSetPosition _textPosition;
_descCtrl ctrlCommit 0;
