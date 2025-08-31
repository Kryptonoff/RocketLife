/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if (isServer) then 
{
	CAU_animate_list_global = [];
	addMissionEventHandler["EachFrame",{call CAU_animate_fnc_eachFrameServer}];
};

if !(isDedicated) then 
{
	CAU_animate_list_local = [];
	addMissionEventHandler["EachFrame",{call CAU_animate_fnc_eachFrameClient}];
};