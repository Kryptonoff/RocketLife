params ["_message2parse", "_messageTime"]; 
1111 cutRsc ["helpmessage", "PLAIN", 2, false]; 
disableSerialization; 
_display = uiNameSpace getVariable ["helpmessage",displayNull]; 
_msgCtrl = _display displayCtrl 1112; 
_bgCtrl = _display displayCtrl 1110;
_bgCtrl ctrlSetBackgroundColor [0.26, 0.24, 0.31,0.5];
_bgCtrl ctrlSetPosition [ctrlPosition _bgCtrl select 0, ctrlPosition _bgCtrl select 1, 640*pixelW*(pixelGridBase/18), ctrlPosition _bgCtrl select 3]; 
_msgCtrl ctrlSetStructuredText parseText _message2parse; 
_adjustedHeight = ((ctrlTextHeight _msgCtrl) + (25*pixelW*(pixelGridBase/18))) max 40*pixelH*(pixelGridBase/18); 
_msgCtrl ctrlShow false; 
_bgCtrl ctrlSetPosition [ctrlPosition _bgCtrl select 0, ctrlPosition _bgCtrl select 1, 40*pixelW*(pixelGridBase/18), 40*pixelH*(pixelGridBase/18)]; 
_bgCtrl ctrlCommit 0; 
uiSleep 0.5; 
_bgCtrl ctrlSetPosition [ctrlPosition _bgCtrl select 0, ctrlPosition _bgCtrl select 1, 640*pixelW*(pixelGridBase/18), _adjustedHeight]; 
_bgCtrl ctrlCommit 0.25; 
uiSleep 0.3; 
_msgCtrl ctrlShow true; 
helperMsgRand = round(random(100)); 
[helperMsgRand, _messageTime] spawn 
{  
	uiSleep (_this select 1);  
	if((_this select 0) isEqualTo helperMsgRand) then 
	{
		1111 cutText ["", "PLAIN"]; 
	}; 
}; 