try {
	private ["_docClass","_docNameText","_docDescriptionText","_docCountDayText","_unitNetID","_unit"];
	_docClass = param [0,"",[""]];
	_docNameText = param [1,"",[""]];
	_docDescriptionText = param [2,"",[""]];
	_docCountDayText = param [3,"",[""]];
	_unitNetID = (param [4,"",[""]]);
	_unit = objectFromNetId _unitNetID;

	if (_docClass isEqualTo "") throw "Неопределенный класс документа не найдем в конфиге!";
	if (_docNameText isEqualTo "") throw "Неопределенное назваине документа!";
	if (_docDescriptionText isEqualTo "") throw "Неопределенный описание документа!";
	if (_docCountDayText isEqualTo "") throw "Неопределенное дейсвие документа!";


	if ([_docClass] call Client_system_documentsCheck && (getNumber(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "limited") isEqualTo 1)) throw "Этот документ выдается в единственном экземпляре!";


	["InfoTitleAndText", ["Вам выдан документ", format ["
	Вам выдали: <t color='#ff9a03'> %1</t><br/>
	Описание: <t color='#ff9a03'> %2</t><br/>
	Выдал: <t color='#ff9a03'> %3</t><br/>
	Срок действия документа: <t color='#ff9a03'>%4 дн.</t>",_docNameText,_docDescriptionText,_unit getVariable ["realname",""],_docCountDayText]]] call SmartClient_gui_toaster_addTemplateToast;

	[[_docClass,_docNameText,_docDescriptionText,parseNumber _docCountDayText,netId player,_unitNetID],"doc_addDocuments"] call RRPClient_system_hcExec;
} catch {
	["ErrorTitleAndText", ["Документы", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
