
private["_player", "_cargo"];
_player = _this select 0;
_cargo = _this select 1;
[_player, _cargo select 0] call RRPClient_util_playerEquipment_deserialize;
[(uniformContainer _player), _cargo select 1] call RRPClient_util_containerCargo_deserialize;
[(vestContainer _player), _cargo select 2] call RRPClient_util_containerCargo_deserialize;
[(backpackContainer _player), _cargo select 3] call RRPClient_util_containerCargo_deserialize;