/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
    ----
    Description:
*/
private ["_display","_control","_index","_mod","_text","_display","_ctrlhint","_BackgroundColor"];
_display = uiNamespace getVariable ["ProcessingDialog",displayNull];

if ((typeName  (_this select 0)) isEqualTo "CONTROL") then {
 _control = _this select 0;
 _index  = _this select 1;
 _text = _control lbData _index;
 _mod  = if !((_control lbPictureRight _index) isEqualTo "rimas_pack\icons\messages\error.paa") then {"sucss"} else {"error"};
} else {
 _mod =  _this select 0;
 _text = _this select 1;
};

_ctrlhint = _display displayCtrl 7777;
_ctrlhint ctrlSetPosition  [0.298906 * safezoneW + safezoneX,0.272 * safezoneH + safezoneY,0 * safezoneW,0.034 * safezoneH];
_ctrlhint ctrlSetFade 0;
_ctrlhint ctrlCommit 0;

_BackgroundColor = switch (_mod) do {
 case "info": {[0.0, 0.56, 0.97,1]};
 case "sucss": {[0.0, 0.74, 0.29,1]};
 case "error": {[0.71, 0.01, 0.18,1]};
 default {[0,0,0,1]};
};
_ctrlhint ctrlSetBackgroundColor _BackgroundColor;
_ctrlhint ctrlSetStructuredText parseText format ["<img size='1.45' image='\smart_icons_pack\paa\massage_dlya_hintov\info.paa'/><t align='left' size='1.15'>%1</t>",_text];
_ctrlhint ctrlSetPosition [0.298906 * safezoneW + safezoneX,0.272 * safezoneH + safezoneY,0.402187 * safezoneW,0.034 * safezoneH];
_ctrlhint ctrlCommit 0.35;
