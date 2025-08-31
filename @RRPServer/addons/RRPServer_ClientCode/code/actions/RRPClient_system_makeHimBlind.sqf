/*
	Filename: 	RRPClient_system_makeHimBlind.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try {
	private _unit = param [0,ObjNull,[ObjNull]];

	if (isNull _unit OR (player distance _unit > 3) OR (EQUAL(player,_unit)) OR !isPlayer _unit) exitWith {};
	if (_unit GVAR ["isBlind",false]) exitWith {};
	if !(GVAR_RESTRAINED(_unit)) exitWith {};

	([player] call RRPClient_system_isSafeZone) params ["_isSafeZone","_isNeutralZone"];
	if( _isSafeZone AND {!((ISPSIDE("cop")) AND {_isNeutralZone})}) throw "Вы находитесь в зеленой зоне!";
	if( ([player] call RRPClient_system_isShopNear) && {!(ISPSIDE("cop"))}) throw "Вы находитесь рядом с продавцом!";
	if (!("extItem_headBag" in (magazines player)) && {!(ISPSIDE("cop"))} ) throw "У вас нет необходимого предмета!";

	player say3D "blind";
	["extItem_headBag"] call RRPClient_system_removeItem;
	[player,steamid] remoteExec ["RRPClient_system_blinded",_unit];
}catch{
	["ErroTitleAndText",[_exception]] call toast;
};