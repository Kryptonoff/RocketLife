/*
Author:	Arrra
SteamID: 76561198090549826
Discord: merkava#9745
My VK:https://vk.com/id478482025
*/

private["_object","_sound","_radius"];
_object = param [0,ObjNull,[ObjNull]];
_sound = param [1,"",[""]];
_radius = param [2,-1,[0]];
if(isNull _object OR {_sound isEqualTo ""}) exitWith {};


_object say3D [_sound, _radius];