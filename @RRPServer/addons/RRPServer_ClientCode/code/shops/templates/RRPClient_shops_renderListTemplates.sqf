/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

try {
    private ["_display","_TemplateList"];
    (["tempateSwitcher"] call RRPClient_shops_utils) params ["_idcList","_idcSetName","_arrayName","_dialogName"];

    _display = uiNamespace getVariable [_dialogName,displayNull];
    if (isNull _display) throw format ["dialog %1 is null",_dialogName];
    _TemplateList = _display displayCtrl _idcList;
    lbClear _TemplateList;

    {
        if (currentShop isEqualTo  _x # 2) then {
            _TemplateList lbSetData [(_TemplateList lbAdd (_x # 1)), str _forEachIndex]
        };
    } forEach (profileNameSpace getVariable [_arrayName,[]]);

} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
