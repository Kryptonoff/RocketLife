/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [["_bool",false,[false]],["_price",0,[0]]];
if (_price isEqualTo 0) exitWith {_price}; 
if (_bool) then
{
	private _tax = round (_price * (server_tax/100));
	_price = _price + _tax;
}else{
	private _tax = round (_price * (server_tax/100));
	life_tmp_tax = life_tmp_tax + _tax;
	_price = _price - _tax;
};
_price