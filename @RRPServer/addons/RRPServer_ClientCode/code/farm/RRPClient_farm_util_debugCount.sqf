params [
    ["_defaultTime",1],
    ["_currentLvl",1],
    ["_maxLvl",50],
    ["_curentAmountItem",1],
    ["_vip",0],
    ["_slots",500]
];

private ["_savingTime"];
_savingTime =  [_maxLvl,_currentLvl,_defaultTime] call RRPClient_util_countSavingTime;
private _evarageAmountArr = 0;
for "_i" from 1 to _slots do {
    private _amount = ceil(random _curentAmountItem);
    _evarageAmountArr = _evarageAmountArr + _amount;
};

private _evarage = (_evarageAmountArr / _slots);


private _body = format["
Среднее кол-во айтемов: %1 <br/>
Скорость добычи 1го айтема: %2 сек <br/>
Общая скорость добычи: %3 мин <br/>
",_evarage,_savingTime,(_slots * _savingTime)/60];

{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

_str ctrlSetStructuredText parseText format ["<t color = '#ffffff' align = 'center'><t size = '1.7'><br/>%1</t><br/><br/><br/>%2</t>","",_body];
