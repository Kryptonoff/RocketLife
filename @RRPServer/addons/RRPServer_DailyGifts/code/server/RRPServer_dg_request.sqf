
params [
	"_sessionId",
	"_parameters"
];
_parameters params ["_days"];

_config = getMissionConfig "CfgDailyRewards" >> if (_days > 14) then {"unlimDay"}else{ format["day%1",_days]};
_reward = ([getArray(_config >> "rewards")] call CBA_fnc_shuffle) select 0;
