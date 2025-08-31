/*
	Filename: 	RRPClient_system_drinkmoonshine.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
closeDialog 0;
["InfoTitleOnly",[format["Уровень алкоголя в крови: %1",[life_drink] call RRPClient_util_numberText]]] call toast;

uiSleep 4;
"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
//"wetDistortion" ppEffectEnable true;
enableCamShake true;

player SVAR ["inDrink",true,true];

for "_i" from 0 to 89 do
{
    if(life_drink > 0.15) then {
		
		//"wetDistortion" ppEffectAdjust [random 5];
		"chromAberration" ppEffectAdjust [random 0.07,random 0.07,true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust[0.04, 0.09, 0.25, 0.29];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uiSleep 1;
	} else {
		"chromAberration" ppEffectAdjust [random 0.03,random 0.03,true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust  [random 0.03,random 0.03,0.43,0.43];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uiSleep 1;
	};
};
if (life_drink > 0.22) then {
	titleText [ "Вы потеряли сознание","BLACK OUT"];
	player playMoveNow "Incapacitated";
	uiSleep 15;
	removeUniform player;removeVest player;
	player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
	uiSleep 10;
	life_drink = 0;
	titleText[ "Где я, кто я, почему я голый??","PLAIN"];
	player playMoveNow "amovppnemstpsraswrfldnon";			
	[0,format["%1 замечен пьяным в публичном месте!",GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];			

	[steamid,"390"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
};
//Stop effects
[player,"inDrink"] call RRPClient_system_clearGlobalVar;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;

resetCamShake;
if(life_drink != 0) then {life_drink = life_drink - 0.02;};