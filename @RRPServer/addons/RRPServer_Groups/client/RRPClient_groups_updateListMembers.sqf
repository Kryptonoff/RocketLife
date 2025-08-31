/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND

  _memberList lnbAddRow ["     Имя","Должность"];
  _memberList lnbSetValue [[0, 0], -1];
  _memberList lnbSetColor [[0,0], [0.99,0.49,0,1]];
  _memberList lnbSetColor [[0,1], [0.99,0.49,0,1]];

*/

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
if !(isNull _display) then
{
  private _leaderUID = RRPClientGroupInfo get "leader";
  private _deputys = RRPClientGroupInfo get "deputys";
  private _titles = RRPClientGroupInfo get "ranks";
  private _members = RRPClientGroupInfo get "members";

  private _pagePlayers = _display displayCtrl 1038;
  private _filter = _pagePlayers controlsGroupCtrl 12037;
  private _memberList = _pagePlayers controlsGroupCtrl 12036;

  _memberList lnbSetColumnsPos [0,0.55];
  lnbClear _memberList;
  private ["_index","_memberUid","_return","_color","_name"];
  private _getPostMember =
  {
    _return = call {
      if (_this isEqualTo _leaderUID) exitWith {"\a3\ui_f\data\gui\cfg\Ranks\colonel_pr.paa"};
      if (_this in _deputys) exitWith {"\a3\ui_f\data\gui\cfg\Ranks\major_pr.paa"};
      "\a3\ui_f\data\gui\cfg\Ranks\private_pr.paa"
    };
    _return
  };
  private _getTitleName =
  {
    private _return = "Хуй з горы";
    private _indexTitle = [_titles,_this] call RRPClient_util_find;
    if !(_indexTitle isEqualTo -1) then {_return = (_titles select _indexTitle) select 1};
    _return
  };
  {
    _memberUid = _x select 0;
    private _groupMember = (_x select 0) call RRPClient_util_objectFromPlayerUid;
    _index = _memberList lnbAddRow [(_x select 1),(_x select 2) call _getTitleName];
    _memberList lnbSetData [[_index,0],_memberUid];
    _memberList lnbSetPicture [[_index,0],_memberUid call _getPostMember];
    if !(isNull _groupMember)then
    {
      _memberList lnbSetColor [[_index,0],[1,1,1,1]];
      _memberList lnbSetColor [[_index,1],[1,1,1,1]];
    }else{
      _memberList lnbSetColor [[_index,0],[1,1,1,0.5]];
      _memberList lnbSetColor [[_index,1],[1,1,1,0.5]];
    };
  }forEach _members;
  _memberList lnbSort [0,false];

  private _pageRanks =  _display displayCtrl 1039;
  private _rankCombo = _pageRanks controlsGroupCtrl 13038;
  private _curentSel = lbCurSel _rankCombo;

  lbClear _rankCombo;
  {
    _index = _rankCombo lbAdd format ["%1: %2",_x#0,_x#1];
    _rankCombo lbSetValue [_index,_forEachIndex];
  }forEach _titles;
  _rankCombo lbSetCurSel _curentSel;
};