/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 22000;
private _memberList = _slide controlsGroupCtrl 22002;
private _house = RRPClientSelectedHouse;
private _uid = _memberList lbData (lbCurSel _memberList);
if (_uid isEqualTo "") exitWith {
	["Вы никого не выбрали!","OK"] call RRPClient_tablet_showWarning;
};
[netId _house,netId player,_uid] remoteExec ["RRPServer_house_removeNeighs",2];