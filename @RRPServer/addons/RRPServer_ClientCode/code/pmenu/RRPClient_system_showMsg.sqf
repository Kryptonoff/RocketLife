
private["_index","_data","_status"];
_index = param [0,0];

disableSerialization;
_display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _group = _display displayCtrl 26000;
_cMessageList =  _group controlsGroupCtrl 88882;
_cMessageShow = _group controlsGroupCtrl 88887;
_cMessageHeader =  _group controlsGroupCtrl 88890;

_data = call compile (_cMessageList lnbData [_index,0]);

_status = "[ОФФЛАЙН]";
{
    if(getPlayerUID _x == _data select 0) then
    {
        _status = "[В СЕТИ]";
        life_smartphoneTarget = _x;
        ctrlEnable[887892,true];
    };
}forEach playableUnits;

_cMessageHeader ctrlSetText format["%1 %2 написал:",_data select 3,_status];
_cMessageShow ctrlSetText format["%1",_data select 2];
