/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
ClickEveryDegree = 0;
isActiveRotation = false;

reverseRotaionRev  = 360;
reverseRotaion     = 0;

RotationClockwise = 0;
ReverseRotationClockwise = 360;


disableSerialization;
private ['_display','_amountLocks','_ctrlArrow','_Xcoord','_idc','_ctrlArrow','_ctrlPoint','_ctrlposition','_ctrlStaticCentralPct','_isLeft','_ctrlAmount','_ctrlPointRev'];

if !(isNull (uiNamespace getVariable ['RRPbreakinglock',displayNull])) exitWith {};
if !(createDialog 'RRPbreakinglock') exitWith {};
_display = uiNamespace getVariable ['RRPbreakinglock',displayNull];

uiNamespace setVariable ["ctrlPointRev",displayNull];
uiNamespace setVariable ["ctrlPoint",displayNull];

_idc         = 229;
_amountLocks = 5;
_Xcoord      = 0.4;
_isLeft = true;
_ctrlAmount = 0;

for '_i' from 1 to _amountLocks step 1 do {
  _isLeft = !_isLeft;
  _ctrlAmount = _ctrlAmount + 1;
  _ctrlposition = [ _Xcoord * safezoneW + safezoneX , 0.301 * safezoneH + safezoneY , 0.2 * safezoneW , 0.2 * safezoneH ];

  _ctrlArrow = _display ctrlCreate ['RscPictureKeepAspect', _idc];
  _ctrlArrow ctrlSetPosition _ctrlposition;
  _ctrlArrow ctrlSetText '\RRP_icons\pic\rotateArrov.paa';
  [_display, _ctrlArrow, ctrlPosition _ctrlArrow, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _ctrlArrow, ctrlPosition _ctrlArrow, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;

  _idc = _idc + 1;

  _ctrlPointRev = _display ctrlCreate ['RscPictureKeepAspect', _idc];
  _ctrlPointRev ctrlSetPosition _ctrlposition;
  _ctrlPointRev ctrlSetText '\RRP_icons\pic\insideCirle.paa';

  [_display, _ctrlPointRev, ctrlPosition _ctrlPointRev, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _ctrlPointRev, ctrlPosition _ctrlPointRev, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;

  _idc = _idc + 1;

  _ctrlPoint = _display ctrlCreate ['RscPictureKeepAspect', _idc];
  _ctrlPoint ctrlSetPosition _ctrlposition;
  _ctrlPoint ctrlSetText '\RRP_icons\pic\externalCirle.paa';

  [_display, _ctrlPoint, ctrlPosition _ctrlPoint, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _ctrlPoint, ctrlPosition _ctrlPoint, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;

  _idc = _idc + 1;

  _ctrlStaticCentralPct = _display ctrlCreate ['RscPictureKeepAspect', _idc];
  _ctrlStaticCentralPct ctrlSetPosition _ctrlposition;
  _ctrlStaticCentralPct ctrlSetText '\RRP_icons\pic\StaticPct.paa';

  [_display, _ctrlStaticCentralPct, ctrlPosition _ctrlStaticCentralPct, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _ctrlStaticCentralPct, ctrlPosition _ctrlStaticCentralPct, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;

  _idc = _idc + 1;

  _ctrlArrow ctrlSetEventHandler ['MouseButtonDown','
    systemChat str (_this select 1);
    if ((_this select 1) isEqualTo 1) then {
    isActiveRotation = true;

    uiNamespace setVariable ["ctrlArrow",_this select 0];
    idc = ctrlIDC ctrlArrow;
    idc = idc + 1;
    uiNamespace setVariable ["ctrlPointRev",(uiNamespace getVariable [''RRPbreakinglock'',displayNull]) displayCtrl idc];
    idc = idc + 1;
    uiNamespace setVariable ["ctrlPoint",(uiNamespace getVariable [''RRPbreakinglock'',displayNull]) displayCtrl idc];
    idc = idc + 1;
    uiNamespace setVariable ["ctrlCenter",(uiNamespace getVariable [''RRPbreakinglock'',displayNull]) displayCtrl idc];


    [uiNamespace getVariable ["ctrlArrow",displayNull],1.5,0.4]    call BIS_fnc_ctrlSetScale;
    [uiNamespace getVariable ["ctrlPointRev",displayNull],1.5,0.4] call BIS_fnc_ctrlSetScale;
    [uiNamespace getVariable ["ctrlPoint",displayNull],1.5,0.4]    call BIS_fnc_ctrlSetScale;
    [uiNamespace getVariable ["ctrlCenter",displayNull],1.5,0.4]   call BIS_fnc_ctrlSetScale;


    ["MouseButtonUp ON"] call hints;
  }'];

  _ctrlArrow ctrlSetEventHandler ['MouseButtonUp','
  if ((_this select 1) isEqualTo 1) then {
    isActiveRotation = false;

    [uiNamespace getVariable ["ctrlArrow",displayNull],1,0.3]    call BIS_fnc_ctrlSetScale;
    [uiNamespace getVariable ["ctrlPointRev",displayNull],1,0.3] call BIS_fnc_ctrlSetScale;
    [uiNamespace getVariable ["ctrlPoint",displayNull],1,0.3]    call BIS_fnc_ctrlSetScale;
    [uiNamespace getVariable ["ctrlCenter",displayNull],1,0.3]   call BIS_fnc_ctrlSetScale;

    uiNamespace setVariable ["ctrlArrow",displayNull];
    uiNamespace setVariable ["ctrlPointRev",displayNull];

  }'];
  _ctrlArrow ctrlEnable true;

  _Xcoord = if (_isLeft) then {
      _Xcoord - (0.14 * _ctrlAmount);
    } else {
      _Xcoord + (0.14 * _ctrlAmount);
    };
    _idc = _idc + 1;
};

[_display] spawn {
  while {!(isNull (_this select 0))} do {
    if !(isNull (uiNamespace getVariable ["ctrlPointRev",displayNull])) then {
      if (ReverseRotationClockwise isEqualTo 0) then {ReverseRotationClockwise = 0};
      uiNamespace getVariable ["ctrlPointRev",displayNull] ctrlSetAngle [ReverseRotationClockwise, 0.5, 0.5];
      ReverseRotationClockwise = ReverseRotationClockwise -1;
      uiSleep 0.005;
    };
  };
};

[_display] spawn {
  while {!(isNull (_this select 0))} do {
    if !(isNull (uiNamespace getVariable ["ctrlPointRev",displayNull])) then {
      if (RotationClockwise isEqualTo 360) then {RotationClockwise = 0};
      uiNamespace getVariable ["ctrlPoint",displayNull] ctrlSetAngle [RotationClockwise, 0.5, 0.5];
      RotationClockwise = RotationClockwise + 1;
      uiSleep 0.001;
    };
  };
};

_display displayAddEventHandler ['MouseMoving', 'call RRPClient_system_mousebtnUP_CircleRotate;'];
