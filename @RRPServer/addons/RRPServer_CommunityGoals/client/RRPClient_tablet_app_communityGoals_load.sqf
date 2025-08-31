
disableSerialization;
RRPClientCommunityGoals = _this;
if (RRPClientCommunityGoals isEqualTo []) exitWith {
	["SmartTenders","В данный момент нет активных тендеров!"] call toastError;
	["MainMenu",1] call RRPClient_tablet_slide;
};

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 19000;

private _goalsCtrl = _slide controlsGroupCtrl 19002;
private _goalDescriptionCtrl = _slide controlsGroupCtrl 19003;
private _goalParametersCtrl = _slide controlsGroupCtrl 19004;
private _goalRewardsStructureTitleCtrl = _slide controlsGroupCtrl 19005;
private _goalRewardsStructureCtrl = _slide controlsGroupCtrl 19006;
_goalRewardsStructureCtrl ctrlSetPositionH 0.298 * safezoneH;
_goalRewardsStructureCtrl ctrlCommit 0;
private _goalProgressCtrl = _slide controlsGroupCtrl 19007;

lbClear _goalsCtrl;
{	
	_goalItem = getText(missionConfigFile >> "CfgCommunityGoals" >> (_x select 1) >> "item");

	_idx = _goalsCtrl lbAdd (getText(missionConfigFile >> "VirtualItems" >> _goalItem >> "displayName"));
	_goalsCtrl lbSetPicture [_idx, (getText(missionConfigFile >> "VirtualItems" >> _goalItem >> "icon"))];

} forEach RRPClientCommunityGoals;

