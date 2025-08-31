/*

	Filename: 	RRPClient_evh_cameraView.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params ["_playerUnit", "_newCameraMode"];
if (life_inwarzone OR {(_playerUnit GVAR ["inPBfight",false])} or {RRPClientPlayerOnStratis}) then
{
	if !(_newCameraMode in ["INTERNAL","GUNNER"]) then
	{
		_playerUnit switchCamera "INTERNAL";
		["InfoTitleOnly",["Вы находитесь в зоне боевых действий! Вид от третьего лица недоступен!"]] call toast;
	};
};

if (player distance (getMarkerPos "prison_zone") < 400) then {
	if !(_newCameraMode in ["INTERNAL","GUNNER"]) then
	{
		_playerUnit switchCamera "INTERNAL";
	};
};

if (lifeState _playerUnit isEqualTo "INCAPACITATED") then
{
	if !(_newCameraMode in ["INTERNAL","GUNNER"]) then
	{
		_playerUnit switchCamera "INTERNAL";
	};
};
