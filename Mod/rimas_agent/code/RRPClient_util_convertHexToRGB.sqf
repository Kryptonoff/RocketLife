/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _nums = toArray "0123456789ABCDEF"; 
private _hex = toArray toUpper(_this select 0); 
if (_hex isEqualTo []) exitWith { [0,0,0,1] }; 
if ((count _hex) != 6) exitWith { [0,0,0,1] }; 
if ((_hex select 0) == 34) then { _hex deleteAt 0; }; 
private _isValid = true; 
{ 
 if !(_x in _nums) exitWith { _isValid = false; }; 
} forEach _hex; 
if !(_isValid) exitWith { [0,0,0,1] }; 
 
private _r = (_nums find (_hex select 0)) * 16 + (_nums find (_hex select 1)); 
private _g = (_nums find (_hex select 2)) * 16 + (_nums find (_hex select 3)); 
private _b = (_nums find (_hex select 4)) * 16 + (_nums find (_hex select 5)); 
 
if (_r != 0) then { _r = _r / 255; }; 
if (_g != 0) then { _g = _g / 255; }; 
if (_b != 0) then { _b = _b / 255; }; 
private _return = [_r, _g, _b,1]; 
_return