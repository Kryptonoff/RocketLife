
private["_player", "_itemClassName", "_canAdd"];
_player = _this select 0;
_itemClassName = _this select 1;
_canAdd = false;
try
{
	if (_player canAddItemToUniform _itemClassName) then
	{
		throw true;
	};
	if (_player canAddItemToVest _itemClassName) then
	{
		throw true; 
	};
	if (_player canAddItemToBackpack _itemClassName) then
	{
		throw true;
	};
	if ([_player, _itemClassName] call RRPClient_util_playerEquipment_canAdd) then
	{
		throw true;
	};
}
catch 
{
	_canAdd = _exception;
};
_canAdd