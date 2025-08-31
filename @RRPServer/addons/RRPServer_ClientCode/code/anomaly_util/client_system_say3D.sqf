/*

	Filename: 	client_system_say3D.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	VK:		    https://vk.com/id194667034
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
private _from = param [0];
private _sound = param [1,"",[""]];
private _maxDistance = param [2,100,[0]];
private _pitch = param [3,1,[0]];
private _isSpeech = param [4,false,[false]];

if (EQUAL(_sound,"")) exitWith {};

_from say3D [_sound,_maxDistance,_pitch,_isSpeech];