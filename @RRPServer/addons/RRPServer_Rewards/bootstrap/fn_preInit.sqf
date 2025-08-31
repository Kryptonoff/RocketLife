/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

private _path = "\RRPServer_Rewards\";

//-- Server
[
	"RRPServer_rewards_addKitRequest",
	"RRPServer_rewards_addRewardsRequest",
	"RRPServer_rewards_addVipRequest",
	"RRPServer_rewards_claimItemRequest",
	"RRPServer_rewards_claimTabsRequest",
	"RRPServer_rewards_claimVehicleRequest",
	"RRPServer_rewards_hasRewardsRequest",
	"RRPServer_rewards_updatePlayer",
	"RRPServer_util_searchArray"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

//-- Client
[
	"RRPClient_gui_rewardsDialog_event_onClaimButtonClick",
	"RRPClient_gui_rewardsDialog_event_onDropDownSelectionChanged",
	"RRPClient_gui_rewardsDialog_event_onListBoxSelectionChanged",
	"RRPClient_gui_rewardsDialog_show",
	"RRPClient_gui_rewardsDialog_updateListBox",
	"RRPClient_gui_rewardsDialog_updateSelection",
	"RRPClient_rewards_claimItemResponse",
	"RRPClient_rewards_claimTabsResponse",
	"RRPClient_rewards_claimVehicleResponse",
	"RRPClient_rewards_claimVipRequest",
	"RRPClient_rewards_claimVipResponse",
	"RRPClient_rewards_hasRewardsResponse"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};

true
