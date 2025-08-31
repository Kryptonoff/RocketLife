#include "..\script_macros.hpp"
params [
	["_text","",[""]],
	["_type","info",[""]]
];
if (EQUAL(_text,"")) exitWith {};
disableSerialization;
["BottomNotification","PLAIN",1,true] call RRPClient_gui_CreateRscLayer;
private _ui = GVAR_UINS ["BottomNotification",displayNull];

private _msg_head = switch (_type) do { 
	case "info": {"Инфо: "};
	case "warning": {"Внимание: "};
	case "news": {"Новости: "};
	case "done": {"Готово: "};
	case "error": {"Ошибка: "};
	case "money": {"Деньги: "};
	case "police": {"Полиция: "};
};
private _msg_color = switch (_type) do { 
	case "info": {[0.514,0.518,0.541,0.75]};
	case "warning": {[0.98,0.604,0,0.75]};
	case "news": {[0.369,0.969,0.941,0.75]};
	case "done": {[0.584,0.871,0.384,0.75]};
	case "error": {[0.678,0.102,0.102,0.75]};
	case "money": {[0.969,0.949,0.369,0.75]};
	case "police": {[0.173,0.306,0.961,0.75]};
};
playSound "notification";
(_msg_head + _text) call chat;
private _ctrlText = _ui displayCtrl 24901;
private _ctrlTile = _ui displayCtrl 24902;
_ctrlTile ctrlSetBackgroundColor _msg_color;
_ctrlText ctrlSetStructuredText parseText format ["<t valign='middle' align='center'>%1</t>", _text];
_ctrlText ctrlSetPositionH (ctrlTextHeight _ctrlText);
_ctrlText ctrlCommit 0;
life_notifications pushBack [(server_timeText splitString " " select 3) select [1,5],_type,_text];
