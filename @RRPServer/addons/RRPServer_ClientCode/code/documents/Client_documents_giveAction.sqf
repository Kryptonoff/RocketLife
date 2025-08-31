
_strip = {
	params [
		["_text","",[""]],
		["_filter","([""]:;%{})",[""]]
	];

	if (_text isEqualTo "") exitWith {""};
	_ret = _text splitString _filter joinString "";
	_ret

};

private _unit = (param [0,"",[""]]);
_unit = objectFromNetId _unit;
try {
	private ["_docList","_docName","_docDescription","_docTimeDay","_giveButton","_select","_docClass","_docNameText","_docDescriptionText","_docTimeDayText","_error","_filter","_maxLenght","_minLenght","_string"];
	if (_unit isEqualTo "") throw "Игрок для выдачи документов не найден! 1";
	if (isNull _unit) throw "Игрок для выдачи документов не найден! 2";
	if !(isPlayer _unit) throw "Игрок для выдачи документов не найден! 3";

	disableSerialization;
	_docList = ((findDisplay 7700) displayCtrl 2652);
	_docName = ((findDisplay 7700) displayCtrl 2653);
	_docDescription = ((findDisplay 7700) displayCtrl 2654);
	_docTimeDay = ((findDisplay 7700) displayCtrl 2655);
	_giveButton = ((findDisplay 7700) displayCtrl 2656);

	_select = (lbCurSel _docList);
	if (_select isEqualTo -1) throw "Вы не выбрали документ!";

	_docClass = _docList lbData _select;
	if (_docClass isEqualTo "") throw "Вы не выбрали документ!";

	_docNameText = ctrlText _docName;
	_docDescriptionText = ctrlText _docDescription;
	_docTimeDayText = ctrlText _docTimeDay;

	_maxLenght = 128;
	_minLenght = 3;
	_docDescriptionText = _docDescriptionText splitString endl joinString "<br/>";

	_string = toArray _docNameText;

	if ((count _string) > _maxLenght) throw format["Название не может быть длиннее %1 символов.",_maxLenght];
	if ((count _string) < _minLenght) throw "Название не может быть короче 3 символов";

	_maxLenght = 800;
	_string = toArray _docDescriptionText;

	if ((count _string) > _maxLenght) throw "Описание не может быть длиннее %1 символов";
	if ((count _string) < _minLenght) throw "Описание не может быть короче 6 символов";

	if (_docTimeDayText isEqualTo "") throw "Неверно указано время действия документа.";
	if ((parseNumber _docTimeDayText) > 90) throw "Максимальное время действия документа 90 дней.";

	[_docClass,[_docNameText] call _strip,[_docDescriptionText] call _strip,_docTimeDayText,(netId player)] remoteExecCall ["Client_documents_giveReceived",_unit];
	closeDialog 0;
} catch {
	["ErrorTitleAndText", ["Документы", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
