#include "common_defines.inc"
disableSerialization;

private _size = UIGetVal(UIInterfaceSize);
private _ctrlCatchFail = UIGetVal(UIFailEffectCtrl);

_ctrlCatchFail ctrlSetPosition [_size / 3, 0.5 * _size,_size/3,_size/3];
_ctrlCatchFail ctrlCommit 0;
_ctrlCatchFail ctrlShow true;

playSound "AlienJump";

_ctrlCatchFail setVariable ["HoldControl", true];
_ctrlCatchFail ctrlSetPosition [0,0,_size,_size*4/3];
_ctrlCatchFail ctrlCommit 0.03;

if (_this <= 0) then { 0.33 fadeMusic 0 };

