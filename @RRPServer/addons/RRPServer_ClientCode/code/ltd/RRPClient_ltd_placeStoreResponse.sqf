/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params 
[
	["_bool",false,[false]]
];

if (_bool) then
{
	["SuccessTitleAndText",["Одобрен!","Управление вашими магазинами всегда доступно в меню 'Бизнес'!"]] call SmartClient_gui_toaster_addTemplateToast;
	[player,"point","take",STR(6600)] remoteExecCall ["RRPServer_system_moneyChange",2];
	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name player,getPlayerUID player,"ltd",_cost,"Купил магазин"] remoteExecCall ["RRPServer_DB_lk_fireAndForget",2];
	['ashot',1] call RRPClient_ach_gateway;
};