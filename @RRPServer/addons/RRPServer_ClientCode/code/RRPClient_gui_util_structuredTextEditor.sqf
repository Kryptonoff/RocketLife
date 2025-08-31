/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPClient_gui_util_structuredTextEditor};
private ["_type","_display","_text","_max","_ctrl","_amount","_amount1","_amount2","checktext"];
_type = param [0, -1, [0]];
if(_type isEqualTo -1) exitWith {};
if(_type isEqualTo 0) exitWith 
{
	disableSerialization;
	createDialog "RRPDialogGroupDecription";
	_display = uiNamespace getVariable ["RRPDialogGroupDecription",displayNull];
	_display displayAddEventHandler ["KeyDown", "
		if(((_this select 1) isEqualTo 28) && !(_this select 2)) then {
			systemChat 'Используй SHIFT + ENTER!';
		};
	"];
	_text = "";
	_max = 100000;
	ctrlSetText[220064,format["%1/%2",(count toArray(_text))-1,_max]];
	ctrlSetText [220063,_text];
	disableSerialization;
	_ctrl = (findDisplay 4000) displayCtrl 220062;
	while {!isNull (findDisplay 4000)} do {
		_text = toArray(ctrlText 220063);
		_amount = count _text;
		if(_amount > _max) then {
			_text = _text select [0,_max];
			ctrlSetText[220063,toString(_text)];
		};
		if(!(ctrlShown _ctrl)) then {
			((findDisplay 4000) displayCtrl 220061) ctrlSetStructuredText parseText (toString(_text));
		};
		ctrlSetText[220064,format["%1/%2",_amount,_max]];
		uiSleep 0.1;
	};
};
if(_type isEqualTo 1) exitWith 
{
	_text = ctrlText 220063;
	_checktext = toArray _text;
	_amount1 = 0;
	_amount2 = 0;
	{
		if(_x isEqualTo 39) then {
			_amount1 = _amount1 + 1;
		} else {
			if(_x isEqualTo 34) then {
				_amount2 = _amount2 + 1;
			};
		};
	} forEach _checktext;
};