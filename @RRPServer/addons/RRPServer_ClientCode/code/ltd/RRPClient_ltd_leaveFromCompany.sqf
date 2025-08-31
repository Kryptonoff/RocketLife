/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

RRPClientLTDsData params ["_id","_name"];
_action = [ format["Вы уверены что хотите покинуть компанию '%1'?",_name],"Покинуть?","Да","Нет"] call BIS_fnc_guiMessage;
if (_action) then
{
	closeDialog 0;
	[_id,player] remoteExecCall ["RRPServer_ltd_leave",2];
}else{};