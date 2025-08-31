/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/

params [
    ["_unit", objNull, [objNull]],
    ["_docData",[],[[]]]
];

if (!createDialog "showLicense") exitWith {
    ["ErrorTitleAndText", ["Ошибка!", "Не удалось создать диалог!"]] call SmartClient_gui_toaster_addTemplateToast;
};

private ["_display","_docList","_btnDelete"];
_display = uiNamespace getVariable ["RRPshowLicense",displayNull];

_docList = _display displayCtrl 1203;
_btnDelete = _display displayCtrl 1205;
tvClear _docList;
private ["_typeIndex"];
_typeIndex = _docList tvAdd [[],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "main" >> "name")];
_docList tvSetPicture [[_typeIndex],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "main" >> "icon")];

_typeIndex = _docList tvAdd [[],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "licenses" >> "name")];
_docList tvSetPicture [[_typeIndex],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "licenses" >> "icon")];

_typeIndex = _docList tvAdd [[],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "business" >> "name")];
_docList tvSetPicture [[_typeIndex],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "business" >> "icon")];

_typeIndex = _docList tvAdd [[],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "agreement" >> "name")];
_docList tvSetPicture [[_typeIndex],getText(missionConfigFile >> "LifeCfgDocumentsType" >> "agreement" >> "icon")];

{
    if (isClass(missionConfigFile >> "LifeCfgDocuments" >> _x # 2)) then {

        private ["_docType","_docCategory","_docIndex"];
        _docType = getText(missionConfigFile >> "LifeCfgDocuments" >> _x # 2 >> "type");
        _docCategory = getNumber(missionConfigFile >> "LifeCfgDocumentsType" >> _docType >> "category");
        _docIndex = _docList tvAdd [[_docCategory],_x # 3];

        _docList tvSetPicture [[_docCategory,_docIndex],getText(missionConfigFile >> "LifeCfgDocuments" >> _x # 2 >> "icon")];
        _docList tvSetValue [[_docCategory,_docIndex],_forEachIndex];
    };
} forEach _docData;

{
    if (_docList tvCount[_x] isEqualTo 0) then {
        _docList tvAdd[[_x], "Список пуст"];
        _docList tvSetValue[[_x, 0], -1];
    }
} forEach[0,1,2,3];

_btnDelete buttonSetAction format ["['%1',1] call RRPClient_documents_deleteDoc",netId _unit];

tvExpandAll _docList;
_docList tvSetCurSel [-1];
