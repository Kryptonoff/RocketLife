
private["_player", "_itemClassName", "_bulletCount", "_added"];
_player = _this select 0;
_itemClassName = _this select 1;
_bulletCount = param [2, -1]; 
_added = false;
try
{
	if ([_player, _itemClassName] call RRPClient_util_playerEquipment_canAdd) then 
	{
		throw ([_player, _itemClassName, _bulletCount] call RRPClient_util_playerEquipment_add); 
	};
	if (_player canAddItemToUniform _itemClassName) then 
	{
		throw ([(uniformContainer _player), _itemClassName, _bulletCount] call RRPClient_util_containerCargo_add); 
	};
	if (_player canAddItemToVest _itemClassName) then 
	{
		throw ([(vestContainer _player), _itemClassName, _bulletCount] call RRPClient_util_containerCargo_add); 
	};
	if (_player canAddItemToBackpack _itemClassName) then 
	{
		throw ([(backpackContainer _player), _itemClassName, _bulletCount] call RRPClient_util_containerCargo_add); 
	};
}
catch 
{
	_added = _exception;
};
_added