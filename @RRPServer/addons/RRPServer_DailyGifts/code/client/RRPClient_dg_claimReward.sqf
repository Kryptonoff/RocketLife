
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogRewardDialog",displayNull];
private _rewardPic = _display displayCtrl 24001;
private _rewardPicPrev = _display displayCtrl 24004;
private _rewardPicNext = _display displayCtrl 24005;
private _text = _display displayCtrl 24002;
{_x ctrlSetText ""} forEach  [_rewardPicNext,_rewardPicPrev];

private _config = getMissionConfig "CfgDailyRewards" >> if (RRPClientDailyRewardDay > 14) then {"unlimDay"}else{ format["day%1",RRPClientDailyRewardDay]};
private _reward = ([getArray(_config >> "rewards")] call CBA_fnc_shuffle) select 0;

_reward params ["_itemClassName","_amount"];
private _imagePath = getMissionConfig "CfgDailyRewards" >> "image" >> _itemClassName;
_rewardPic ctrlSetText _imagePath;

_text ctrlSetStructuredText parseText format ["<t>Вы выиграли %1! Забрать свой подарок можно в тайнике в любое время!</t>",_itemClassName,_amount];
