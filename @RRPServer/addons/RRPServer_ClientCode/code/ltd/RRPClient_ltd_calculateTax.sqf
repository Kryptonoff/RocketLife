/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"

params 
[
	["_mode",true,[false]],
	["_price",0,[0]]
];

if (_price isEqualTo 0) exitWith {_price};
if (_mode) then
{
	//Только сумму
	private _tax = round (_price * (server_tax/100));
	ADD(_price,_tax);
}else{
	//Выводим цену вместе с добавлением налога
	private _tax = round (_price * (server_tax/100));
	ADD(life_tmp_tax,_tax);
	ADD(_price,_tax);
};
_price
