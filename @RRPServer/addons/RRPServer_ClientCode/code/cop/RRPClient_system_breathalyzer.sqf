/*
	
	Filename: 	RRPClient_system_breathalyzer.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
private["_cop","_drinky"];
_cop =  param [0,ObjNull,[ObjNull]];
if(isNull _cop) exitWith {};
_drinky = life_drink;
if(_drinky > 0.07) then {
	[1,format["Анализ %1 \n\n Уровень алкоголя в крови: %2 \n\n Уровень алкоголия превышает норму",player call getNickName,[_drinky] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_system_broadcast",_cop];
} else {
	[1,format["Анализ %1 \n\n Уровень алкоголя в крови: %2 \n\n Уровень алкоголя не превышает норму",player call getNickName,[_drinky] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_system_broadcast",_cop];
};