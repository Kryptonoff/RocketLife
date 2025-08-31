
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 31000;

_docList = _slide controlsGroupCtrl 31001;
_docInfo = _slide controlsGroupCtrl 31003;
_unitsList = _slide controlsGroupCtrl 31004;
_docButton = _slide controlsGroupCtrl 31005;
_btnDelete = _slide controlsGroupCtrl 31006;

_docButton ctrlEnable false;
tvClear _docList;

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
} forEach life_documentsData;

{
    if (_docList tvCount[_x] isEqualTo 0) then {
        _docList tvAdd[[_x], "Список пуст"];
        _docList tvSetValue[[_x, 0], -1];
    };
    _docList tvSetValue [[_x],-1];
} forEach[0,1,2,3];

tvExpandAll _docList;
_docList tvSetCurSel [-1];


private _units = (nearestObjects[player,["Man"],10] - [player]);
lbClear _unitsList;

{
private _isKnow = (_x call RRPClient_util_isShowPass);
    if (!isNull _x && {alive _x} && {_x getVariable ["realname",""] != ""} && {_isKnow}) then {
        private _index =  _unitsList lbAdd (_x getVariable ["realname",""]);
        _unitsList lbSetData [_index, netId _x];
    };
} forEach _units;

if (lbSize _unitsList > 0) then {_unitsList lbSetCurSel 1} else {_unitsList lbSetCurSel -1};

if (life_documents isEqualTo []) then {
    _docInfo ctrlSetStructuredText parseText "<t size='1' font='SFCompactText'>У вас нет каких-либо документов<br /><br /></t>";
} else {
    _docInfo ctrlSetStructuredText parseText "<t size='1' font='SFCompactText'>Выберите документ из списка в левой части экрана, для отображения дополнительной информации.<br /><br /></t>";
};

_docButton ctrlEnable false;

_btnDelete buttonSetAction format ["['%1',0] call RRPClient_documents_deleteDoc",netId player];
