/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
params [
	["_robber",ObjNull,[ObjNull]],
	["_who","",[""]]
];
closeDialog 0;
if (isNull _robber OR (_who isEqualTo "")) exitWith {};
if ((RRPClientCashMoney > 0) OR (RRPClientCashMoneyD > 0)) then {
	["ErrorTitleAndText", ["Вас ограбили", format["-%1$ <br/>-$%2 грязных денег",(RRPClientCashMoney call BIS_fnc_numberText),(RRPClientCashMoneyD call BIS_fnc_numberText)]]] call SmartClient_gui_toaster_addTemplateToast;
	titleText[format["Сохраните PID - %1 если считаете это нарушением",_who],"PLAIN"];

	[RRPClientCashMoney,RRPClientCashMoneyD] remoteExecCall ["RRPClient_system_robReceive",_robber];
	[player,"cash","drop",STR(RRPClientCashMoney)] remoteExecCall ["RRPServer_system_moneyChange",2];
	[player,"dcash","drop",STR(RRPClientCashMoneyD)] remoteExecCall ["RRPServer_system_moneyChange",2];

	[getPlayerUID _robber,"211AB"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	[format["%1 ограбил %2 на %3$ и D%4",_who,getPlayerUID player,(RRPClientCashMoney call BIS_fnc_numberText),(RRPClientCashMoneyD call BIS_fnc_numberText)],"robPlayerLog"] remoteExecCall ["RRPServer_system_logIt",2];
} else {
	[2,"У %1 нет денег.",true,[player getVariable ["realname",""]]] remoteExecCall ["RRPClient_system_broadcast",_robber];
};
