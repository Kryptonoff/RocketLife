/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	"_price",
	["_discount",0,[0]]
];

if (_discount isEqualTo 0) exitWith {_price};
_price = _price - round((abs _price) / 100 * _discount);
_price
