/*
	Project: Aurora Role Play 
	Author: FairyTale#5571 
	License: CC BY-ND 

	Usage: 
		Client side:
		- ["win",[parameters],netId player] remoteExecCall ["RRPServer_ltd_slots_updateRequest",2];
*/

private ["_player"];
params [["_type",""],["_parameters",[]],"_nID"];
try
{
	_player = objectFromNetId _nID;
	if (_type isEqualTo "") throw "Ошибка 404";
	if (_parameters isEqualTo []) throw "Ошибка 405";
	switch (_type) do
	{
		case "win": {
			private ["_bank","_limit","_lid","_l","_toL","_lose","_win","_newAmount"];
			_parameters params [["_object",objNull],["_total_winnings",0],["_bet",0]];
			if (isNull _object) throw "Автомат не определен";
			_bank = _object getVariable ["ltdSBank",0];
			_limit = _object getVariable ["ltdSBLim",0];
			_lid = _object getVariable ["ltdOwner",-1];
			_ltd = missionNamespace getVariable [format["ltdData_%1",_lid],[]];
			_l = _ltd#2;
			_toL = 0;
			if (_bet > _total_winnings) then
			{
				_lose = _bet - _total_winnings;
				_toL = _toL + _lose;
				_bank = _bank + _lose;
				format ["insertSlotAnalytics:%1:%2:%3:%4:%5",(_object getVariable ["ltdName",""]),(_object getVariable ["ltdID",-1]),_lose,"lose"] call RRPServer_DB_fireAndForget;
				_bank = _bank - _total_winnings;
				format ["insertSlotAnalytics:%1:%2:%3:%4:%5",(_object getVariable ["ltdName",""]),(_object getVariable ["ltdID",-1]),_total_winnings,"win"] call RRPServer_DB_fireAndForget;
			}else{
				if !((_total_winnings - _bet) isEqualTo 0) then
				{
					_win = _total_winnings - _bet;
					_bank = _bank - _win;
					format ["insertSlotAnalytics:%1:%2:%3:%4:%5",(_object getVariable ["ltdName",""]),(_object getVariable ["ltdID",-1]),_win,"win"] call RRPServer_DB_fireAndForget;
				};
			};
			if !(_bank < _limit) then
			{
				_ltd set [2,_toL + _l];
				format ["updateLTDbankS:%1:%2",(_toL + _l),_lid] call RRPServer_DB_fireAndForget;
				missionNamespace setVariable [format["ltdData_%1",_lid],_ltd,true]; 
			};
			_object setVariable ["ltdSBank",_bank,true];
			format ["updateSlotBank:%1:%2",_bank,(_object getVariable ["ltdID",-1])] call RRPServer_DB_fireAndForget;
			"respond" remoteExecCall ["RRPClient_ltd_slots_calcWinnings",remoteExecutedOwner];
		};	
		case "lose": {
			_parameters params [["_object",objNull],["_bet",0]];
			diag_log str _parameters;
			if (isNull _object) throw "Автомат не определен";
			private ["_lid","_l","_bank","_limit"];
			_lid = _object getVariable ["ltdOwner",-1];
			_ltd = missionNamespace getVariable [format["ltdData_%1",_lid],[]];
			_l = _ltd#2;
			diag_log str _l;
			_bank = _object getVariable ["ltdSBank",0];
			_limit = _object getVariable ["ltdSBLim",0];
			if (_bank < _limit) then
			{
				comment "Если лимит не достигнут";
				_newAmount = _bet + _bank;
				_object setVariable ["ltdSBank",_newAmount,true];
				format ["updateSlotBank:%1:%2",_newAmount,(_object getVariable ["ltdID",-1])] call RRPServer_DB_fireAndForget;
				format ["insertSlotAnalytics:%1:%2:%3:%4:%5",(_object getVariable ["ltdName",""]),(_object getVariable ["ltdID",-1]),_bet,"lose"] call RRPServer_DB_fireAndForget;
			}else{
				comment "Лимит достигнут, отправлять в компанию";
				_object setVariable ["ltdSBank",_limit,true];
				format ["updateSlotBank:%1:%2",_limit,(_object getVariable ["ltdID",-1])] call RRPServer_DB_fireAndForget;
				format ["insertSlotAnalytics:%1:%2:%3:%4:%5",(_object getVariable ["ltdName",""]),(_object getVariable ["ltdID",-1]),_bet,"lose"] call RRPServer_DB_fireAndForget;
				_ltd set [2,(_l + _bet)];
				missionNamespace setVariable [format["ltdData_%1",_lid],_ltd,true]; 
				format ["updateLTDbankS:%1:%2",(_l + _bet),_lid] call RRPServer_DB_fireAndForget;
 			};
			"respond" remoteExecCall ["RRPClient_ltd_slots_calcWinnings",remoteExecutedOwner];
		};
		case "updName": {
			_parameters params [["_object",objNull],["_newName",""]];
			if (isNull _object) throw "Автомат не определен";
			_object setVariable ["ltdName",_newName,true];
			format ["updateSlotName:%1:%2",_newName,(_object getVariable ["ltdID",-1])] call RRPServer_DB_fireAndForget;
			["SuccessTitleOnly",["Название успешно обновлено!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		case "updBank": {
			_parameters params [["_type",""],["_object",objNull],["_amount",0]];
			if (isNull _object) throw "Автомат не определен";
			if ((_object getVariable ["ltdID",-1]) isEqualTo -1) throw "Ошибка 804";
			private ["_curBank","_bank","_limit","_newAmount"];
			_curBank = _object getVariable ["ltdSBank",0];
			_bank = _slotObject getVariable ["ltdSBank",0];
			_limit = _slotObject getVariable ["ltdSBLim",0];
			switch (_type) do
			{
				case "take": {
					if (_amount > _bank) throw "Недостаточно средств на счету автомата";
					[_player,"atm","add",_amount] call RRPServer_system_moneyChange;
					_newAmount = _curBank - _amount;
					_object setVariable ["ltdSBank",_newAmount,true];
					format ["updateSlotBank:%1:%2",_newAmount,(_object getVariable ["ltdID",-1])] call RRPServer_DB_fireAndForget;
					["SuccessTitleOnly",["Средства были сняты со счета автомата!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
				};
				case "add": {
					if (_amount > (_player getVariable ["RRPAtm",0])) throw "У вас недостаточно денег на счету!";
					[_player,"atm","take",_amount] call RRPServer_system_moneyChange;
					_newAmount = _amount + _curBank;
					_object setVariable ["ltdSBank",_newAmount,true];
					format ["updateSlotBank:%1:%2",_newAmount,(_object getVariable ["ltdID",-1])] call RRPServer_DB_fireAndForget;
					["SuccessTitleOnly",["Средства были добавлены на счет автомата!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
				};
				default {throw "АААААААААААААААААААААААААА"};
			};
			/*

				TODO!!!!!!!!!
				ДОДЕЛАТЬ СЧЕТА КАЗИНО! СНЯТИЕ И ДЕПОЗИТ ДЕНЕГ!!!!!!!


			*/
		};
		case "updBankLim": {
			_parameters params [["_object",objNull],["_newLimit",0]];
			if (isNull _object) throw "Автомат не определен";
			_object setVariable ["ltdSBLim",_newLimit,true];
			format ["updateSlotBankLimit:%1:%2",_newLimit,(_object getVariable ["ltdID",-1])] call RRPServer_DB_fireAndForget;
			["SuccessTitleOnly",["Лимит успешно обновлен!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
	};
}catch{
	diag_log _exception;
	["ErrorTitleOnly",[_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
