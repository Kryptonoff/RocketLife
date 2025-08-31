
private ["_dialog", "_claimDropdown", "_dropdownIndex", "_tradeContainerType", "_tradeVehicleObject", "_currentLoad", "_maximumLoad", "_items", "_tradeVehicleNetID", "_loadProgress", "_loadValue"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RRPDialogReward", displayNull];
_claimDropdown = _dialog displayCtrl 2005;
_dropdownIndex = lbCurSel _claimDropdown;
_tradeContainerType = _claimDropdown lbValue _dropdownIndex;
_tradeVehicleObject = objNull;
switch (_tradeContainerType) do
{
	case 1: 
	{
		_currentLoad = (loadAbs player);
		_maximumLoad = getNumber(configfile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
		_items = [player, true] call RRPClient_util_playerEquipment_list;
	};
	default 
	{
		_tradeVehicleNetID = _claimDropdown lbData _dropdownIndex;
		_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
		_maximumLoad = getNumber(configFile >> "CfgVehicles" >> (typeOf _tradeVehicleObject) >> "maximumLoad");
		_items = _tradeVehicleObject call RRPClient_util_containerCargo_list;
		_currentLoad = _items call RRPClient_util_calculateLoad;
	};
};
/* 
_loadProgress = _dialog displayCtrl 2007;
_loadProgress progressSetPosition (_currentLoad / (_maximumLoad max 1));
_loadValue = _dialog displayCtrl 2008;
_loadValue ctrlSetStructuredText (parseText format["<t size='1' color='#A0DF3B' font='RobotoCondensed' align='right'>Загруженность: %1/%2</t>", round(_currentLoad), _maximumLoad]);
 */
true