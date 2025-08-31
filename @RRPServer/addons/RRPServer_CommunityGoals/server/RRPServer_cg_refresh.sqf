private _communityGoals = "loadCommunityGoalsAndExpired" call RRPServer_DB_selectFull;

{
	_x params ["_goalId", "_goalConfig", "_goalProgress", "_goalParticipantsAmount", "_goalExpired"];
	_goalAmount = getNumber(missionConfigFile >> "CfgCommunityGoals" >> _goalConfig >> "goal");	
	
	if (_goalExpired OR _goalProgress >= _goalAmount) then {
		diag_Log ["_goalId - ", _goalId, "_goalProgress >= _goalAmount - ", _goalProgress >= _goalAmount, "_goalExpired - ", _goalExpired];

		_goalProgressRatio = _goalProgress / _goalAmount;
		_goalTiers = configProperties [missionConfigFile >> "CfgCommunityGoals" >> _goalConfig >> "Tiers", "true", true];
		
		_goalCurrentTierSelection = _goalTiers findIf {getNumber(_x >> "neededAmount") > _goalProgressRatio};
		if (_goalCurrentTierSelection isEqualTo 0) then {
			diag_log ["_goalId", _goalId, "_goalCurrentTierSelection == 0"];
			["Общественные задачи", "Общественная задача закончилась и никто не получил награду"] remoteExecCall ["toastInfo", -2];
		} else {
			if (_goalCurrentTierSelection isNotEqualTo 0) then {_goalCurrentTierSelection = _goalCurrentTierSelection - 1};
			if (_goalCurrentTierSelection isEqualTo -2) then {_goalCurrentTierSelection = 7};
			_goalCurrentTierConfig = _goalTiers select _goalCurrentTierSelection;
			diag_log ["_goalId", _goalId, "_goalCurrentTierConfig", _goalCurrentTierConfig];

			_goalParticipants = format["loadCommuntyGoalParticipants:%1", _goalId] call RRPServer_DB_selectFull;
			_goalParticipants = _goalParticipants apply {_x#0};

			_topFive = [];
			_top10Percent = [];
			_top25Percent = [];
			_top50Percent = [];
			// _top75Percent = [];
			// _top100Percent = [];

			if (_goalParticipantsAmount < 6) then {
				_topFive = _goalParticipants;
			} else {
				_topFive = _goalParticipants select [0, 5];
				_goalParticipantsLast = _goalParticipants - _topFive;
				
				_goalParticipantsLastAmount = (count _goalParticipantsLast);

				_top10 = ceil(_goalParticipantsLastAmount * 0.1); 
				_top10Percent = (_goalParticipantsLast select [0, _top10]);

				_top25 = ceil(_goalParticipantsLastAmount * 0.25); 
				_top25Percent = (_goalParticipantsLast select [0, _top25]) - _top10Percent;

				_top50 = ceil(_goalParticipantsLastAmount * 0.50); 
				_top50Percent = (_goalParticipantsLast select [0, _top50]) - _top10Percent - _top25Percent;

				// _top75 = ceil(_goalParticipantsLastAmount * 0.75); 
				// _top75Percent = (_goalParticipantsLast select [0, _top75]) - _top10Percent - _top25Percent - _top50Percent;

				// _top100Percent = _goalParticipantsLast - _top10Percent - _top25Percent - _top50Percent - _top75Percent;
			};
			
			diag_log ["_goalParticipants", _goalParticipants];
			diag_log ["_topFive", _topFive];
			diag_log ["_top10Percent", _top10Percent];
			diag_log ["_top25Percent", _top25Percent];
			diag_log ["_top50Percent", _top50Percent];
			// diag_log ["_top75Percent", _top75Percent];
			// diag_log ["_top100Percent", _top100Percent];

			{
				_uids = _x;
				_rewardDisplayName = getText(_goalCurrentTierConfig >> "Rewards" >> format["Reward_%1", _forEachIndex] >> "displayName");
				_rewards = getArray(_goalCurrentTierConfig >> "Rewards" >> format["Reward_%1", _forEachIndex] >> "reward");
				
				if (_rewards isNotEqualTo []) then {
					{
						_x params ["_type", "_reward"];

						switch (_type) do { 
							case "kit": {
								{["__SERVER__", [_x, _reward]] call RRPServer_rewards_addKitRequest; diag_log [_x, _type, _reward]} forEach _uids;
							};
							case "single_item": {
								{["__SERVER__", [_x, _reward]] call RRPServer_rewards_addRewardsRequest; diag_log [_x, _type, _reward]} forEach _uids;
							};
							case "case": {
								{[_x, _reward, 900] call RRPServer_case_add; diag_log [_x, _type, _reward]} forEach _uids;
							}; 
							default {}; 
						};
					} forEach _rewards;
				};
			} forEach ([_topFive, _top10Percent, _top25Percent, _top50Percent] - [[]]);

			["Общественные задачи", "Общественная задача закончилась, награды были распределены"] remoteExecCall ["toastInfo", -2];
		};
		_goalItem = getText(missionConfigFile >> "CfgCommunityGoals" >> _goalConfig >> "item");
		RRPServer_communityGoalsItems deleteAt _goalItem;
		format ["setCommunityGoalFinished:%1", _goalId] call RRPServer_DB_fireAndForget;
	} else {
		_goalItem = getText(missionConfigFile >> "CfgCommunityGoals" >> _goalConfig >> "item");
		if !(_goalItem in RRPServer_communityGoalsItems) then {
			RRPServer_communityGoalsItems set [_goalItem, _goalId]; 
		};
	};
} foreach _communityGoals;

missionNamespace setVariable ["RRPServer_communityGoalsItems", RRPServer_communityGoalsItems, true];