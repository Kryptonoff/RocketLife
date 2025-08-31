/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 22000;
private _listAllPlayer = _slide controlsGroupCtrl 22013;
private _house = RRPClientSelectedHouse;
private _playerNetID = _listAllPlayer lbData (lbCurSel _listAllPlayer);
if (_playerNetID isEqualTo "") exitWith {
	["Вы никого не выбрали!","OK"] call RRPClient_tablet_showWarning;
};
[netId _house,netId player,_playerNetID] remoteExec ["RRPServer_house_addNeighs",2];