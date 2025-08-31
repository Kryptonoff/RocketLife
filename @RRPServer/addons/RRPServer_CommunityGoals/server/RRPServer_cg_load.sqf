private _player = param [0,objNull];
private _playerUid = getPlayerUID _player;
private _communityGoals = format["loadCommunityGoals:%1", _playerUid] call RRPServer_DB_selectFull;

{
	_goalId = _x select 0;
	_goalParticipantsAmount = _x select 2;
	_goalParticipants = format["loadCommuntyGoalParticipants:%1", _goalId] call RRPServer_DB_selectFull;
	_goalParticipants = _goalParticipants apply {_x#0};

	_topFive = [];
	_top10Percent = [];
	_top25Percent = [];
	_top50Percent = [];

	if (_goalParticipantsAmount < 6) then {
		_topFive = _goalParticipants;
	} else {
		_goalParticipantsAmount = count _goalParticipants;

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
	
	_goalContributionLevel = [_topFive, _top10Percent, _top25Percent, _top50Percent, [_playerUid]] findIf {_playerUid in _x};
	_communityGoals set [_foreachIndex, _x + [_goalContributionLevel]];
} forEach _communityGoals;

_communityGoals remoteExecCall ["RRPClient_tablet_app_communityGoals_load", _player];