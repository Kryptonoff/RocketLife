
params ["_control","_index"];

_vehicle = objectFromNetId (_control lbData _index);
if (isNull _vehicle) exitWith {};
_display = ctrlParent _control;
_display setVariable ["vehicle",_vehicle];
[_vehicle] spawn RRPClient_garage_storePreview;
