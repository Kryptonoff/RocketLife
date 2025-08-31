/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
    ----
    Description:
    _xCoord = [(ctrlPosition _background),7,0.064,0.06] call RRPClient_gui_util_alignCtrl
    Parameters: 
    array:   Позиция относительно чего ровняем
    number:  Кол-во ctrl котрые выровниваем
    number:  Шаг по коорде W который делается для отрисовки следующего ctrl
    number:  Ширина ctrl который центрируем
	
	result: Х-координата для первого елемента в цыкле
*/
private ["_amountCtrl","_alignRelativCtrlPOS","_step","_alignRelativCtrlCENTER","_allposCtrl","_result","_Wcoord"];
_alignRelativCtrlPOS = _this param [0,[],[[]]];
_amountCtrl = _this param [1,0,[0]];
_step = _this param [2,0,[0]];
_Wcoord = _this param [3,0,[0]];
_alignRelativCtrlCENTER = (_alignRelativCtrlPOS select 3)/2;
_allposCtrl = if (_amountCtrl > 1) then {((_step * _amountCtrl) - (_step - _Wcoord))/2} else {_step/2};
_result  = _alignRelativCtrlCENTER - _allposCtrl;

_result
