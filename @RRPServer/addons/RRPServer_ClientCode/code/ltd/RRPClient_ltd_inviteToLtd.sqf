/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	["_owLTD",objNull,[objNull]],
	["_name","",[""]],
	["_id",0,[0]]
];

try
{
	if !(RRPClientLTDsData isEqualTo []) throw "Выбранный игрок уже состоит в компании";
	_action = [ format["Вас пригласили в компанию '%1'",_name],"Принять приглашение?","Да","Нет"] call BIS_fnc_guiMessage;
	waitUntil {!isNil "_action"};
	if (_action) then
	{
		[true,"Приглашаемый принял приглашение, спрашиваем у сервера...",netID player] remoteExecCall ["RRPClient_ltd_invitedResponse",_owLTD];
	}else{ throw "Приглашаемый отказался от вступления в компанию"; };
	
}catch{
	[false,_exception] remoteExecCall ["RRPClient_ltd_invitedResponse",_owLTD];
};