if !(canSuspend) exitWith {_this spawn RRPClient_gui_chat_onLoad};
private _display = uiNamespace getVariable ["playerHUD",displayNull];
private _chat = _display displayCtrl 23300;

while {!(isNull _display)} do 
{
	if ((ctrlFade _chat) isEqualTo 1) then {continue};
	if !((RRPClientChatLastTick + 10) > diag_tickTime) then {
		_chat ctrlSetFade 1;
		_chat ctrlCommit 1;
	};
	uiSleep 1;
};
