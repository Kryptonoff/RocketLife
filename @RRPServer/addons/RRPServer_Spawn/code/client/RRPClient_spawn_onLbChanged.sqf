
params ["_control","_index"];
private _marker = _control lbData _index;
private _display = ctrlParent _control;

_display setVariable ["marker",_marker];
