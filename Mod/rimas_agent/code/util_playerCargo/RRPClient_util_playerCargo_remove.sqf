
private["_player", "_itemClassName", "_removed"];
_player = _this select 0;
_itemClassName = _this select 1;
_removed = false;
try 
{
	{
		if !(isNull _x) then
		{
			if ([_x, _itemClassName] call RRPClient_util_containerCargo_remove) then
			{
				throw true;
			};
		};
	}
	forEach [backpackContainer _player, vestContainer _player, uniformContainer _player];
	throw ([_player, _itemClassName] call RRPClient_util_playerEquipment_remove); 
}
catch 
{
	_removed = _exception;
};
_removed