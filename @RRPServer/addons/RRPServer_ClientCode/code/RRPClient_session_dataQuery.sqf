/*
	Filename: 	RRPClient_session_dataQuery.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if (life_session_completed) exitWith {};

uiNamespace setVariable ["loading_desc_text",format["Отправка запроса на сервер для информации об игроке с UID [%1]",steamid]];

(netID player) remoteExec ["RRPServer_session_loadPlayer",2];
