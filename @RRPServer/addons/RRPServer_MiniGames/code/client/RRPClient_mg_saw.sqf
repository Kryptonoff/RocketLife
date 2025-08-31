/*

	Filename:	RRPClient_mg_saw.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
disableSerialization;
if !(createDialog "RocketDialogSaw") exitWith {["Не открыли диалог"] call toastError};
private _dialog = findDisplay 9700;
private _startBtn = _dialog displayCtrl 9704;
private _stopBtn = _dialog displayCtrl 9705;
_stopBtn ctrlEnable false;

stopSaw = false;
runSaw = false;

rp_game_won = false;
rp_game_lose = false;

waitUntil {call RRPCLient_animation_kneelWork; (isNull _dialog) OR rp_game_won OR rp_game_lose};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
closeDialog 0;