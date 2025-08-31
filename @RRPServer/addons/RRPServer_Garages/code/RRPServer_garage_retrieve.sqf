
params [
	"_id",
	"_price",
	"_sp_name"
];

_player = remoteExecutedOwner call RRPServer_util_get_RE_player;


try
{
	if (isNull _player) throw "Вы не определены";

	if (_id isEqualTo -1) throw "ID техники не определен";
	private _query = format ["getGarageVehicle:%1",_id] call RRPServer_DB_selectSingle;

	_alive = _query param [2,0,[-1]];
	if (_alive isEqualTo 0) throw "Эта техника уничтожена";

	_active = _query param [3,0,[-1]];
	if (_active isEqualTo 1) throw "Эта техника уже на острове!";
	
	_spname = _query param [14,"",[""]];
	if !((_sp_name isEqualTo _spname) OR {_spname isEqualTo ""} OR {_spname isEqualTo "none"}) then
	{
		if (isClass (getMissionConfig "LifeCfgGarages" >> worldName >> _spname) && {!(getMarkerPos _spname isEqualTo [0,0,0])}) then
		{
			throw format ["Эта тенхика находиться в гараже %1",getText(getMissionConfig "LifeCfgGarages" >> worldName >> _spname >> "displayName")];
		}else{
			format ["setGarage:none:%1",_id] call RRPServer_DB_fireAndForget;
		};
	};

	[_player,"atm","take",_price] call RRPServer_system_moneyChange;
	[_player,"serverbank","add",_price] call RRPServer_system_moneyChange;
	format ["setVehicleActive:%1",_id] call RRPServer_DB_fireAndForget;

	["retrieve",true,_id,_query] remoteExecCall ["RRPClient_garage_responseServer",owner _player];

}catch{
	["retrieve",false,_exception] remoteExecCall ["RRPClient_garage_responseServer",owner _player];
};
true
