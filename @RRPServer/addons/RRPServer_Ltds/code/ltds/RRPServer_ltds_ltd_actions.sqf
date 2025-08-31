private _mode = param [0,"",[""]];
private _id = param [1,-1,[-1]];
private _parameters = param [2,[],[[]]];

format ["LTDS: LTD: Actions: Parameters - %1 #1111",_this] call RRPServer_util_debugConsole;
try
{
	switch _mode do
	{
		case "register": 
		{
			_parameters = param [2,[],[[]]];
			_parameters params ["_player","_name"];
			_uid = getPlayerUID _player;
			_id = format ["ltdsRegistration:%1:%2",_uid,_name] call RRPServer_DB_insertSingle;
			format ["ltdsSetManager:%1:%2",_id,_uid] call RRPServer_DB_fireAndForget;
			missionNamespace setVariable [format ["ltdData_%1",_id],[_uid,_name,0,[[_player call getNickName,_uid]]],true];
			[player,"atm","take",getNumber(getMissionConfig "CfgLtds" >> "costToCreate")] call RRPServer_system_moneyChange;
			["refresh","directPlayer","register",[_id,_name]] remoteExecCall ["RRPClient_ltds_ltd_actions",remoteExecutedOwner];
			format ["insertGameLog:%1:%2:%3:ltd:%4",serverid,name _player,_uid,format["Зарегистрировал компанию %1 (%2)",_name,_id]] call RRPServer_DB_lk_fireAndForget;
		};
		case "rename":
		{
			if (_id isEqualTo -1) throw "Компания не определена";
			_newName = _parameters param [0,"",[""]];
			if (_newName isEqualTo "") throw "Вы ничего не ввели";
			_s = count (toArray _newName);
			if (_s < 4 or _s > 16) throw "Количество символов должно быть не менее 4 и не более 16ти";
			
			_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
			_dataCompany set [1,_newName];
			missionNamespace setVariable [format["ltdData_%1",_id],_dataCompany,true];
			format ["ltdsRename:%1:%2",_newName,_id] call RRPServer_DB_fireAndForget;
		};
		case "withdraw": 
		{
			if (_id isEqualTo -1) throw "Компания не определена";
			_parameters params [["_player",objNull]];
			if (isNull _player) throw "Игрок не определен";
			_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
			_bank = _dataCompany # 2;
			_withdrawMin = getNumber(getMissionConfig "CfgLtds" >> "allowToWithdraw");
			if (_withdrawMin > _bank) throw format ["Вывод средств доступен от $%1",[_withdrawMin] call RRPClient_util_numberText];
			_w = round(_bank - (_bank * 0.03));
			[_player,"atm","add",_w] call RRPServer_system_moneyChange;
			_dataCompany set [2,0];
			missionNamespace setVariable [format["ltdData_%1",_id],_dataCompany,true];
			format ["ltdsUpdateBank:%1:%2",0,_id] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText",["Управление бизнесом",format["Вы успешно обналичили $%1 на ваш банковский счет",[_w] call RRPClient_util_numberText]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		case "changeOwner": {
			if (_id isEqualTo -1) throw "Компания не определена";
			_parameters = param [2,[],[[]]];
			_parameters params ["_new"];
			_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
			_oldUid = _dataCompany#0;
			if (_oldUid != _dataCompany#0) throw "Вы не можете перенезначить владельца";
			_newUid = _new # 0;
			if (_oldUid isEqualTo _newUid) throw "Нельзя назначить самого же себя";
			_dataCompany set [0,_newUid];
			missionNamespace setVariable [format["ltdData_%1",_id],_dataCompany,true];
			format ["ltdsNewLeader:%1:%2",_newUid,_id] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText",["Управление бизнесом",format["Вы передали управление компанией %1",_new # 1]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
			_newOwner = (_newUid) call RRPClient_util_objectFromPlayerUid;
			if!(isNull _newOwner) then
			{
				["refresh","directPlayer","ceo",format["Руководство компанией '%1' передано Вам! Желаем удачи в новой должности!",_dataCompany#1]] remoteExecCall ["RRPClient_ltds_ltd_actions",owner _kickPlayer];
			};
		};
		case "removeManager": {
			if (_id isEqualTo -1) throw "Компания не определена";
			_parameters = param [2,[],[[]]];
			_parameters params ["_removed"];
			_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
			_members = _dataCompany # 3;
			_index = [_members,_removed#0] call RRPClient_util_find;
			if (_index isEqualTo -1) throw "Менеджер не найден";
			_members deleteAt _index;
			missionNamespace setVariable [format["ltdData_%1",_id],_dataCompany,true];
			format ["ltdsRemoveManager:%1",_removed#0] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText",["Управление бизнесом",format ["Менеджер '%1' уволен",_removed#1]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
			_kickPlayer = (_removed#0) call RRPClient_util_objectFromPlayerUid;
			if!(isNull _kickPlayer) then
			{
				["refresh","directPlayer","punish",format["Вы были уволены с компании '%1'",_dataCompany#1]] remoteExecCall ["RRPClient_ltds_ltd_actions",owner _kickPlayer];
			};
		};
		case "addManager": 
		{
			if (_id isEqualTo -1) throw "Компания не определена";
			_parameters = param [2,[],[[]]];
			_parameters params ["_toAdd","_remoted"];
			_uidAdd = getPlayerUID _toAdd;
			_nameAdd = _toAdd call getNickName;
			_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
			_members = _dataCompany # 3;
			_members pushBack [_nameAdd,_uidAdd];
			missionNamespace setVariable [format["ltdData_%1",_id],_dataCompany,true];
			["refresh","directPlayer","add",
				(format["Вы были приняты в компанию '%1'",_dataCompany#1]),
				[_id,_dataCompany#1]
			] remoteExecCall ["RRPClient_ltds_ltd_actions",owner _toAdd];
			format ["ltdsSetManager:%1:%2",_id,_uidAdd] call RRPServer_DB_fireAndForget;
			_uidInvited = missionNameSpace getVariable [format['UID_BY_OWNER_%1',_remoted],[]];
			_objInvited = _uidInvited call RRPClient_util_objectFromPlayerUid;
			if !(isNull _objInvited) then
			{
				["SuccessTitleAndText",["Управление бизнесом",format["'%1' принял ваше приглашение в компанию",_nameAdd]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_remoted];
				["refresh","main"] remoteExecCall ["RRPClient_ltds_ltd_actions",_remoted];
			};
		};
		case "deleteCompany": {
			_parameters params ["_player"];
			private _dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
			_dataCompany params ["_owner","_name","_bank","_members"];
			if !(_owner isEqualTo getPlayerUID _player) throw "Не вы создавали, не вам и уничтожать!";
			comment "TODO: Отвязать все бизнесы от компании";
			format ["deleteAllLtdData:%1",_id] call RRPServer_DB_fireAndForget;
			{
				_plr = _x;
				{
					_x params ["","_u"];
					if ((getPlayerUID _plr) isEqualTo _u) then 
					{
						"Есть кто то" call RRPServer_util_debugConsole;
						["deleteCompanyResponse",_name] remoteExecCall ["RRPClient_ltds_ltd_actions",_plr];
					};
				} forEach _members;
			}forEach allPlayers;
			missionNamespace setVariable [format["ltdData_%1",_id],nil,true];
		};
		default {};
	};
	["refresh","main"] remoteExecCall ["RRPClient_ltds_ltd_actions",remoteExecutedOwner];
}catch{
	["ErrorTitleAndText",["Управление бизнесом",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];	
};
true
