disableSerialization;
if (isNull (findDisplay 55200)) exitWith {false};
ctrlSetText [601,format["Наличные: $%1              ",[RRPClientCashMoney] call RRPClient_util_numberText]];

private _docShopList = (getArray(missionConfigFile >> "LifeCfgDocumentsShop" >> life_docShopOpened >> "documents"));
if (_docShopList isEqualTo []) then {
    (((findDisplay 55200) displayCtrl 55202)) ctrlSetStructuredText parseText format["<t size='1' font='RobotoCondensed'>Нет документов</t>"];
} else {
    (((findDisplay 55200) displayCtrl 55202)) ctrlSetStructuredText parseText format["<t size='1' font='RobotoCondensed'>Выберите документ из списка в левой части экрана, для отображения дополнительной информации.<br /><br /></t>"];
};

private _docBuyButton = ((findDisplay 55200) displayCtrl 55203);
_docBuyButton ctrlEnable false;

private _docList = ((findDisplay 55200) displayCtrl 55201);
lbClear _docList;


{
    _x params ["_class","_conditions", "_message","_show"];
    if (isClass(missionConfigFile >> "LifeCfgDocuments" >> _class) && {[_conditions] call RRPClient_util_conditionsCheck OR [_show] call RRPClient_util_conditionsCheck}) then {
    private _docName = getText(missionConfigFile >> "LifeCfgDocuments" >> _class >> "name");
    private _price = getNumber(missionConfigFile >> "LifeCfgDocuments" >> _class >> "price");
    private _icon = getText(missionConfigFile >> "LifeCfgDocuments" >> _class >> "icon");



    private _index = _docList lbAdd _docName;
    _docList lbSetPicture [_index,_icon];
    _docList lbSetData [_index,str(_x)];
    _docList lbSetValue [_index,0];
    if (_class in life_documents) then {
        _docList lbSetValue [_index,1];
        _docList lbSetTextRight [_index, "  Приобретено"];
        _docList lbSetColor [_index,[0.494,0.494,0.494,1]];
        _docList lbSetColorRight [_index,[0.494,0.494,0.494,1]];
    } else {
            if ([_conditions] call RRPClient_util_conditionsCheck) then {
                _price = ["priceSell",_price] call RRPClient_system_VIP;
                _docList lbSetTextRight [_index, format["  $%1", [_price] call RRPClient_util_numberText]];
            } else {
                _docList lbSetValue [_index,2];
                _docList lbSetTextRight [_index, "  Недоступен"];
                _docList lbSetColor [_index,[0.973,0.047,0.047,1]];
                _docList lbSetColorRight [_index,[0.973,0.047,0.047,1]];
                _docList lbSetTooltip [_index, _message];
            };
        };
    };
} forEach _docShopList;

_docList lbSetCurSel -1;
lbSortByValue _docList;

if (lbSize _docList isEqualTo 0) then {
private _index = _docList lbAdd "Список пуст";
_docList lbSetValue [_index, -1];
_docList lbSetData [_index,""];
};

true;
