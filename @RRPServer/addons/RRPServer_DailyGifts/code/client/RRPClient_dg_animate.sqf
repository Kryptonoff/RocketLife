
if !(canSuspend) exitWith {_this spawn RRPClient_dg_animate};

disableSerialization;

if (player getVariable ["Mutex",false]) exitWith {
	["Вы уже получили:( Возвращайтесь в следующий день!"] call toastError;
};
player setVariable ["Mutex",true];
private _display = uiNamespace getVariable ["RRPDialogRewardDialog",displayNull];

private _RewardpicPrev = 	(_display displayCtrl 24004);
private _Rewardpic = 		(_display displayCtrl 24001);
private _RewardpicNext = 	(_display displayCtrl 24005);

_a = 0;
private _rewardImages = [
	"\rimas_agent\assets\reward\rewardsTabs.paa",
	"\rimas_agent\assets\reward\rewardsCrate.paa",
	"\rimas_agent\assets\reward\rewardsRespect.paa"
];
while {_a =_a + 1; _a < 8} do {
  	_RewardpicPrev ctrlSetText 	(_rewardImages select 2);
  	_Rewardpic ctrlSetText 		(_rewardImages select 0);
  	_RewardpicNext ctrlSetText 	(_rewardImages select 1);
  	uiSleep 0.2;
  	_RewardpicPrev ctrlSetText 	(_rewardImages select 0);
  	_Rewardpic ctrlSetText 		(_rewardImages select 1);
  	_RewardpicNext ctrlSetText 	(_rewardImages select 2);
  	uiSleep 0.2;
  	_RewardpicPrev ctrlSetText 	(_rewardImages select 1);
  	_Rewardpic ctrlSetText 		(_rewardImages select 2);
  	_RewardpicNext ctrlSetText 	(_rewardImages select 0);
  	uiSleep 0.2;
};

[] spawn RRPClient_dg_claimReward;
