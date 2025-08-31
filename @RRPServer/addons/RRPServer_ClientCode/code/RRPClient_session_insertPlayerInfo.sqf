/*
	Filename: 	RRPClient_session_insertPlayerInfo.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if(life_session_completed) exitWith {};
uiNamespace setVariable ["loading_desc_text","Сервер не нашел информации об игроке с таким UID. Попытка добавть пользователя в систему."];

[steamid,profileName,player] remoteExec ["RRPServer_DB_insertRequest",2];