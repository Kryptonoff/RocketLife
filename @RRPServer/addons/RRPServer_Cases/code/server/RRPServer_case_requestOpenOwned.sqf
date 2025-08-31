params ["_player","_type","_params"];
try{
	if (isNull _player) throw "Вы не существуете";
	if !(isClass (getMissionConfig "CfgCases" >> _class)) throw "Этот кейс не настроен на сервере";

	switch (_type) do
	{
		case "owned": {
			_params params ["_id","_class"];
			if !(format ["containerExist:%1",_id] call RRPServer_DB_selectSingleField) throw "Этот кейс не доступен";			
			["response",_id] remoteExecCall ["RRPClient_cases_openCase",_player];
		};
		case "store": {
			_params params ["_caseType"];
			_case = format ["getCase:%1",_caseType] call RRPServer_DB_selectSingle;
			if (isNil "_case" or {_case isEqualTo []}) throw "Этот кейс не доступен";
			_case params ["_cost","_currency","_amount"];
			call {
				if (_amount < 1) throw "Этот кейс закончился";
				if (_currency isEqualTo "RC") then 
				{
					if (_player getVariable ["RRPPoint",0] < _cost) throw "У вас недостаточно RC";
					[_player,"point","take",_cost] call RRPServer_system_moneyChange;
				}else{
					if (_player getVariable ["RRPAtm",0] < _cost) throw "У вас недостаточно денег";
					[_player,"atm","take",_cost] call RRPServer_system_moneyChange;
				};
			};
			format ["takeCase:%1",_caseType] call RRPServer_DB_fireAndForget;
			_newId = format ["insertPlayerCase:%1:%2:%3",getPlayerUID _player,_caseType,999] call RRPServer_DB_insertSingle;
			["response",_newId] remoteExecCall ["RRPClient_cases_openCase",_player];
		};
	};
}catch{
	["error",_exception] remoteExecCall ["RRPClient_cases_openCase",_player];
};
true
