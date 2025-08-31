_ret = -1;
_string = toArray (_this select 0);
_chars = toArray ";/!@#$%^&**()_=+:'`\|/";
{ 
	if (_x in _chars) exitWith
	{
		_ret = _x;
	};
}forEach _chars;
_ret
