/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !("tfarRead" call RRPClient_groups_util_permCheck) exitWith {};
params ["_initiator","_newFreq"];
RRPClientGroupInfo set ["tfar",_newFreq];
["Обновлены частоты!",format["Инициировал: %2%1<br/>Частота ДВ: %3 kHz%1<br/>Частота КВ: %4 mHz",endl,_initiator,_newFreq select 0,_newFreq select 1],10, [0.247,0.831,0.988,1]] spawn RRPClient_gui_baguetteExt_show; 
