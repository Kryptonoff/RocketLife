
private["_target","_info","_data"];
_target = cursorObject;

if((isNull _target) OR {!(_target isKindOf "Man")} OR {!(alive _target)}) exitWith{};

_info = call RRPClient_id_info;
if ((getPlayerUID _target) isEqualTo "76561197984276591") then {
	["rimas",1] call RRPClient_ach_gateway;
};
_data = profileNamespace getVariable ["PRNS_Ach_allKnowMeUIDS",[]];
if !((getPlayerUID _target) in _data) then
{
	['allKnowMe',1] call RRPClient_ach_gateway;
	_data pushBackUnique (getPlayerUID _target);
	profileNamespace setVariable ["PRNS_Ach_allKnowMeUIDS",_data];
	
	saveProfileNamespace;
};
_info remoteExecCall ["RRPClient_id_show",_target];
