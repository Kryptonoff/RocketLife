/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !((leader group player) isEqualTo player) exitWith {["ErrorTitleOnly",[format["Эй! Не ты создавал, не тебе и рушить!",groupId (group player)]]] call SmartClient_gui_toaster_addTemplateToast;};
["MainMenu",0] call RRPClient_tablet_slide;
[group player] remoteExecCall ["RRPServer_party_disbandRequest",2];
