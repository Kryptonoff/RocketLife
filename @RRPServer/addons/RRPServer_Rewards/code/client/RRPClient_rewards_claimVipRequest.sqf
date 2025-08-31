
params ["_vipStr"];
private _newVip = call {
	if (_vipStr isEqualTo "vip1") exitWith {1};
	if (_vipStr isEqualTo "vip2") exitWith {2};
	if (_vipStr isEqualTo "vip3") exitWith {3};
	if (_vipStr isEqualTo "vip4") exitWith {4};
	0
};
private _currentVIP = call life_donator;
if (_currentVIP isNotEqualTo _newVip and {_currentVIP isNotEqualTo 0}) exitWith {
	["Тайник","У вас уже активен уровень VIP, предмет возможно активировать только при отсутствии VIP-уровня или иметь уровень равный предмету"] call toastError;
};
RRPClientAtmWaitingResponse = true;
["addVipRequest", [_currentVIP,_newVip]] call RRPClient_system_send;
