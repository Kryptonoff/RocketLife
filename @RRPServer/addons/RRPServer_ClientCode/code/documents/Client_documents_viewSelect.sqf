
(_this # 0) params ["_control","_indexArray"];
(_this # 1) params ["_mod"];
if (isNull _control OR {_indexArray isEqualTo []}) exitWith {};

private ["_docInfo","_index","_docButton"];

if !(isNil "_mod") then {
    private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
    private _mainGroup = _display displayCtrl 24001;
    private _slide = _mainGroup controlsGroupCtrl 31000;

    _docInfo = _slide controlsGroupCtrl 31003;
} else {
    _docInfo = ((findDisplay 2500) displayCtrl 1204);
};
_index = _control tvValue _indexArray;

if (_index < 0) exitWith {
    _docInfo ctrlSetStructuredText parseText "<t size='1' font='SFCompactText'>Нет какой-либо информации!<br /></t>";
    curDocID =[];
};

(life_documentsData # _index) params ["_docId","_docOwner","_docClass","_docName","_docDescription","_docGiveName","_docGivePid","_docInsert","_docExpires"];
curDocID = [_docId,_docClass];

private _textInfo = "";

if (_docGivePid isEqualTo "" OR {_docGivePid isEqualTo "SYSTEM"}) then {
    _textInfo = format["<t size='0.85' font='SFCompactText'><t size='1'>Название:</t><br /><t color='#ff9a03'>(#%1)%2</t><br /><t size='1'>Описание:</t><br /><t color='#ff9a03'>%3</t><br /><br /><t size='1'>Дата получения документа:</t><br /><t color='#ff9a04'>%4</t><br /><t size='1'>Документ действителен до:</t><br /><t color='#ff9a03'>%5</t><br /></t>",_docId,_docName,_docDescription,["db",_docInsert] call RRPClient_util_convertTime,["db",_docExpires] call RRPClient_util_convertTime];
} else {
    _textInfo = format["<t size='0.85' font='SFCompactText'><t size='1'>Название:</t><br /><t color='#ff9a03'>(#%1)%2</t><br /><t size='1'>Описание:</t><br /><t color='#ff9a03'>%3</t><br /><br /><t size='1'>Выдал: </t><t color='#ff9a03'>%4</t><br /><t size='1'>Дата получения документа:</t><br /><t color='#ff9a04'>%5</t><br /><t size='1'>Документ действителен до:</t><br /><t color='#ff9a03'>%6</t><br /></t>",_docId,_docName,_docDescription,_docGiveName,["db",_docInsert] call RRPClient_util_convertTime,["db",_docExpires] call RRPClient_util_convertTime];
};

if (_mod isEqualTo "tablet") then {
    private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
    private _mainGroup = _display displayCtrl 24001;
    private _slide = _mainGroup controlsGroupCtrl 31000;

    _docButton = _slide controlsGroupCtrl 31005;
    _docButton ctrlEnable true;
};

_docInfo ctrlSetStructuredText parseText _textInfo;
[_docInfo] call BIS_fnc_ctrlTextHeight;
