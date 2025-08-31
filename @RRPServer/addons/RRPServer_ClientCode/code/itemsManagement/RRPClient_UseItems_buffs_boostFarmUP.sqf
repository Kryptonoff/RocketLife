/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_time','_coef','_maxCoef','_controlList','_text','_tick'];
_coef = param [0,0,[0]];
_time = param [1,0,[0]];
_maxCoef = 1;

_coef = (_maxCoef/100) * _coef;

if (RRPClientBuffs_BoostFarmActive isEqualTo 1) then {
  RRPClientBuffs_BoostFarmActive = 2;
  ['WarningTitleAndText',['Buffs Sprint','Вы перебили текущим эффектом дейстие прошлого']] call SmartClient_gui_toaster_addTemplateToast;
};

waitUntil {(RRPClientBuffs_BoostFarmActive isEqualTo 0)};
RRPClientBuffs_BoostFarmActive = 1;

_text = format ['+ %1%2',(_coef * 100),'%'];
_controlList = ['boostFarm',_time,_text] call RRPClient_UseItems_buffs_createUI;
RRPClientBuffs_CoefFarmTime = RRPClientBuffs_CoefFarmTime - _coef;

_tick = 0;
while {!(RRPClientBuffs_SprintActive isEqualTo 2)} do {
  _tick = _tick + 1;
  if(_tick >= _time) Exitwith {};
  uisleep 1;
};

[_controlList] call RRPClient_UseItems_buffs_DeleteGUI;
RRPClientBuffs_CoefFarmTime    = 1;
RRPClientBuffs_BoostFarmActive = 0;
