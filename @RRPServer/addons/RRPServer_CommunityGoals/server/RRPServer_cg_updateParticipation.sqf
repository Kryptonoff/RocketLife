params [
	["_player_uid", "", [""]],
	["_goalId", -1, ["", 1]],
	["_amount", -1, [-1]]
];

format ["updateCommunityGoalParticipation:%1:%2:%3", _player_uid, _goalId, _amount] call RRPServer_DB_fireAndForget;