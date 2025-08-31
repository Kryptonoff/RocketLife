/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _myname = param [0,"",[""]];
private _allowedNameChars = ["q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"," "]; 
private _splitName = _myname splitString ""; 
private _errorInName = false; 
private _spacesCount = 0; 

if (count(_splitName) > 6) then
{
	{ 
		if(_x == " ") then 
		{
			_spacesCount = _spacesCount + 1;
		};  
			if (_x == " " && {(_foreachindex == 0 || _foreachindex == count(_splitName) -1 )}) exitWith 
			{
				_errorInName = true;
			};
				if (_allowedNameChars find toLower(_x) < 0) exitWith 
				{
					_errorInName = true;
				};  
	} forEach _splitName; 
} else {
		_errorInName = true; 
	}; 
	if (_errorInName || {_spacesCount != 1}) exitWith 
	{ 
		false
	}; 
true