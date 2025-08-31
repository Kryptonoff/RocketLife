/*
	Project: Police Systems for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	["_type","",[""]],
	["_find","",[""]]
];
_text = "Ой, ой, что-то пошло в тар-тарары";
_data = [];
try
{
	switch (_type) do
	{
		case "id": 
		{
			_data pushBack (format ["copDB_findID:%1",_find] call RRPServer_DB_selectSingle);
			_data pushBack (format ["copDB_findWantedID:%1",_find] call RRPServer_DB_selectFull);
			_data pushBack (format ["copDB_findCarsID:%1",_find] call RRPServer_DB_selectFull);
			_data pushBack (format ["copDB_findHouseID:%1",_find] call RRPServer_DB_selectFull);
			(count (_data # 1)) call RRPServer_util_log;
			_text = format ["Данные по гражданину %1 успешно получены!",_find];
		};
		case "name": 
		{
			_playerFinded = objectFromNetId _find;
			_id = _playerFinded getVariable ["RRPDatabasePID",-1];
			if (isNull _playerFinded) throw "Такого гражданина не существует!";
			if (_id isEqualTo -1) throw "Ошибка с поиском гражданина в базе..., попробуйте проверить по ID паспорта";
			_data pushBack (format ["copDB_findID:%1",_id] call RRPServer_DB_selectSingle);
			_data pushBack (format ["copDB_findWantedID:%1",_id] call RRPServer_DB_selectFull);
			_data pushBack (format ["copDB_findCarsID:%1",_id] call RRPServer_DB_selectFull);
			_data pushBack (format ["copDB_findHouseID:%1",_id] call RRPServer_DB_selectFull);
			(count (_data # 1)) call RRPServer_util_log;
			_text = format ["Данные по гражданину %1 успешно получены!",_id];
			_type = "id";
		};
		case "car": 
		{
			_data = (format ["copDB_findCar:%1",_find] call RRPServer_DB_selectFull);
			_data call RRPServer_util_log;
			if (_data isEqualTo [[]]) throw format ["Транспорт с номером %1 не найден в базе данных",_find];
			_text = format ["Данные по номеру %1 успешно получены!",_find];
		};
		default {throw "Отправляемы данные чет пришли не так как надо, попробуйте еще раз!"};
	};
	[_text,true,_type,_data] remoteExecCall ["RRPClient_police_responseSearch",remoteExecutedOwner];
}catch{
	[_exception,false,_type] remoteExecCall ["RRPClient_police_responseSearch",remoteExecutedOwner];
};