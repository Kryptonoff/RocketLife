
private["_list"];
_list = [];
_list append ([_this, true] call RRPClient_util_playerEquipment_list);
_list append ((uniformContainer _this) call RRPClient_util_containerCargo_list);
_list append ((vestContainer _this) call RRPClient_util_containerCargo_list);
_list append ((backpackContainer _this) call RRPClient_util_containerCargo_list);
_list