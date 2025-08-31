/*
	Author:	Arrra
	SteamID: 76561198090549826
	Discord: merkava#9745
	My VK:https://vk.com/id478482025
*/
#include "..\..\script_macros.hpp"
private _mode = param [0,"",[""]];
private _EventMessage = param [1,"",[""]];

switch (_mode) do 
{
	case "start":
	{
		[
			"Радиоактивная утечка!",
			_EventMessage,
			10,
			"red",
			"\smart_icons_pack\paa\massage_dlya_hintov\Radioactive.paa"
		] call RRPClient_gui_baguetteExt_show;
	};
	case "finish":
	{
		[
			"Радиоактивная утечка!",
			"Облако улетело за границы острова! Отбой тревоги!",
			10,
			[0.259,1,0,1],
			"\smart_icons_pack\paa\massage_dlya_hintov\Radioactive.paa"
		] call RRPClient_gui_baguetteExt_show;
	};
};