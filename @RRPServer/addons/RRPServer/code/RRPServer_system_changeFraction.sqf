/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_player",objNull,[objNull]],
	["_side","",[""]],
	["_price",0]
];

try {
	if (isNull _player) throw "Игрок не определен!";
	if (_side isEqualTo "") throw "Не определена будущая фракция";
	if (_price isEqualTo 0) throw "Цена не может быть 0";

	[_player,"atm","take",_price] call RRPServer_system_moneyChange;
	[_player,"serverbank","add",_price] call RRPServer_system_moneyChange;
	_player setVariable ["RRPSide",_side,true];
	format ["updateSide:%1:%2",_side,getPlayerUID _player] call RRPServer_DB_fireAndForget;
	private _text = ["бандитская","гражданскую"] select (_side isEqualTo "civ");
	[ (["zrada","myatezh"] select (_side isEqualTo "civ")) ,1] remoteExecCall ["RRPClient_ach_gateway",_player];
	[format["%1 (%2) сменил фракцию на %3",name _player,getPlayerUID _player,_text],"ChangeFractionLog"] remoteExecCall ["RRPServer_system_logIt",2];
	["SuccessTitleOnly",[format ["Вы сменили фракцию на %1",_text]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
}catch{
	["ErrorTitleOnly",[_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
};

RRPClientWaitResponse = nil;
(owner _player) publicVariableClient "RRPClientWaitResponse";

true
