/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_id","_parameters"];

try {
	_admin = _id call RRPServer_session_getPlayerObject;
	_mode = _parameters param [0,"",[""]];
	switch (_mode) do
	{
		case "create":{
			_data = _parameters param [1,[],[[]]];  
			if (_data isEqualTo []) throw "Проблема с массивом данных, попробуйте еще раз";
			_data params [
				["_name","",[""]],
				["_variable","",[""]],
				["_ranks",[],[[]]],
				["_owner","",[""]],
				["_slots",1,[1]]
			];
			if (_name isEqualTo "") throw "Не указано название";
			if (_ranks isEqualTo []) throw "Нет званий";
			if (_variable isEqualTo "") throw "Не указана переменная";
			if (_owner isEqualTo "") throw "Не указан владелец";
			if (_slots isEqualTo 1) throw "Только 1 слот?";
			
			_ownerPlayer = _owner call RRPClient_util_objectFromPlayerUID;
			if (isNull _ownerPlayer) throw "Будущего хозяина нет на сервере";
			if !((_ownerPlayer getVariable ["GroupID",-1]) isEqualTo -1) throw "У него уже есть организация или он член существующей";
			_query = ["registerGroup",[_name,_owner,_slots,_variable,_ranks,[36.6,152.2]]] call RRPServer_DB_createMessage;
			_id = _query call RRPServer_DB_insertSingle;
			_hash = [
				_name,
				_owner,
				[],
				_slots,
				_variable,
				_ranks,	
				[36.6,152.2],
				0,
				[],
				"",
				[_owner,name _ownerPlayer],
				[],
				[]
			];
			missionNamespace setVariable [format["ServerGroupsInfo_%1",_id],_hash];
			_ownerPlayer setVariable ["GroupID",_id,true];
			_ownerPlayer setVariable ["GroupData",_hash];
			["responseAdmin"] remoteExecCall ["RRPClient_groups_admin_createActions",owner _admin];
			["responseOwner",[format["Организация %1 создана, вы назначены ее главой. Управление организацией осуществляется в планшете"],_hash]] remoteExecCall ["RRPClient_groups_admin_createActions",owner _ownerPlayer];
		};
		case "": {};
	};
}catch{
	["error",[_exception]] remoteExecCall ["RRPClient_groups_admin_createActions",owner _admin];
};