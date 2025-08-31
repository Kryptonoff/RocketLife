private["_info","_ret"];
_ret = param [0,objNull,[objNull]];

if (isNull _ret) exitWith {};

_info = call RRPClient_id_info;
_data = profileNamespace getVariable ["PRNS_Ach_allKnowMeUIDS",[]];
if ((getPlayerUID _ret) isEqualTo "76561197984276591") then {
	["rimas",1] call RRPClient_ach_gateway;
};
if (!((getPlayerUID _ret) in _data) && {(getPlayerUID player) isEqualTo (getPlayerUID _ret)}) then
{
	['allKnowMe',1] call RRPClient_ach_gateway;
	_data pushBackUnique (getPlayerUID _ret);
	profileNamespace setVariable ["PRNS_Ach_allKnowMeUIDS",_data];
	saveProfileNamespace;
};
["RRP_Act_Gst_Show_Docs"] call RRPClient_gestures_playAction;
_info remoteExecCall ["RRPClient_id_show",_ret];
