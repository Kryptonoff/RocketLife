
params ["_control","_index"];
private _data = _control lbData _index;
if (_data isEqualTo "") exitWith {};
life_myTitleID =_data;
call RRPClient_system_setTitle;
private _info = call RRPClient_system_getPassportText;