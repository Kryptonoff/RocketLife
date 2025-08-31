
private ["_dialog", "_rewardsListBox", "_claim", "_dropdown", "_itemClassName", "_itemQuantity", "_indexEntryIndex", "_configName", "_qualityColor", "_popTabColor", "_imageColor"]; 
disableSerialization;
_dialog = uiNameSpace getVariable ["RRPDialogReward", displayNull];

_rewardsListBox = _dialog displayCtrl 2003;
_claim = _dialog displayCtrl 2004;
_dropdown = _dialog displayCtrl 2005;

lbClear _rewardsListBox;

if(!isNil "RRPClientPlayerRewards") then {
	if(count RRPClientPlayerRewards != 0) then {
		{
			_itemClassName = (_x select 0);
			_itemQuantity = (_x select 1);
			_indexEntryIndex = 1;
		
		
			switch (_itemClassName) do
			{
				case "RRPAtm": { 
					_indexEntryIndex = _rewardsListBox lbAdd "Деньги";
					_rewardsListBox lbSetPicture [_indexEntryIndex, "\rimas_pack\icons\bank.paa"];
				};
				case "Points": {
					_indexEntryIndex = _rewardsListBox lbAdd "RCredits";
					_rewardsListBox lbSetPicture [_indexEntryIndex, "\rimas_agent\assets\hud\rc.paa"];
				};
				case "RRPTRX": {
					_indexEntryIndex = _rewardsListBox lbAdd "TRX";
					_rewardsListBox lbSetPicture [_indexEntryIndex, "\rimas_agent\assets\hud\trx.paa"];
				};
				case "vip1": {
					_indexEntryIndex = _rewardsListBox lbAdd "VIP-1";
					_rewardsListBox lbSetPicture [_indexEntryIndex, "\rimas_agent\assets\hud\vip-1.paa"];
				};
				case "vip2": {
					_indexEntryIndex = _rewardsListBox lbAdd "VIP-2";
					_rewardsListBox lbSetPicture [_indexEntryIndex, "\rimas_agent\assets\hud\vip-2.paa"];
				};
				case "vip3": {
					_indexEntryIndex = _rewardsListBox lbAdd "VIP-3";
					_rewardsListBox lbSetPicture [_indexEntryIndex, "\rimas_agent\assets\hud\vip-3.paa"];
				};
				case "vip4": {
					_indexEntryIndex = _rewardsListBox lbAdd "VIP-4";
					_rewardsListBox lbSetPicture [_indexEntryIndex, "\rimas_agent\assets\hud\vip-4.paa"];
				};
				default {
					_configName = _itemClassName call RRPClient_util_getConfigNameByClassName;
					_indexEntryIndex = _rewardsListBox lbAdd getText(configFile >> _configName >> _itemClassName >> "displayName");
					_rewardsListBox lbSetPicture [_indexEntryIndex, getText(configFile >> _configName >> _itemClassName >> "picture")];
				};
			};

			_qualityColor = [1, 1, 1, 1];
			_popTabColor = [1, 1, 1, 1];
			_imageColor = [1, 1, 1, 1];

			_rewardsListBox lbSetData [_indexEntryIndex, _itemClassName];
			_rewardsListBox lbSetColor [_indexEntryIndex, _qualityColor];

			_rewardsListBox lbSetPictureColor [_indexEntryIndex, _imageColor];
			_rewardsListBox lbSetTextRight [_indexEntryIndex, format["%1", _itemQuantity]];
			_rewardsListBox lbSetColorRight [_indexEntryIndex, _popTabColor];
			_rewardsListBox lbSetPictureRightColor [_indexEntryIndex, _popTabColor];
		} forEach RRPClientPlayerRewards;
		
		_dropdown ctrlEnable true;
		_claim ctrlEnable true;
		_dropdown ctrlCommit 0;
		_claim ctrlCommit 0;
	} else {
		_dropdown ctrlEnable false;
		_claim ctrlEnable false;
		_dropdown ctrlCommit 0;
		_claim ctrlCommit 0;
	};
} else {
	_dropdown ctrlEnable false;
	_claim ctrlEnable false;
	_dropdown ctrlCommit 0;
	_claim ctrlCommit 0;
};
