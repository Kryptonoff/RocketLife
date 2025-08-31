#include "common_defines.inc"
disableSerialization;

private _zapCtrl = UIGetVal(UIZapEffectCtrl);

_zapCtrl ctrlSetPosition ctrlPosition UIGetVal(UICatcherCtrl);
_zapCtrl ctrlSetFade 0;
_zapCtrl ctrlCommit 0;

playSound "AlienZap";

_zapCtrl ctrlSetPosition _catcherCtrlPos;
_zapCtrl ctrlSetFade 1;
_zapCtrl ctrlCommit ZAP_EFFECT_TIME;