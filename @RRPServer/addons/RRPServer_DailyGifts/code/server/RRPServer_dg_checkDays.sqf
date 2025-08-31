
params [
	["_unit",objNull]
];

if (isnull _unit) exitWith {};
private _uid = getPlayerUID _unit;
private _getDayDiff = format ["getRewardDays:%1",_uid] call RRPServer_DB_selectSingle;
_getDayDiff params ["_dateDiff","_days"];
_response = [_days,false];
call {
	if (_getDayDiff isEqualTo [0,0]) exitWith {
		format ["setRewardDay:1:%1",_uid] call RRPServer_DB_fireAndForget;
		_response set [1,true];
	};
	if (_dateDiff isEqualTo 0) exitWith {};
	if (_dateDiff isEqualTo 1) exitWith {
		format ["setRewardDay:%1:%2",_days + 1,_uid] call RRPServer_DB_fireAndForget;
		_response set [0,_days + 1];
		_response set [1,true];
	};
	if (_dateDiff > 1) exitWith {
		format ["setRewardDay:1:%1",_uid] call RRPServer_DB_fireAndForget;
		_response set [0,1];
	};
};

_response remoteExecCall ["RRPClient_dg_*",owner _unit];
