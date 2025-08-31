/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
private ["_display","_templateList","_tempates","_selectIndex"];
(["tempateSwitcher"] call RRPClient_shops_utils) params ["_idcList","_idcSetName","_arrayName","_dialogName"];

_display = uiNamespace getVariable [_dialogName,displayNull];
_templateList = _display displayCtrl _idcList;
_tempates = profileNameSpace getVariable [_arrayName,[]];
_selectIndex = _templateList lbData (lbCurSel _templateList);
_tempates deleteAt  (parseNumber _selectIndex);

profileNameSpace setVariable [_arrayName, _tempates];
["SuccessTitleOnly","Шаблон удален"] call toast;
saveProfileNamespace;
call RRPClient_shops_renderListTemplates;
_templateList lbSetCurSel -1;
