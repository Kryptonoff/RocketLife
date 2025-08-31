/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/

private _playerTags = profileNamespace getVariable ["playerTags",[]];
_playerTags params [
  ["_icon", "", [""]],
  ["_rank", "", [""]],
  ["_title", "", [""]],
  ["_oraganization", "", [""]]
];
waitUntil {!(isNil "life_gangData")};

private _getDefineRank = {
  [call RRPClient_groups_util_getRankName,""] select (count RRPClientGroupInfo isEqualTo 0);
};
private _getDefineOrg = {
  [RRPClientGroupInfo getOrDefault ["name",""],""] select (count RRPClientGroupInfo isEqualTo 0);
};
private _getDefiniteTitle = {
  if (isClass (missionConfigFile >> "playerTags" >> "Title" >> _title)) then {
    if !([getText(missionConfigFile >> "playerTags" >> "Title" >> _title >> "conditions")] call RRPClient_util_conditionsCheck) then {
      _title = "default";
    };
  } else {_title = "default"};
  _title
};
private _getDefiniteIcon = {
  if (isClass (missionConfigFile >> "playerTags" >> "icons" >> _icon)) then {
    if !([getText(missionConfigFile >> "playerTags" >> "icons" >> _icon >> "conditions")] call RRPClient_util_conditionsCheck) then {
      _icon = "default";
    };
  } else {_icon = "default"};
  _icon
};
_rank = call _getDefineRank;
_icon = call _getDefiniteIcon;
_title = call _getDefiniteTitle;
_oraganization = call _getDefineOrg;

_playerTags = [_icon,_rank,_title,_oraganization];
profileNamespace setVariable ["playerTags",_playerTags];
saveProfileNamespace;
player setVariable ["playerTags",_playerTags,true];
