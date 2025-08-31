/*

	Filename: 	RRPClient_system_logout.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
private _deathmax = param [0,false,[false]];
disableSerialization;
player allowDamage false;
hintSilent "";
disableUserInput true;
closeDialog 0;
call RRPClient_session_updateRequest;
call RRPClient_system_saveGear;
[[player],"playerSaveQueue_playerUpdate"] call RRPClient_system_hcExec;

call BIS_fnc_VRFadeOut;
uiSleep 1;
_effectID = 1 + floor random 3;
_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
_video = [_videoFile] spawn BIS_fnc_playVideo;
playSound ("Transition" + str _effectID);

uiSleep 1;
if (_deathmax) then 
{
	[(parseText format["<t size='1.3' color='#ccff00'>У вас закончились жизни,<br/>%1!</t><br/><br/><t size='0.6'>Возвращайтесь после бури!</t>",player call getNickName]),0, 0.2, 2, 0.5, 0, 1000] spawn BIS_fnc_dynamicText;
} else {
	[(parseText format["<t size='1.3' color='#ccff00'>До новых встреч,<br/>%1!</t><br/><br/><t size='0.6'>Идет сохранение данных на сервере...</t>",player call getNickName]),0, 0.2, 2, 0.5, 0, 1000] spawn BIS_fnc_dynamicText;
};
uiSleep 6;

0 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;

disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;

(format ["#kick %1",getPlayerUID player]) remoteExecCall ["RRPServer_DB_sendRconCommand",2];