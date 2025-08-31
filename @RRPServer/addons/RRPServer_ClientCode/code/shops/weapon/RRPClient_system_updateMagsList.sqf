/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_display","_magsButtonAddCat","_magsList","_magsCount","_magsBG"];
_display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];

_magsButtonAddCat = _display displayCtrl 38409;
_magsList = _display displayCtrl 38407;
_magsCount = _display displayCtrl 38408;
_magsBG = _display displayCtrl 38410;

lbClear _magsList;
private ["_magPrice","_magInfo"];
{
    if (isClass(missionConfigFile >> "LifeCfgItems" >> _x)) then {
        if !([getText(missionConfigFile >> "LifeCfgItems" >> _x >> "conditions_buy")] call RRPClient_util_conditionsCheck) exitWith {};
        _magInfo = [_x] call RRPClient_util_itemDetails;
        _magPrice = _magInfo # 12;
        if (_magPrice > 0) then {
                private _indexMags = _magsList lbAdd format["%1",_magInfo select 1];
                _magsList lbSetData[_indexMags,_x];
                _magPrice = ["countPrice",_magPrice] call RRPClient_shops_utils;
                _magsList lbSetTextRight [_indexMags, format["  %1 %2", [_magPrice] call RRPClient_util_numberText,["getName"] call RRPClient_shops_utils]];
                _magsList lbSetPicture[_indexMags,_magInfo select 2];
            };
    };
} forEach _this;

if !(ctrlshown _magsBG) then {
    _magsList ctrlShow true;
    _magsCount ctrlShow true;
    _magsButtonAddCat ctrlShow true;
    _magsBG ctrlShow true;
    _magsList ctrlSetFade 1; _magsList ctrlCommit 0; _magsList ctrlSetFade 0; _magsList ctrlCommit 0.3;
    _magsCount ctrlSetFade 1; _magsCount ctrlCommit 0; _magsCount ctrlSetFade 0; _magsCount ctrlCommit 0.3;
    _magsBG ctrlSetFade 1; _magsBG ctrlCommit 0; _magsBG ctrlSetFade 0; _magsBG ctrlCommit 0.3;
};
    _magsList lbSetCurSel -1;
