/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_timer','_damage','_healForOneTick','_allHill','_time','_text','_controlList'];
_allHill = param [0,0,[0]];
_time = param [1,0,[0]];
if (_allHill > 100) then {_allHill = 100};

if (RRPClientBuffs_gHealActive isEqualTo 1) then {
      RRPClientBuffs_gHealActive = 2;
      ['WarningTitleAndText',['Исцеление','Вы перебили текущим эффектом дейстие прошлого']] call SmartClient_gui_toaster_addTemplateToast;
};

waitUntil {(RRPClientBuffs_gHealActive isEqualTo 0)};
RRPClientBuffs_gHealActive = 1;
_text = format ['+%1%2',_allHill,'%'];
_allHill =_allHill/100;
_healForOneTick = _allHill/_time;

_controlList = ['heal',_time,_text] call RRPClient_UseItems_buffs_createUI;

_timer = 0;
while {!(RRPClientBuffs_gHealActive isEqualTo 2)} do {
      _damage = getDammage player;
      _damage = _damage - _healForOneTick;
      _timer  = _timer + 1;
      player setDammage _damage;
      if (_timer >= _time) Exitwith {['InfoTitleAndText',['Исцеление','Действие препарата оконченно!']] call SmartClient_gui_toaster_addTemplateToast;};
      if (_damage isEqualto 0) exitWith {['InfoTitleAndText',['Исцеление','Вы полностью здоров']] call SmartClient_gui_toaster_addTemplateToast;};
      uisleep 1;
};

[_controlList] call RRPClient_UseItems_buffs_DeleteGUI;
RRPClientBuffs_gHealActive = 0;
