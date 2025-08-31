

disableSerialization;
try {
    if ((time - life_action_delay) < 1) throw "Вы делаете это слишком быстро!";
    life_action_delay = time;
    private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
    if (isNull _display) throw "Не найден диалог!";

    private ["_docList","_unitsList","_path","_index","_docIndex","_unit","_textInfo"];

    private _mainGroup = _display displayCtrl 24001;
    private _slide = _mainGroup controlsGroupCtrl 31000;

    _docList = _slide controlsGroupCtrl 31001;
    _unitsList = _slide controlsGroupCtrl 31004;

    _path = tvCurSel _docList;
    _index = lbCurSel _unitsList;

    if (_path isEqualTo []) throw "Вы не выбрали документ!";
    if (_index isEqualTo -1) throw "Вы не выбрали цель для перадачи информации!";

    _docIndex = _docList tvValue _path;
    if (_docIndex < 0) throw "index ??";

    _unit = objectFromNetId (_unitsList lbData _index);
    if (isNil "_unit") throw "";
    if (isNull _unit) throw "";
    if (!(isPlayer _unit)) throw "";

    (life_documentsData # _docIndex) params ["_docId","_docPid","_docClass","_docName","_docDescription","_docGiveName","_docGivePid","_docInsert","_dateEnd"];
    _textInfo = format["Название:<br/><t color='#ff9a03'>(#%1) %2</t><br/>Описание:<br/><t color='#ff9a03'>%3</t><br/>Выдано:<br/><t color='#ff9a03'>%4</t><br/>Дата получения документа:<br/><t color='#ff9a03'>%5</t><br/>Документ действителен до:<br/><t color='#ff9a03'>%6</t><br/>",_docId,_docName,_docDescription,_docGiveName,["msg",_docInsert] call RRPClient_util_convertTime,["msg",_dateEnd] call RRPClient_util_convertTime];
    ["InfoTitleAndText", ["Документ", "Вы показали документ"]] call SmartClient_gui_toaster_addTemplateToast;

    ["Документ",_textInfo,false] remoteExecCall ["RRPClient_system_briefingNotification", _unit];
    true
} catch {
    ["ErrorTitleAndText", ["Документы", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};

true;
