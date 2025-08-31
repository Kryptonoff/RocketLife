if !(canSuspend) exitWith {_this spawn RRPClient_gui_chat};
private _display = uiNamespace getVariable ["playerHUD",displayNull];
private _group = _display displayCtrl 23300;
private _chat = _group controlsGroupCtrl 23301;
_group ctrlSetFade 0;
_group ctrlCommit 0.5;
RRPClientChatLastTick = diag_tickTime;
private _chatHistory = uiNamespace getVariable ["ChatHistory",[]];
diag_log format ["CHAT: %1",_this];
_chatHistory pushBack (format ["<t font='Ubuntu' size='0.9' shadow='1'><t color='#FFC500'>[%1:%2]:</t> %3</t>",
(RRPPublicTime select 3) call RRPClient_tablet_util_doubleDigits,
(RRPPublicTime select 4) call RRPClient_tablet_util_doubleDigits, _this]);
if ((count _chatHistory) > 10) then {
	_chatHistory deleteAt 0;
};
uiNamespace setVariable ["ChatHistory",_chatHistory];
reverse _chatHistory;
_chat ctrlSetStructuredText parseText (_chatHistory joinString "<br/>");
reverse _chatHistory;
