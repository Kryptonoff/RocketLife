
closeDialog 0;
(findDisplay 46) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; 
cutText ["","BLACK",9];
private _text = "<t size='1.3' color='#ccff00'>До новых встреч,<br/>%1!</t><br/><br/><t size='0.6'>Идет сохранение данных на сервере...</t>";
[format[_text,name player],0,0.2,14,0,0,8] spawn BIS_fnc_dynamicText;

[[player],"playerSaveQueue_playerUpdate"] call RRPClient_system_hcExec;
call RRPClient_session_updateRequest;
call RRPClient_system_saveGear;

[{
	[
		getText(getMissionConfig "serverip"),		
		getText(getMissionConfig "serverPort"), 
		getText(getMissionConfig "serverPassword"), 
		getNumber(getMissionConfig "restartTimeOut")
	] call RRPClient_system_connectServer;
	["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
}, [], 5] call CBA_fnc_waitAndExecute;
