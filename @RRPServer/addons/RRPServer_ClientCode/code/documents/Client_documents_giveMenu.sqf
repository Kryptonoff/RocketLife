disableSerialization;
private _unit = (param [0,objNull,[objNull]]);

try {
    if !(_unit call RRPClient_util_isShowPass) throw "Вам должны показать паспорт!";
    if !(createDialog "RRPDialogAddDocs") exitWith {};
    private ["_display","_ctrlDocType","_ctrlDocCountDay","_ctrlDocGiveButton","_isKnow"];
    _display = uiNamespace getVariable ["RRPDialogAddDocs",displayNull];
    _ctrlDocType  = _display displayCtrl 2651;
    _ctrlDocCountDay  = _display displayCtrl 2655;
    _ctrlDocGiveButton  = _display displayCtrl 2656;


    if (isNull _unit OR !isPlayer _unit) throw "";
    if (player distance _unit > 10) throw "Цель слишком далеко";

    _isKnow = if ((call (life_adminlevel) > 0)) then {true} else {_unit call RRPClient_util_isShowPass};
    if !(_isKnow) throw "Цель должна показать вам паспорт";

    _ctrlDocType ctrlRemoveAllEventHandlers "LBSelChanged";
    _ctrlDocType ctrlAddEventHandler ["LBSelChanged","_this call Client_documents_giveTypeSelect"];
    lbClear _ctrlDocType;

    _ctrlDocType lbAdd "Все";
    _ctrlDocType lbSetData[(lbSize _ctrlDocType) - 1, ""];

    {
        private _index = _ctrlDocType lbAdd getText(_x >> "name");
        _ctrlDocType lbSetPicture [_index, getText(_x >> "icon")];
        _ctrlDocType lbSetData [_index,configName _x];
    } forEach ("true" configClasses (missionConfigFile >> "LifeCfgDocumentsType"));
    _ctrlDocType lbSetCurSel 0;

    _ctrlDocCountDay ctrlSetTooltip "Срок выдачи в днях, максимум 90 дней";
    _ctrlDocGiveButton buttonSetAction format["['%1'] call Client_documents_giveAction",netId _unit];
} catch {
    ["ErrorTitleAndText", ["Документы", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
