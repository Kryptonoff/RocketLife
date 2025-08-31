/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_time','_tick','_text','_controlList'];
_time = param [0,0,[0]];

if (RRPClientBuffs_CargoActive isEqualTo 1) then {
  RRPClientBuffs_CargoActive = 2;
  ['WarningTitleAndText',['Stamina','Вы перебили текущим эффектом дейстие прошлого']] call SmartClient_gui_toaster_addTemplateToast;
};

waitUntil {(RRPClientBuffs_CargoActive isEqualTo 0)};
RRPClientBuffs_CargoActive = 1;

_text = format ['%1 сек',_time];
_controlList = ['16',_time,_text] call RRPClient_UseItems_buffs_createUI;
player enableStamina false;

_tick = 0;
while {!(RRPClientBuffs_CargoActive isEqualTo 2)} do {
_tick = _tick + 1;
if (_tick >= _time) Exitwith {};
uisleep 1;
};

player enableStamina true;
[_controlList] call RRPClient_UseItems_buffs_DeleteGUI;
RRPClientBuffs_CargoActive = 0;
