/*

	Filename: 	client_system_isInputBlocked.sqf
	Project: 	Altory Life RPG
	Author:		RamboKZ
	VK:		    https://vk.com/id194667034
	Web:		http://altory.ru/

*/
#include "..\..\macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_block",true,[true]]
];

if (isNull _unit) exitWith {true};

_ret = if (_block) then {
    GVAR_RESTRAINED(_unit) OR LSINCAP(_unit) OR !(NOTATTACHED(_unit)) OR _unit GVAR ["knoked",false] OR _unit GVAR ["tazed",false] OR _unit GVAR ["isBlind",false]
} else {
    LSINCAP(_unit) OR !(NOTATTACHED(_unit)) OR _unit GVAR ["knoked",false] OR _unit GVAR ["tazed",false] OR _unit GVAR ["isBlind",false] OR _unit GVAR ["restrained_userInput",false] OR _unit GVAR ["restrained_prone",false]
};

_ret;
