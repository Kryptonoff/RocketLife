if (RRPClientGroupInfo isEqualTo []) exitWith {["ErrorTitleAndText", ["Ошибка!", "Вы не состоите ни в какой организации!"]] call SmartClient_gui_toaster_addTemplateToast};
createDialog "RRPDialogGroup";
private _display = uiNamespace getVariable ["RRPDialogGroup",displayNull];
{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach (allControls _display);
true call RRPClient_gui_util_blur;

private _group = RRPClientGroupInfo;
private _nameGroup =  _group get "name";
private _leaderUID =  _group get "leader";
private _deputys =    _group get "deputys";
private _slots =      _group get "slots";
private _premialVar = _group get "premialVar";
private _titles =     _group get "ranks";
private _tfar =       _group get "tfar";
private _bank =       _group get "bank";
private _massage_day = _group get "massage_day";
private _groupMembers = _group get "members";
private _markers =    _group get "markers";
private _polys =      _group get "polys";

private _title = _display displayCtrl 23999;
private _config = getMissionConfig "CfgGroups" >> "PremiumGroups";
private _image = if (isClass (_config >> _premialVar)) then {getText(_config >> _premialVar >> "picture")}else{"\a3\ui_f\data\gui\cfg\Ranks\major_pr.paa"};
_title ctrlSetStructuredText parseText (format ["<t size='1.4'><img image='%2' />%1</t>",_nameGroup,_image]);

private _pageGeneral = _display displayCtrl 1037;
private _genInfo = _pageGeneral controlsGroupCtrl 11036;
private _dayMsg = _pageGeneral controlsGroupCtrl 11035;
private _editMSGbtn = _pageGeneral controlsGroupCtrl 11031;

private _pagePlayers = _display displayCtrl 1038;
private _filter = _pagePlayers controlsGroupCtrl 12037;
private _memberList = _pagePlayers controlsGroupCtrl 12036;
private _upButton = _pagePlayers controlsGroupCtrl 12035;
private _downButton = _pagePlayers controlsGroupCtrl 12033;
private _promote = _pagePlayers controlsGroupCtrl 12034;
private _kickButton = _pagePlayers controlsGroupCtrl 12032;

private _pageRanks =  _display displayCtrl 1039;
private _rankCombo = _pageRanks controlsGroupCtrl 13038;
private _rankNameEdit = _pageRanks controlsGroupCtrl 13036;
private _saveButton = _pageRanks controlsGroupCtrl 13034;
private _permGroups = _display displayCtrl 13031;

private _pageSettings = _display displayCtrl 1040;
private _saveTfarBtn = _pageSettings controlsGroupCtrl 14039;
private _kvEditBox = _pageSettings controlsGroupCtrl 14037;
private _dvEditBox = _pageSettings controlsGroupCtrl 14036;
private _deleteMarkersBtn = _pageSettings controlsGroupCtrl 14033;
private _setOwner = _pageSettings controlsGroupCtrl 14031;
private _msgEdit = _pageSettings controlsGroupCtrl 14030;
private _msgSend = _pageSettings controlsGroupCtrl 14029;
private _slotsText = _pageSettings controlsGroupCtrl 14028;
private _addSlots = _pageSettings controlsGroupCtrl 14027;
private _dropAllPerms = _pageSettings controlsGroupCtrl 14026;
private _leaveCtrl = _pageSettings controlsGroupCtrl 14025;

if (getPlayerUID player isEqualTo _leaderUID) then {
  "Ты лидер организации" call chat;
  _leaveCtrl ctrlRemoveAllEventHandlers "ButtonClick";
  _leaveCtrl ctrlSetText "Упразднить организацию";
  _leaveCtrl ctrlAddEventHandler ["ButtonClick",{_this call RRPClient_groups_disbandRequest}];
};

if (_tfar isEqualTo []) then {_tfar = [101.2,36.6]};

_online = [];
{
  if !(isNull (_x#0 call RRPClient_util_objectFromPlayerUID)) then 
  {
    _online pushBack _x#0;
  };
}forEach _groupMembers;

private _textPosition = ctrlPosition _dayMsg;
_dayMsg ctrlSetStructuredText parseText format["<t font='RobotoCondensedLight' color='#CCFFFFFF'>%1</t>",toString _massage_day];
_textPosition set [3,((ctrlTextHeight _dayMsg) + (0.005 * safezoneH))];
_dayMsg ctrlSetPosition _textPosition;
_dayMsg ctrlCommit 0;

[controlNull,0] call RRPClient_groups_onToolBoxChanged;

_startY = 0.02;
{
  _config = _x;
  _cb = _display ctrlCreate ["ctrlCheckBox2",(getNumber(_x >> "idcCB")),_permGroups];
  _text = _display ctrlCreate ["ctrlStructuredText2",(getNumber(_x >> "idcT")),_permGroups];
  _text ctrlSetStructuredText parseText (getText(_x >> "displayName"));
  _cb ctrlSetTooltip (getText(_x >> "tooltip"));
  _text ctrlSetTooltip (getText(_x >> "tooltip"));
  _text ctrlSetPosition [
    0.0625,
    _startY + 0.009,
    0.65,
    0.06
  ];
  _cb ctrlSetPosition [
    0.0125,
    _startY,
    0.0470257,
    0.0599925
  ];
  _text ctrlCommit 0;_cb ctrlCommit 0;
  _startY = _startY + 0.06;
}forEach ("true" configClasses (getMissionConfig "CfgGroups" >> "permissions"));

lbClear _rankCombo;
{
  _index = _rankCombo lbAdd format ["%1: %2",_x#0,_x#1];
  _rankCombo lbSetValue [_index,_forEachIndex];
}forEach _titles;
_rankCombo lbSetCurSel 0;

RRPClientGroupsTitleShowed = false;
[_filter,_memberList] call BIS_fnc_initListNBoxSorting;
_filter lbsetcursel -1;

if ("tfarRead" call RRPClient_groups_util_permCheck) then 
{
  _dvEditBox ctrlSetText STR(_tfar select 0);
  _kvEditBox ctrlSetText STR(_tfar select 1);
  _genInfo ctrlSetStructuredText parseText format [
    "<br/><t size='.9'>Банк: $%1<br/>Вместимость организации: %2/%3<br/>Членов онлайн: %4<br/>Короткие волны: %5 mHz<br/>Длинные волны: %6 kHz</t>",
  ([_bank] call RRPClient_util_numberText),
  (_slots - (count _groupMembers)),
  count _groupMembers,
  count _online,
  _tfar#1,
  _tfar#0
  ];
}else{
  _dvEditBox ctrlSetText "****";
  _kvEditBox ctrlSetText "****";
  _genInfo ctrlSetStructuredText parseText format [
    "<t size='.9'>Банк: $%1<br/>Вместимость организации: %2/%3<br/>Членов онлайн: %4<br/>Короткие волны: %5 mHz<br/>Длинные волны: %6 kHz</t>",
    ([_bank] call RRPClient_util_numberText),
    (_slots - (count _groupMembers)),
    count _groupMembers,
    count _online,
    "****","****"
  ];
};

comment "--- lnb Works";
lnbClear _memberList;

private ["_index","_memberUid","_return","_color","_name"];

private _getPostMember =
{
  _return = call
  {
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
}forEach _groupMembers;

_memberList lnbSort [0,false];
