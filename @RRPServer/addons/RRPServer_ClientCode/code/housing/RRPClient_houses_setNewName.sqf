/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 22000;
private _houseDropdown = _slide controlsGroupCtrl 22007;
private _netID = _houseDropdown lbData (lbCurSel _houseDropdown);
private _house = objectFromNetId _netID;
private _title = _slide controlsGroupCtrl 9001;
private _setNameBox = _slide controlsGroupCtrl 22015;
try
{
	private _newName = ctrlText _setNameBox;
	_alph = getText(missionConfigFile >> "LifeCfgSettings" >> "allowAlphabet");
	_chars = [_newName,_alph] call RRPClient_util_containsForbiddenCharacter;
	if!(_chars isEqualTo -1) throw format ["Символ '%1' нельзя использовать!",_chars];
	if !((_house getVariable ["house_owner",[]] select 0) isEqualTo getPlayerUID player) throw "Вы не можете переименовать этот дом!";
	private _id = _house getVariable ["house_id",0];
	_house setVariable ["house_name",_newName,true];
	(format ["updateNameHouse:%1:%2",_newName,_id]) remoteExecCall ["RRPServer_DB_fireAndForget",2];
	_title ctrlSetText format ["%1",_newName];
	["SuccessTitleAndText",["Мой дом","Новое имя дома установлено!"]] call toast;
	
}catch{
	["ErrorTitleAndText",["Мой дом",_exception]] call toast;
};

