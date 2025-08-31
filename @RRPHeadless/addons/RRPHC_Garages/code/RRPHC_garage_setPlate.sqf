
private ["_player","_cost"];
params
[
	"_id",
	"_plate",
	"_curPlate",
	"_vehicle"
];

_player = remoteExecutedOwner call RRPHC_util_get_RE_player;

try
{
	if (isNull _player) throw "Вы не определены";	
	_cost = getNumber(getMissionConfig "LifeCfgGarages" >> "costPlate");
	if (_player getVariable ["RRPPoint",0] < _cost) throw "У вас недостаточно средств";
	
	[_player,"point","take",_cost] remoteExecCall ["RRPServer_system_moneyChange",2];

	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,
		name _player,
		getPlayerUID _player,
		"changePlate",
		getNumber(getMissionConfig "LifeCfgGarages" >> "costPlate"),
		format ["Изменил номерной знак машине %1 (ID %2) старый %3, новый %4",_vehicle,_id,_curPlate,_plate]
	] call RRPHC_DB_lk_fireAndForget;

	format ["updatePlate:%1:%2",_plate,_id] call RRPHC_DB_fireAndForget;
	[getPlayerUID _player,"vehicle_plate",format ["Изменил номера на %1 ID|%2 Старый %4 - новый %3",_classname,_key, _plate,_curPlate]] call RRPHC_util_logDB;
	
	private _log = format["На транспортное средство %1 установлены новые номерные знаки '%2'!",(getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName")),_plate];
	["setPlate", _log] remoteExecCall ["RRPClient_garage_responseServer",_player];
	[500,"установленные номера"] remoteExecCall ["addXP",_player];
}catch{
	["setPlate", _exception] remoteExecCall ["RRPClient_garage_responseServer",_player];
};
true
