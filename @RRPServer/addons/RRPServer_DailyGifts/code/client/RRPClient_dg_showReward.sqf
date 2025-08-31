
disableSerialization;
createDialog "RRPDialogRewardDialog";
private _display = uiNamespace getVariable ["RRPDialogRewardDialog",displayNull];
private _rewardPic = _display displayCtrl 24001;
_rewardPic ctrlSetText "reward\rewardsMain.paa";
private _rewardText = _display displayCtrl 24002;
private _rewardClaim = _display displayCtrl 24003;
_rewardClaim ctrlRemoveAllEventHandlers "ButtonClick"; 
_rewardClaim ctrlSetEventHandler ["ButtonClick","_this spawn RRPClient_dg_animate"];
private _config = getMissionConfig "CfgDailyRewards" >> if (RRPClientDailyRewardDay > 14) then {"unlimDay"}else{ format["day%1",RRPClientDailyRewardDay]};
private _reward = ([getArray(_config >> "rewardsItems")] call CBA_fnc_shuffle) select 0;
_dayText = call {
	if (RRPClientDailyRewardDay isEqualTo 1) exitWith {"день"};
	if (RRPClientDailyRewardDay in [2,3,4]) exitWith {"дня"};
	"дней"
};
_rewardText ctrlSetStructuredText parseText 
	format ["<t font='RobotoCondensed' align='center'>Заходи <t font='RobotoCondensedBold' color='#FF6100'>каждый день</t> и будешь получать все более крутые подарки с каждым днем!<br/><t underline='1'>Цепочку дней прерывать нельзя, начнется сначала!</t><br/>Сейчас у тебя <t color='#00FBFF'>%1</t> %2!</t>",RRPClientDailyRewardDay,_dayText];
