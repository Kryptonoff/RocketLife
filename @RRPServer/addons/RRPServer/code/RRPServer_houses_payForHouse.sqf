private _house = objectFromNetId (_this # 0);
private _player = objectFromNetId (_this # 1);
_houseID = _house getVariable ["house_id",0];

_house setVariable ["PayTimeDude",false,true];
_house setVariable ["LastPayTime",systemTime];
_house call RRPServer_house_setPayTime;

format ["updatePayHouse:%1",_houseID] call RRPServer_DB_fireAndForget;

(netID _house) remoteExecCall ["RRPClient_houses_payForHouseResponse",_player];
