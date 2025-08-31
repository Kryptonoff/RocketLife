/*
	Project: Async functions for extDB3
	Author: FairyTale5571
	License: CC BY-ND
*/
try
{
	private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";
	if !(_is_dev) throw "It can be used only on developer server";
	if (isRemoteExecuted) throw "Cannot be remoteExec";
	private _unl = parseSimpleArray("extDB3" callExtension "9:UNLOCK:aerc3e");
	if ((_unl select 0) isEqualTo 0) throw format ["extDB3 cant be unlocked: %1",(_unl select 1)];
	format ["extDB3 unlocked %1! #0101",_unl] call RRPServer_util_debugConsole;
	private _res = "extDB3" callExtension "9:RESET";
	format ["extDB3 reset %1! #0101",_res] call RRPServer_util_debugConsole;
	"cmd_arma" callExtension "copy_ini.bat";
	format ["al_custom.ini copied #0101",_res] call RRPServer_util_debugConsole;
	
	_is_dev call RRPServer_DB_connectToextDB;
}catch{
	format ["ReloadCustom Error: %1 #1001",_exception] call RRPServer_util_debugConsole;
};
true