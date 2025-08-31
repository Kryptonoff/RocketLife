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
lbClear _memberList;
_text = "";
{
	_playerUID = _x;
	_playerObject = _playerUID call RRPClient_util_objectFromPlayerUID;
	if (isNull _playerObject) then
	{
		_text = format ["~ОФФЛАЙН~ (%1)", _playerUID];
	}
	else
	{
		_text = format ["%1 (%2)",_playerObject call getNickName, _playerUID];
	};
	_memberList lbAdd _text;
	_memberList lbSetData [_forEachIndex, _playerUID];
	if (_playerUID isEqualTo ((_house getVariable "house_owner") select 0)) then
	{
		_memberList lbSetColor [_forEachIndex, [0/255, 178/255, 205/255, 1]];
	};
} forEach (_house getVariable ["Neighs", []]);
