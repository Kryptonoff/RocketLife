/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_mode",false,[false]],
	["_text","",[""]],
	["_netID","",[""]]
];

RRPClientLTDsData params ["_id","_name"];
if (_mode) then
{
	[_id,_netID,player] remoteExecCall ["RRPServer_ltd_invite",2];
	["SuccessTitleOnly", [_text]] call SmartClient_gui_toaster_addTemplateToast;
	
}else{
	["ErrorTitleOnly", [_text]] call SmartClient_gui_toaster_addTemplateToast;
};


