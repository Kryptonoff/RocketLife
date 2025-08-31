private ["_sessionID", "_parameters", "_vehicleClass", "_pinCode", "_playerObject", "_rewardsData", "_index", "_current", "_amt", "_playerUID", "_position", "_vehicleObject", "_logging", "_rewardsLogging", "_traderLog", "_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleClass = _parameters select 0;


try 
{
	_playerObject = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _playerObject) throw 1;
	if !(alive _playerObject) throw 2;
	if (_playerObject getVariable ["ExileMutex",false]) throw 12;
	_playerObject setVariable ["ExileMutex", true];
	
	_rewardsData = _playerObject getVariable ["RRPClientPlayerRewards", []];
	
	_index = [_rewardsData,_vehicleClass] call RRPServer_util_searchArray;
	
	if(_index == -1) throw 5;
	
	_current = _rewardsData select _index;
	_amt = (_current select 1) - 1;
	if(_amt <= 0) then {
		_rewardsData deleteAt _index;
	} else {
		_rewardsData set [_index, [(_current select 0),_amt]];
	};
	
	_playerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	private _playerUID = getPlayerUID _playerObject;
	format["setPlayerRewards:%1:%2", _rewardsData, _playerUID] call RRPServer_DB_fireAndForget;
	private _type = call {
		if (_vehicleClass isKindOf "Car") exitWith {"Car"};
		if (_vehicleClass isKindOf "Air") exitWith {"Air"};
		if (_vehicleClass isKindOf "Ship") exitWith {"Ship"};
		"Car"
	};
	_basePrice = if (isClass(getMissionConfig "LifeCfgVehicles" >> _vehicleClass)) then {getNumber(getMissionConfig "LifeCfgVehicles" >> _vehicleClass)}else{1};
	[
		_playerUID,
		_type,
		_vehicleClass,
		"default",
		call RRPClient_vehicle_setPlateNumber,
		_basePrice,
		"default",
		objNull,
		0
	] call RRPServer_garage_insertVehicle;
	format ["insertRewardLog:%1:%2:%3:%4",_playerUID,_vehicleClass,"take",1] call RRPServer_DB_fireAndForget;
	[_sessionID, "claimVehicleResponse", [0, _rewardsData]] call RRPServer_system_sendTo;

}
catch 
{
	_responseCode = _exception;
	[_sessionID, "claimVehicleResponse", [_responseCode,_rewardsData]] call RRPServer_system_sendTo;
};
if !(isNull _playerObject) then 
{
	_playerObject setVariable ["ExileMutex", false];
};
true
