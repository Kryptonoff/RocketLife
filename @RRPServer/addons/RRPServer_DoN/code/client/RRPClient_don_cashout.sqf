
params [
	["_machine", objNull, [objNull]]
];

if (_machine getVariable ["multiplier", 0] <= 0) exitWith {};

private _bet = (getNumber (missionConfigFile >> "cfgDon" >> "betAmount"));
private _winnings = [
	((_machine getVariable ["multiplier", 0]) * _bet),
	[
		((_machine getVariable ["multiplier", 0]) * _bet), 
		(getNumber (missionConfigFile >> "cfgDon" >> "maxJackpot"))
	] call BIS_fnc_randomInt
] select ((_machine getVariable ["multiplier", 0]) isEqualTo 10);

[
	player,
	"atm",
	"add",
	_winnings
]remoteExecCall ["RRPServer_system_moneyChange",2];
[25 * (_machine getVariable ["multiplier", 0]),"выигрыш"] call addXP;

[
	"Все или ничего",
	format ["Вы вывели деньги с игры - $%1",[_winnings] call RRPClient_util_numberText]
] call toastInfo;

_machine setVariable ["don_user", "", true];
_machine setVariable ["multiplier", 0, true]; 
_machine spawn RRPClient_don_update; 