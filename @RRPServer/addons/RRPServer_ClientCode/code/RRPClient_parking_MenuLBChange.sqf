

disableSerialization;
params ["_control","_index"];

private _key = _control lbValue _index;

_display = ctrlParent _control;
_hash = _display getVariable "cache";
_data = _hash get _key;
_data params ["_classname","_parking","_plate"]; 
ctrlShow[5703,true];
ctrlShow[5704,true];
_text = _display displayCtrl 5703;
_text ctrlSetStructuredText parseText format[
	"<t size='0.95'>" + 
	"Номер:" + " %1<br/>" +	
	"Примечание:" + " %2<br/>" +
	"Сумма штрафа:" + " $%3" +
	"</t>",
	_plate,	
	_parking select 1,
	[_parking select 0] call RRPClient_util_numberText
];
