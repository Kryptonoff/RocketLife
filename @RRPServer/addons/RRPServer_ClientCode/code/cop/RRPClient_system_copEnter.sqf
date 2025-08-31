/*
	Project: 	Rimas Altis Life RPG
*/


private ["_position","_vehicle"];
_position = _this select 3;
_vehicle = cursorObject;
if (player distance _vehicle > 10 AND {!(_position isEqualTo "exit")}) exitWith {};

switch (_position) do {
	case "driver":
	{
		_vehicle lock false;
		player action ["getInDriver", _vehicle];
		_vehicle lock true;
	};
	case "passenger":
	{
		_vehicle lock false;
		player action ["getInCargo", _vehicle];
		_vehicle lock true;
	};
	case "gunner":
	{
		_vehicle lock false;
		player action ["getIngunner", _vehicle];
		_vehicle lock true;
	};
	case "exit":
	{
		private _veh = objectParent player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
	default {
	    ["Ошибка!"] call hints;
	};
};
