/*

	Filename: 	RRPClient_message_copToTargetGetMessage.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_messageID",0,[0]]
];
if (isNull _unit) exitWith {"CopToTargetGetMessage - unit isNull" call RRPClient_system_log};
if (EQUAL(_messageID,0)) exitWith {"CopToTargetGetMessage - messageID zero" call RRPClient_system_log};

private _text = switch (_messageID) do {
	case 1 : {"Немедленно остановитесь, выйдите из техники и поднимите руки вверх! В случае невыполнения требований полиции будет открыт огонь на поражение!"}; 
	case 2 : {"Немедленно остановитесь! Заглушите двигатель и оставайтесь в транспортном средстве! Ожидайте дальнейших указаний! В случае невыполнения требований будет применено оружие!"}; 
	default {""};
};

if (EQUAL(_text,"")) exitWith {"CopToTargetGetMessage - no text for messageID" call RRPClient_system_log};


format ["<t color='#0e83e6'><t size='2'><t align='center'>Полицейское сообщение<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%2",GVAR_RNAME(_unit),_text] call hints;
		
["PoliceDispatch",["Вы получили сообщение от полиции!"]] call bis_fnc_showNotification;
player say3D "sms";