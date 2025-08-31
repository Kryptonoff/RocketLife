/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params[['_alias', '', ['', []]], ['_diff', 0, [0]]];
if (_alias isEqualTo '') exitWith {false};
_profileData = parseSimpleArray (["Achievments","[]"] call RRPClient_reg_read);
private _completed = RRPClientCompleteAch;
if (_alias in _completed) exitWith {false};
private _apply = {
	private _profileIndex = [_profileData,_var] call RRPClient_util_find;
	if (_profileIndex isEqualTo -1) then
	{
		_profileData pushBack [_var,0,false];
		_profileIndex = ((count _profileData) -1);
	};
	private _achievementData = _profileData select _profileIndex;
	_achievementData params ['_var','_currentValue', '_complete'];
	if (_complete) exitWith {false};
	_currentValue = (_currentValue + _diff) min(_milestone * _milestoneFraction);
	_achievementData set [1, _currentValue];
	if (_currentValue >= (_milestone * _milestoneFraction)) then {
		_achievementData set [2, true];
		[_title, compile _rewardCode,_var] spawn RRPClient_ach_complete;
	};
	_profileData set [_profileIndex, _achievementData];
	["Achievments", str _profileData] call RRPClient_reg_write;
};
switch (true) do 
{
	case (_alias isEqualType ''):
	{
		_class = _alias;
		_configData = _alias call RRPClient_ach_getConfig;
		if (_configData isEqualTo false) exitWith {false};
		_configData params ['_var', '_title', '_description', '_milestone', '_milestoneFraction', '_rewardCode'];
		call _apply;
	};
	case (_alias isEqualType[]):
	{
		{
			_class = _x;
			_configData = _class call RRPClient_ach_getConfig;
			if (_configData isEqualTo false) exitWith {false};
			_configData params['_var', '_title', '_description', '_milestone', '_milestoneFraction', '_rewardCode'];
			call _apply;
		}forEach _alias;
	};
};
true