/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_coef','_time','_maxCargo','_controlList','_buffWeightT','_OLDlife_maxWeightT','_timer','_text'];
_coef = param [0,0,[0]];
_time = param [1,0,[0]];
_maxCargo = 100;

if (RRPClientBuffs_CargoActive isEqualTo 1) then {
  RRPClientBuffs_CargoActive = 2;
  ['WarningTitleAndText',['Buffs Cargo','Вы перебили текущим эффектом дейстие прошлого']] call SmartClient_gui_toaster_addTemplateToast;
};

waitUntil {(RRPClientBuffs_CargoActive isEqualTo 0)};
RRPClientBuffs_CargoActive = 1;

_buffWeightT        = round(_coef);
_OLDlife_maxWeightT = life_maxWeightT;
life_maxWeightT     = life_maxWeightT + _buffWeightT;

_text = format ['+%1',_buffWeightT];
_controlList = ['cargo',_time,_text] call RRPClient_UseItems_buffs_createUI;

_timer = 0;
while {!(RRPClientBuffs_CargoActive isEqualTo 2)} do {
  if (_timer >= _time) Exitwith {['InfoTitleAndText',['Heal','Действие препарата законченно!']] call SmartClient_gui_toaster_addTemplateToast;};
  _timer = _timer + 1;
  uisleep 1;
};

[_controlList] call RRPClient_UseItems_buffs_DeleteGUI;
life_maxWeightT = _OLDlife_maxWeightT;
RRPClientBuffs_CargoActive = 0;
