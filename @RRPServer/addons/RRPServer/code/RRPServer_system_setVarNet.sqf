/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
	
	Usage:-
		[netID object,"MyAwesomeVariable","MyData"] remoteExecCall ["RRPServer_system_setVarNet",2];
*/

("setVarNet " + str(_this)) call RRPServer_util_debugConsole;
params [
	["_nID","",[""]],
	["_var","",[""]],
	["_data",-1,[false,"",-1,[],nil]],
	["_public",false,[false]]
];
_object = objectFromNetId _nID;
("setVarNet " + str(_object)) call RRPServer_util_debugConsole;
_object setVariable [_var,_data,_public];
true
