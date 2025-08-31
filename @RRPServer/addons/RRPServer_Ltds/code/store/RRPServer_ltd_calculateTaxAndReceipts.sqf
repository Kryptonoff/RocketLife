/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_price","_tax"];

_toSel = _price - round ((abs _price) / 100 * _tax);
_toOwner = round ((abs _price) / 100 * _tax);

[_toSel,_toOwner]
