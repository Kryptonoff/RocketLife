/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !(isNil {profileNamespace getVariable "achies"}) then {
	["Achievments",str (profileNamespace getVariable "achies")] call RRPClient_reg_write;
	
	profileNamespace setVariable ["oldachies",profileNamespace getVariable "achies"];
	profileNamespace setVariable ["achies",nil];
	saveProfileNamespace;
};

private _d = parseSimpleArray(["Achievments","[]"] call RRPClient_reg_read);

private _t = count RRPClientCompleteAch;

{
	_x params ["_var","","_c"];
	if (_c) then {
		RRPClientCompleteAch pushBackUnique _var;
	}; 
}forEach _d;

if (_t isEqualTo count RRPClientCompleteAch) then {
	[[RRPClientCompleteAch,getPlayerUID player],"ach_save"] call RRPClient_system_hcExec;
};
true