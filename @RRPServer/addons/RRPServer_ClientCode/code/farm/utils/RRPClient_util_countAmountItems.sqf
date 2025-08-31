
params [
    ['_maxItems', -1, [0]]
];

private ["_coef","_count","_vip"];
//_vip = call life_donator;
//_maxItems = _maxItems + _vip;
//_count = ceil(random(_maxItems));
_count = ["amountItemsGather",_maxItems] call RRPClient_system_VIP;

_count
