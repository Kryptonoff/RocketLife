private["_messageName", "_fields", "_numberOfFields", "_i", "_field", "_message"];
_messageName = _this select 0;
_fields = _this select 1;
_numberOfFields = count _fields;
for "_i" from 0 to _numberOfFields - 1 do 
{
	_field = _fields select _i;
	if ((typeName _field) isEqualTo "SCALAR") then 
	{
		_fields set[_i, _field call RRPClient_util_scalarToString];
	};
};
_message = "";
_message = _fields joinString ":";
_message = [_messageName, _message] joinString ":";
_message