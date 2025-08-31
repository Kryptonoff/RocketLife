/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36300;

private _lb = _this select 0;
private _index = _this select 1;
private _group = groupFromNetId (_lb lbData _index);
private _joinBtn = _slide controlsGroupCtrl 36306;
if (isNull _group) exitWith {_joinBtn ctrlEnable false;};
if (_group getVariable ["openClosed",false]) then
{
  _joinBtn ctrlEnable true;
}else{
  _joinBtn ctrlEnable false;
};
if (count (units _group) >= getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")) then
{
  _joinBtn ctrlEnable false;
}else{
  _joinBtn ctrlEnable true;
};

private _playerList = _slide controlsGroupCtrl 36305;
lbClear _playerList;
if (_group getVariable ["openClosed",false]) then
{
  _playerList lbAdd "Закрытая тусовка";
}else{
  {
    _index = _playerList lbAdd (_x call getNickName);
  }forEach units _group;
};
