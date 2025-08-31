
private _display = uiNamespace getVariable ["RRPDialogMarket",displayNull];
private _tabDescription = _display displayCtrl 25100;
private _tabManage = _display displayCtrl 25200;
if !(ctrlShown _tabManage) then {
	_tabManage ctrlShow true;
	_tabDescription ctrlShow false;
}else{
	_tabDescription ctrlShow true;
	_tabManage ctrlShow false;
};
