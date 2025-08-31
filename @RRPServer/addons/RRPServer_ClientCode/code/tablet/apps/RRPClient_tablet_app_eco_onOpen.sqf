disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 17000;

private _list = _slide controlsGroupCtrl 17004;
{
	_index = _list lbAdd (_y select 0);
	_list lbSetPicture [_index, (getText(getMissionConfig "VirtualItems" >> _x >> "icon"))];
	_list lbSetTextRight [_index, format ["$%1",_y select 1]];
	_list lbSetData [_index,_x];
} forEach RRPHashEconomy;
lbSort [_list, "ASC"];
