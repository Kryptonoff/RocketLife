/*
	Author:	Arrra
	SteamID: 76561198090549826
	Discord: merkava#9745
	My VK:https://vk.com/id478482025
*/

#include "..\..\script_macros.hpp"
if (isNil "ClientEventInfo") exitWith { ["ErrorTitleAndText",["Ошибка","Нету евент-зон, что бы удалять"]] call SmartClient_gui_toaster_addTemplateToast};
[] remoteExec ["RRPServer_system_deleteEventZone",2];