params ["_ctrl", "_config"];
_cb = _ctrl controlsGroupCtrl -102;
_cb ctrlAddEventHandler ["CheckedChanged",format ["[ctrlParentControlsGroup (_this#0), _this#1] call RRPClient_tablet_toggle",_onToggle]];
true
