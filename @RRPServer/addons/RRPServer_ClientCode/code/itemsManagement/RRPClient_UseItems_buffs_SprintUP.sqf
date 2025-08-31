/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_Boost','_time','_coef','_maxCoef','_tick','_text','_controlList'];
_coef = param [0,0,[0]];
_time = param [1,0,[0]];
_maxCoef = 1;

if (RRPClientBuffs_SprintActive isEqualTo 1) then {
  RRPClientBuffs_SprintActive = 2;
  ['WarningTitleAndText',['Buffs Sprint','Вы перебили текущим эффектом дейстие прошлого']] call SmartClient_gui_toaster_addTemplateToast;
};

waitUntil {(RRPClientBuffs_SprintActive isEqualTo 0)};
RRPClientBuffs_SprintActive = 1;
_Boost = ((_maxCoef/100) * _coef);

RRPClientBuffs_SprintCoef = RRPClientBuffs_SprintCoef + _Boost;
_text = format ['+ %1%2 ',_coef,'%'];
_controlList = ['speed',_time,_text] call RRPClient_UseItems_buffs_createUI;

_tick = 0;
while {!(RRPClientBuffs_SprintActive isEqualTo 2)} do {
  _tick = _tick + 1;
  if (_tick >= _time) Exitwith {};
  uisleep 1;
};

[_controlList] call RRPClient_UseItems_buffs_DeleteGUI;
RRPClientBuffs_SprintCoef   = 1;
RRPClientBuffs_SprintActive = 0;
