private _dialog = uiNamespace getVariable ["RRPDialogAdmin",displayNull];
private _banRsnBox = _dialog displayCtrl 2927;
private _cur = _banRsnBox lbData (lbCurSel _banRsnBox);
try
{
	RRPClient_BanReason = _cur;
}catch{
	[_exception] call hints;
};