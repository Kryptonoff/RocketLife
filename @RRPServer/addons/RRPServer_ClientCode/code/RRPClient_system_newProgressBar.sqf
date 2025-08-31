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
      Syntax:
      [titleName,condition,needetTimer,time,canRun,cancelbtn,code evey sec] call RRPClient_system_newProgressBar;

      Parameters:
      titleName     : string
      condition     : {code}
      needetTimer   : bool
      time          : number
      canRun        : bool
      cancelbtn     : bool
      code evey sec : {code}
      Return Value:
      bool
*/

private ['_code','_text','_condition','_needetTimer','_time','_display','_ctrlProgress','_ctrlTitleText','_ctrlTimer','_result','_canRun','_btnEVHExit','_cancelbtn','_ctrlcancelbtn'];
if !((uiNamespace getVariable ['timerProgresBar',displayNull]) isEqualTo displayNull) exitWith {};
['timerProgresBar'] call RRPClient_gui_CreateRscLayer;
_display    = uiNamespace getVariable ['timerProgresBar',displayNull];

{
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
  _x ctrlSetFade 0;
  _x ctrlCommit 0;
} forEach (allControls _display);

_text        = param [0,'',['']];
_condition   = param [1,{true},[{}]];
_needetTimer = param [2,true,[true]];
_time        = param [3,0,[0]];
_canRun      = param [4,false,[false]];
_cancelbtn   = param [5,true,[true]];
_code        = param [6,nil,[{}]];
_result      = false;
isRun        = false;
btnExit      = false;

if (_cancelbtn) then {
    _btnEVHExit = (findDisplay 46) displayAddEventHandler ['KeyDown','if ((_this select 1) isEqualTo 33) then {btnExit = true;};false'];
};

_ctrlProgress  = _display displayCtrl 2602;
_ctrlTitleText = _display displayCtrl 2601;
_ctrlTimer     = _display displayCtrl 2603;
_ctrlcancelbtn = _display displayCtrl 2604;

_ctrlProgress ctrlSetPosition [0.29375 * safezoneW + safezoneX,0.148 * safezoneH + safezoneY,0.4125 * safezoneW,0.0055 * safezoneH];
_ctrlProgress ctrlCommit 0;

if !(_needetTimer) then {
_ctrlTimer ctrlSetFade 1;
_ctrlTimer ctrlCommit 0;
};

if !(_cancelbtn) then {
_ctrlcancelbtn ctrlSetFade 1;
_ctrlcancelbtn ctrlCommit 0;
};

_ctrlTitleText ctrlSetText _text;

_ctrlProgress ctrlSetPosition [0.29375 * safezoneW + safezoneX,0.148 * safezoneH + safezoneY,0 * safezoneW,0.0055 * safezoneH];
_ctrlProgress ctrlCommit _time;

if (_canRun) then {[] spawn {waitUntil {(speed player > 1) or {(isNull (uiNamespace getVariable ['timerProgresBar',displayNull]))}}; isRun = true}};


private _timeStampExit = time + _time;
while {!isRun and {!btnExit} and {(call _condition)}} do {
  _ctrlTimer ctrlSetText ([if (_time < 0) then {0} else {_timeStampExit - time},"MM:SS.MS"] call BIS_fnc_secondsToString);
  uiSleep 0.01;
  if (time >=  _timeStampExit) exitwith {_result = true};
  if !(isnil '_code') then {call _code;};
};

{
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
} forEach (allControls _display);
sleep 0.5;

['timerProgresBar'] call RRPClient_gui_DestroyRscLayer;

isRun             = nil;
btnExit           = nil;

if (_cancelbtn) then {
  (findDisplay 46) displayRemoveEventHandler ['KeyDown', _btnEVHExit];
};

_result;
