private _reason = _this # 0;
private _time = parseNumber(_this # 1);
private _toBan = objectFromNetId (_this # 2)
private _admin = objectFromNetId (_this # 3)
private _plyerToBanUID = getPlayerUID _toBan;
private _adminUID = getPlayerUID _admin;

format ["banPlayer:%1:%2:%3",_plyerToBanUID,_time,_reason,_adminUID] call RRPServer_DB_fireAndForget;

_curTime = call RRPServer_util_getRealTime;
_until = parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[0,%2,0,0]",_curTime,_time]);
[_reason,_until] remoteExecCall ["RRPClient_system_banMe",_toBan];
