private _slots = RRPClientGarageSlots;
_slots = ["garageLimit",_slots] call RRPClient_system_VIP;

{
	if (_x isEqualTo "") then {continue};
	private _house = objectFromNetId _x;
	if (getNumber (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "canGarage") isEqualTo 1) then {_slots = _slots + 15};
} forEach life_netID_Houses;

_slots
