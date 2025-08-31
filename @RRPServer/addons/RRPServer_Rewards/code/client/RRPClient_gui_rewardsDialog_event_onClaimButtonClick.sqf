
private ["_dialog", "_rewardsLB", "_claim", "_dropdown", "_selectedRewardsLBIndex", "_itemClassName", "_selected", "_currentContainerType", "_containerNetID"];
disableSerialization;

_dialog = uiNameSpace getVariable ["RRPDialogReward", displayNull];
_rewardsLB = _dialog displayCtrl 2003;
_claim = _dialog displayCtrl 2004;
_dropdown = _dialog displayCtrl 2005;

_dropdown ctrlEnable false;
_claim ctrlEnable false;
_dropdown ctrlCommit 0;
_claim ctrlCommit 0;

_selectedRewardsLBIndex = lbCurSel _rewardsLB;
if !(_selectedRewardsLBIndex isEqualTo -1) then
{
	_itemClassName = _rewardsLB lbData _selectedRewardsLBIndex;
	if !(_itemClassName isEqualTo "") then
	{
		if !(RRPClientAtmWaitingResponse) then
		{
			call {
				if (_itemClassName == "RRPAtm") exitWith {
					["claimTabsRequest", [_itemClassName, (parseNumber (_rewardsLB lbTextRight _selectedRewardsLBIndex))]] call RRPClient_system_send;
				}; 
				if (_itemClassName == "Points") exitWith {
					["claimTabsRequest", [_itemClassName, (parseNumber (_rewardsLB lbTextRight _selectedRewardsLBIndex))]] call RRPClient_system_send;
				}; 
				if (_itemClassName == "RRPTRX") exitWith {
					["claimTabsRequest", [_itemClassName, (parseNumber (_rewardsLB lbTextRight _selectedRewardsLBIndex))]] call RRPClient_system_send;
				}; 
				if (_itemClassName in ["vip1","vip2","vip3","vip4"]) exitWith {
					[_itemClassName] call RRPClient_rewards_claimVipRequest;
				}; 
				if (_itemClassName isKindOf "AllVehicles") exitWith {
					["claimVehicleRequest", [_itemClassName]] call RRPClient_system_send;
				}; 
				comment "/********************************************************************/";
				_selected = lbCurSel _dropdown;
				_currentContainerType = _dropdown lbValue _selected;
				_containerNetID = "";
				if (_currentContainerType isEqualTo 2) then
				{
					_containerNetID = _dropdown lbData _selected;
				};
				RRPClientAtmWaitingResponse = true;
				["claimItemRequest", [_itemClassName, _currentContainerType, _containerNetID]] call RRPClient_system_send;
			};
		};
	};
};
true