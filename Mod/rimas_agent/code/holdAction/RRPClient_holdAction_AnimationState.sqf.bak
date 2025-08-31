if (diag_tickTime > (missionNamespace getVariable["bis_fnc_holdAction_animationIdleTime", -1]) && {_eval}) then {
	bis_fnc_holdAction_animationIdleTime = diag_tickTime + 0.065;
	bis_fnc_holdAction_animationIdleFrame = (bis_fnc_holdAction_animationIdleFrame + 1) % 12;
	if (isNil "holdAction_scriptHandle" && {scriptDone holdAction_scriptHandle}) then {
		params["_title", "_iconIdle", "_hint"];
		[_originalTarget, _actionID, _title, _iconIdle, nil, bis_fnc_holdAction_animationIdleFrame, _hint] call RRPClient_holdAction_IconChangeState;
	};
};