/*

	Filename: 	RRPClient_system_pardon.sqf
	Web:		Rimas RP
*/
#include "..\..\script_macros.hpp"
disableSerialization;

if (police_comp_wanted_target isEqualto "") then 
{
	["WarningTitleAndText", ["Внимание!", "Игрок не выбран!"]] call SmartClient_gui_toaster_addTemplateToast;
}
else 
{
	[police_comp_wanted_target] remoteExecCall ["RRPServer_ws_wantedRemove",2];
};
closeDialog 0;
