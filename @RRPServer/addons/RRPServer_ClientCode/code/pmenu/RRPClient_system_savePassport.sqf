
params ["_control","_index"];
private _data = _control lbData _index;
if (_data isEqualTo "") exitWith {};
life_myPassportID = _data;
[player] call RRPClient_id_showTo
