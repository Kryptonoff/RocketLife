/*
Author:	Arrra
SteamID: 76561198090549826
Discord: merkava#9745
My VK:https://vk.com/id478482025
*/
#include "..\script_macros.hpp"


_obj = _this select 3;
if(life_bell_lock != 0 && {(time - life_bell_lock) < (5 * 60)}) exitWith {["InfoTitleAndText", ["Info","Вы не можете звонить некоторое время..."]] call SmartClient_gui_toaster_addTemplateToast;};
if(life_bell_count < 3)then
	{
		if(life_bell_time !=0 && {(time - life_bell_time) < (3 * 60)}) then 
			{
				life_bell_count = life_bell_count +1;
				life_bell_time = time;
			}
		else
			{
				life_bell_time = time;
				life_bell_count = 1;
			};
	}
else
	{
		life_bell_lock = time;
	};
	
uiSleep 0.2;
[_obj,"welmen_zvonoc_3",140] remoteExecCall ["RRPClient_util_globalSound",RCLIENT];
