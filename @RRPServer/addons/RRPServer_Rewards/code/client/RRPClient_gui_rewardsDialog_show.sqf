
private ["_dialog", "_dropdown", "_claim", "_index", "_nearVehicles", "_background", "_title", "_claimCode", "_edit"]; 
disableSerialization;

createDialog "RRPDialogReward";
waitUntil { !isNull findDisplay 57347 };
_dialog = uiNameSpace getVariable ["RRPDialogReward", displayNull];

_dropdown = _dialog displayCtrl 2005;
_claim = _dialog displayCtrl 2004;

lbClear _dropdown;
_index = _dropdown lbAdd "Player";
_dropdown lbSetValue [_index, 1];
_dropdown lbSetCurSel 0;
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 30];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			_index = _dropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
			_dropdown lbSetData [_index, netId _x];
			_dropdown lbSetValue [_index, 2];
		};
	};
}
forEach _nearVehicles;

_dropdown ctrlEnable false;
_claim ctrlEnable false;
_dropdown ctrlCommit 0;
_claim ctrlCommit 0;

//REQUEST ONCE FROM SERVER ON OPEN - Then only update if a player has added items
if(isNil "RRPClientPlayerRewards") then {
	["hasRewardsRequest"] call RRPClient_system_send;
};

true call RRPClient_gui_util_blur;
call RRPClient_gui_rewardsDialog_updateListBox;
true