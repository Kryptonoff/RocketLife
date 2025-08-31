/*
	Filename: 	fn_preInit.sqf
	Project: 	Smart Role Play
	Author:		Arrra and Fairy Tale
	https://vk.com/arrrovich
	https://vk.com/juba_johnson
*/
#include "..\..\script_macros.hpp"
params [
	["_message","",[""]],
	["_type","info",[""]]
];

private _img = switch (_type) do {
	case "info": {"info.paa"};
	case "warning": {"warning.paa"};
	case "news": {"news.paa"};
	case "done": {"done.paa"};
	case "error": {"error.paa"};
	case "money": {"money.paa"};
	case "police": {"police.paa"};
};

[_message,_type] call hints;