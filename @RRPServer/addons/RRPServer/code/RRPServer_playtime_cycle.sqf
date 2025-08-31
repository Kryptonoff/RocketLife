{
	_playerUID = getPlayerUID _x;
	_totalPlayTime = _x getVariable ["PlayerTime",-1];
	// [_playTime, _allPlayTime, _totalPlayTime, (_totalPlayTime mod 13)] call RRPServer_util_debugConsole;

	switch (true) do {
		case ((_totalPlayTime isNotEqualTo 0) and (_totalPlayTime mod 180) isEqualTo 0): {
			//выдача кейса
			[getPlayerUID _x, "free_case2",30] call RRPServer_case_add;

			_x setVariable ["PlayerTime",_totalPlayTime + 1,true];
			[_playerUID] call RRPServer_session_updatePlayTime
		};

		default {};
	};
} forEach (allPlayers - entities "HeadlessClient_F");
