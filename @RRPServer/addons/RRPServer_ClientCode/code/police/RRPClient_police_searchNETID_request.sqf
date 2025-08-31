/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogPoliceDatabase",displayNull];
private _hintCtrl = _display displayCtrl 7713;
private _listPlayer = _display displayCtrl 7719;
_playerIndex = lbCurSel _listPlayer;
_netID = _listPlayer lbData (lbCurSel _listPlayer);
if (_netID isEqualTo "") exitWith {};
{
	private _ctrl = _display displayCtrl _x;
	_ctrl ctrlEnable true;
	_ctrl ctrlShow true;
}forEach [7704,7705,7706,7707,7708,7709,7710,7711,7712,7721,7722,7723];
{
	private _ctrl = _display displayCtrl _x;
	_ctrl ctrlShow false;
	_ctrl ctrlEnable false;
}forEach [7719,7720];
if !(('cop' call RRPClient_groups_getSideLevel) >= 8) then 
{
	ctrlEnable [7721,false];
	ctrlEnable [7722,false];
	ctrlEnable [7723,false];
};
["name",_netID] remoteExecCall ["RRPServer_police_searchData",2];
_hintCtrl ctrlSetText "Данные отправлены на сервер, ожидайте...";
_hintCtrl ctrlSetBackgroundColor [0.4,0.8,1,0.8];