
private["_player", "_itemClassName", "_equipment"];
_player = _this select 0;
_itemClassName = toLower (_this select 1);
_equipment = [_player, true] call RRPClient_util_playerEquipment_list;
_equipment = _equipment call RRPClient_util_array_toLower;
(_itemClassName in _equipment)