/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/

params [
  ["_mode","",[""]],
  ["_control",controlNull,[controlNull]],
  ["_selectedIndex",-1,[0]]
];
if ((_mode isEqualTo "") OR {(isNull _control)} OR {(_selectedIndex isEqualTo -1)} OR {((_control lbData _selectedIndex) isEqualTo "")}) exitWith {};

private ["_text","_playerTags"];
private _playerTags = profileNamespace getVariable ["playerTags",[]];
switch (_mode) do {
    case "updateIcons": {
      _playerTags set [0,[(_control lbData _selectedIndex),""] select ((_control lbData _selectedIndex) isEqualTo "default")];
    };
    case "updateTitle": {
      _playerTags set [2,[(_control lbData _selectedIndex),""] select ((_control lbData _selectedIndex) isEqualTo "default")];
    };
};
profileNamespace setVariable ["playerTags",_playerTags];
saveProfileNamespace;
player setVariable ["playerTags",_playerTags,true];
