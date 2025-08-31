
private ["_player"];
params [
	["_key",-1],
	["_classname",""],
	["_price",-1]
];

_player = remoteExecutedOwner call RRPServer_util_get_RE_player;

try
{
	if (isNull _player) throw "Вы не определены";
	if (_key isEqualTo -1) throw "ID не определен";

	[_player,"atm","add",_price] call RRPServer_system_moneyChange;

	private _text = format ["Продана владельцем за %1",[_price] call RRPClient_util_numberText];
	format ["vehicleSell:%1:%2",_text,_key] call RRPServer_DB_fireAndForget;
	[getPlayerUID _player,"vehicle_sell",format ["Продал %1 за %2 ID|%3",_classname,[_price] call RRPClient_util_numberText,_key]] call RRPServer_util_logDB;

	private _log = format ["Вы продали %1 за %2$",
		getText(configFile >> "CfgVehicles" >> _classname >> "displayName"),
		[_price] call RRPClient_util_numberText
	];

	["sell", true, _log] remoteExecCall ["RRPClient_garage_responseServer",owner _player];
	[50,"продажу техники"] remoteExecCall ["addXP",_player];
}catch{
	["sell", false, _exception] remoteExecCall ["RRPClient_garage_responseServer",owner _player];
};
true
