/*
Author:	Arrra

http://steamcommunity.com/id/sdfsfsdgdfgdgdfg/

My VK:https://vk.com/id478482025
*/
#include "..\..\..\script_macros.hpp"

player playAction "FT_Act_Box_Idle";
port_box attachTo [player,[-0.2, 0, 0.23],"RightHand"];
player playAction "FT_Act_Box_Idle";

//addAct_box = player addAction ["Положить коробку",RRPClient_jobs_boxPutDown,nil,0,false,true,"",' box_work_port_active && port_box in (attachedObjects player)']; <---------для положить

/*
waitUntil {uiSleep 0.03; player forceWalk true; 
	!(EQUAL(CURWEAPON,"")) OR 
	{!(NOTINVEH(player))} OR 
	{isNull port_box} OR 
	{!box_work_port_active}  OR 
	{!(port_box in (attachedObjects player))}
};

player forceWalk false;

player removeAction addAct_box; <---------для положить

if (port_box in (attachedObjects player)) then {
	call SmartClient_jobs_boxPutDown;
};
*/

if (EQUAL(CURWEAPON,"")) then {
	player PlayActionNow "FT_Act_Gesture_Reset";
};
