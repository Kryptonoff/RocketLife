/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_itemList","_display"];
_display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];
private _itemList = _display displayCtrl 38403;
lbClear _itemList;

if ((count playerInventory) < 1) exitWith {};

{
    _x params ["_item","_count"];
    private _defaultPrice = round(getNumber(missionConfigFile >> "LifeCfgItems" >> _item >> "price") * 0.35);
    if (_defaultPrice > 0) then {
        private ["_conditionSell","_fixPrice","_price"];
        _conditionSell = getText(missionConfigFile >> "LifeCfgItems" >> _item >> "condition_sell");
        _fixPrice = getNumber(missionConfigFile >> "LifeCfgItems" >> _item >> "fix_sell_price");
        _price = if (_fixPrice isEqualTo 0) then {_defaultPrice} else {_fixPrice};

        private ["_itemInfo","_dispayName","_picture","_index"];
        _itemInfo = [_item] call RRPClient_util_itemDetails;
        _dispayName = _itemInfo # 1;
        _picture = _itemInfo # 2;

        _index = _itemList lbAdd (if (_count > 1) then {format["[x%2] %1",_dispayName,_count]} else {format["%1",_dispayName]});
        _itemList lbSetData[_index,_item];
        _itemList lbSetPicture[_index,_picture];
        _itemList lbSetValue [_index,_count];
    };

} foreach playerInventory;
