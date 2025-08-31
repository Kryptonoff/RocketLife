#include "common_defines.inc"
disableSerialization;

params ["_path", "_step"];
private _alientCtrl = UIGetVal(UIGameDisplay) getvariable (_path select _step);

private _alienCtrlPos = ctrlPosition _alientCtrl;
_alienCtrlPos params ["_ctrlX", "_ctrlY", "_ctrlW", "_ctrlH"];

private _offset = UIGetVal(UIInterfaceSize) * linearConversion [0, 4, _step, 0.01, 0.03];

_alientCtrl ctrlSetPosition [_ctrlX -_offset, _ctrlY - _offset, _ctrlW + _offset * 2, _ctrlH + _offset * 2];
_alientCtrl ctrlCommit 0;
_alientCtrl ctrlShow true;

playSound format ["AlienMove%1", _step]; 

_alientCtrl ctrlSetPosition _alienCtrlPos;
_alientCtrl ctrlCommit 0.15;