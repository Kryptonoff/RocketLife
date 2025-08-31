/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private _msgClass = _this;
private _text = getText(missionConfigFile >> "RRP_messages" >> "warningMessages" >> _msgClass >> "messages");
private _icon = getText(missionConfigFile >> "RRP_messages" >> "warningMessages" >> _msgClass >> "icon");
playSound "3DEN_notificationWarning";
[10,_text,_icon] call RRPClient_warning_gui;