_goalsCtrl ctrlAddEventHandler ["LBSelChanged", {
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 19000;
	
	private _goalsCtrl = _slide controlsGroupCtrl 19002;
	private _goalDescriptionCtrl = _slide controlsGroupCtrl 19003;
	private _goalParametersCtrl = _slide controlsGroupCtrl 19004;
	private _goalRewardsStructureTitleCtrl = _slide controlsGroupCtrl 19005;
	private _goalRewardsStructureCtrl = _slide controlsGroupCtrl 19006;
	private _goalProgressCtrl = _slide controlsGroupCtrl 19007;

	params ["_control", "_lbCurSel"];

	_goal = (RRPClientCommunityGoals select _lbCurSel) params ["_goalId", "_goalConfig", "_goalProgress", "_goalParticipants", "_goalDateEnd", "_goalContribution", "_goalContributionLevel"];
	_goalDescriptionCtrl ctrlSetStructuredText parseText format["<t size='0.8' align='center'>Внесите свой вклад и получайте награды продавая %1</t>", _goalsCtrl lbText _lbCurSel];
	
	_goalAmount = getNumber(missionConfigFile >> "CfgCommunityGoals" >> _goalConfig >> "goal");	
	_goalProgressRatio = _goalProgress / _goalAmount;
	_goalTiers = configProperties [missionConfigFile >> "CfgCommunityGoals" >> _goalConfig >> "Tiers", "true", true];
	_goalCurrentTierSelection = _goalTiers findIf {getNumber(_x >> "neededAmount") > _goalProgressRatio};
	if (_goalCurrentTierSelection isNotEqualTo 0) then {_goalCurrentTierSelection = _goalCurrentTierSelection - 1};
	if (_goalCurrentTierSelection isEqualTo -2) then {_goalCurrentTierSelection = 7};
	_goalCurrentTierConfig = _goalTiers select _goalCurrentTierSelection;
	_playerReward = getText(_goalCurrentTierConfig >> "Rewards" >> format["Reward_%1", _goalContributionLevel] >> "displayName");
	_goalCurrentTierAward = getText(_goalCurrentTierConfig >> "Rewards" >> "Reward_0" >> "displayName");
	_goalMaxTierAward = getText(missionConfigFile >> "CfgCommunityGoals" >> _goalConfig >> "Tiers" >> "Tier_8" >> "Rewards" >> "Reward_0" >> "displayName");
	_goalRemainingTime = [_goalDateEnd] call RRPClient_util_dateToString;
	_goalParametersCtrl ctrlSetStructuredText parseText format["<t size='0.75'>
	Ваш вклад - %1 ед. продано<br/>
	Ваша награда - %2<br/>
	Награда текущего уровня - %3<br/>
	Награда максимальная уровня - %4<br/>
	Глобальный прогресс - %5 / %6<br/>
	Участников - %7<br/>
	Время завершения - %8<br/></t>
	", _goalContribution, _playerReward, _goalCurrentTierAward, _goalMaxTierAward, [_goalProgress] call RRPClient_util_numberText, [_goalAmount] call RRPClient_util_numberText, _goalParticipants, _goalRemainingTime];

	tvClear _goalRewardsStructureCtrl;
	{
		_level = _forEachIndex;
		_config = _x;
		_tierRewardDisplayName = getText(_x >> "name");
		_index = _goalRewardsStructureCtrl tvAdd [[], _tierRewardDisplayName];
		{
			_tierRewardDisplayName = getText(_config >> "Rewards" >> format["Reward_%1", _forEachIndex] >> "displayName");
			_idx = _goalRewardsStructureCtrl tvAdd [[_level], format ["%1 - %2", _x, _tierRewardDisplayName]];
			_goalRewardsStructureCtrl tvSetTooltip [[_level, _forEachIndex], format ["%1 - %2", _x, _tierRewardDisplayName]];
			if (_goalContributionLevel isEqualTo _forEachIndex) then {
				_goalRewardsStructureCtrl tvSetColor [[_level,_forEachIndex],[0, 1, 0, 1]];
				if (_goalCurrentTierSelection isEqualTo _level) then {
					_goalRewardsStructureCtrl tvSetColor [[_level],[0, 1, 0, 1]];
				};
			};
		} forEach ["Топ 5 участников", "Топ 10%", "Топ 25%", "Топ 50%", "Недостаточный вклад"];
	} forEach _goalTiers;

	_goalProgressCtrl progressSetPosition _goalProgressRatio;
	_goalProgressCtrlPos = ctrlPosition _goalProgressCtrl;
	_goalProgressCtrlPosX = _goalProgressCtrlPos select 0;
	_goalProgressCtrlPosH = (_goalProgressCtrlPos select 3);

	_goalProgressTextAndChecks = uiNamespace getVariable ["RRPDialogCommunityGoalsAppProgress", []];
	if (_goalProgressTextAndChecks isNotEqualTo []) then {{ctrlDelete _x} forEach _goalProgressTextAndChecks; uiNamespace setVariable ["RRPDialogCommunityGoalsAppProgress", []]};
	{
		_tierName = getText(_x >> "name");
		_tierNeededAmound = getNumber(_x >> "neededAmount");
		_level = _goalProgressCtrlPosH * (1 - _tierNeededAmound);

		_tierText = _display ctrlCreate ["RscStructuredText", 1000, _slide];
		_tierText ctrlSetStructuredText parseText format["<t size = '0.85'>%1   -------------</t>", _tierName];
		_tierTextH = ((ctrlPosition _tierText) select 3) / 2;
		_tierText ctrlSetPositionX (_goalProgressCtrlPosX - 0.105);
		_tierText ctrlSetPositionY _level + _tierTextH + 0.007;
		_tierText ctrlSetPositionW 1;
		_tierText ctrlCommit 0;
		_goalProgressTextAndChecks pushBack _tierText;


		_tierCheckBox = _display ctrlCreate ["ctrlCheckBox2", 1001, _slide];
		_tierCheckBoxH = ((ctrlPosition _tierCheckBox) select 3) / 4;
		_tierCheckBox ctrlSetPosition [(_goalProgressCtrlPosX - 0.13), _level + _tierCheckBoxH + 0.005, 0.0125 * safezoneW, 0.02 * safezoneH];
		_tierCheckBox ctrlSetDisabledColor [1, 1, 1, 1];
		_tierCheckBox ctrlCommit 0;
		_tierCheckBox ctrlEnable false;
		_goalProgressTextAndChecks pushBack _tierCheckBox;


		if (_tierNeededAmound <= _goalProgressRatio) then {_tierCheckBox cbSetChecked true};
	} forEach _goalTiers;

	uiNamespace setVariable ["RRPDialogCommunityGoalsAppProgress", _goalProgressTextAndChecks];
}];

_goalsCtrl lbSetCurSel 0;