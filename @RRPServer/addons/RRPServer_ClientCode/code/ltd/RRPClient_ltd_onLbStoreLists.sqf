/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _dialog = 		uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
private _listBox = 		_this select 0;
private _index = 		_this select 1;
private _store = 		objectFromNetId (_listBox lbData _index);
RRPClientStoreSelected = _store;
[] spawn RRPClient_ltd_updateMenu;

