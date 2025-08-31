

private _value = _this select 0;
private _valid = ["0","1","2","3","4","5","6","7","8","9"];
private _array = _value splitString "";
private _return = true;

{
	if !(_x in _valid) exitWith	
	{
		_return = false;
	};
} foreach _array;
_return;