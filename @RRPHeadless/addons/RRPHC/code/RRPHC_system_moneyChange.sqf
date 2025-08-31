/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
	Usage:
		[
			player  - object
			"atm" - type STRING
			"take" - _mode STRING
			"123" - _price !!!!STRING!!!!
		] remoteExecCall ["RRPServer_system_moneyChange",2];
*/
#define CTEXT(var) [var] call RRPClient_util_numberText

params
[
	["_player",objNull,[objNull]],
	["_type","",[""]],
	["_mode","",[""]],
	["_price","",["",0]],
	["_log",[],[[]]]
];
try
{
	if (isNull _player) throw "MoneyChange - Null";
	if (_type isEqualTo "") throw "MoneyChange - type is empty";
	if (_mode isEqualTo "") throw "MoneyChange - mode is empty";
	if (_price isEqualType "") then {_price = parseNumber(_price);};
	_playerUID = getPlayerUID _player;
	_cash = _player getVariable ["RRPCash",0];
	_atm = _player getVariable ["RRPAtm",0];
	_point = _player getVariable ["RRPPoint",0];
	_dcash = _player getVariable ["RRPDcash",0];
	_trx = _player getVariable ["RRPTRX",0];
	if !(_log isEqualTo []) then {[_log select 0,_log select 1] call RRPServer_system_logIt;};
	[format ["Old Balance Player: %7 (%8): CASH (%1) ATM (%2) POINT (%3) DCASH (%4) - mode: %5 Price: %6",CTEXT(_cash),CTEXT(_atm),CTEXT(_point),CTEXT(_dcash),_mode,CTEXT(_price),name _player,_playerUID],"MoneyChange"] call RRPHC_system_logIt;
	switch (_type) do
	{
		case "cash":
		{
			switch (_mode) do
			{
				case "add": 
				{
					_cash = floor (_cash + _price);
					_player setVariable ["RRPCash",_cash];
				};
				case "take": 
				{
					_cash = floor (_cash - _price);
					_player setVariable ["RRPCash",_cash];
				};
				case "set": 
				{
					_player setVariable ["RRPCash",_price];
				};
				case "drop": 
				{
					_player setVariable ["RRPCash",0];
				};
				case "swap": 
				{
					_cash = floor(_cash - _price);
					if (_cash < 0) then {_cash = 0};
					_atm = floor(_atm + _price);
					_player setVariable ["RRPCash",_cash];
					_player setVariable ["RRPAtm",_atm];
				};
				default {};
			};
		};
		case "trx":
		{
			switch (_mode) do
			{
				case "add": 
				{
					_cash = floor (_cash + _price);
					_player setVariable ["RRPTRX",_cash];
				};
				case "take": 
				{
					_cash = floor (_cash - _price);
					_player setVariable ["RRPTRX",_cash];
				};
				case "set": 
				{
					_player setVariable ["RRPTRX",_price];
				};
				default {};
			};
		};
		case "atm":
		{
			switch (_mode) do
			{
				case "add": 
				{
					_atm = floor (_atm + _price);
					_player setVariable ["RRPAtm",_atm,true];
				};
				case "take": 
				{
					_atm = floor (_atm - _price);
					_player setVariable ["RRPAtm",_atm,true];
				};
				case "set": 
				{
					_player setVariable ["RRPAtm",_price,true];
				};
				case "drop": 
				{
					_player setVariable ["RRPAtm",0];
				};
				case "swap": 
				{
					_atm = floor(_atm - _price);
					if (_atm < 0) then {_atm = 0};
					_cash = floor(_cash + _price);
					
					_player setVariable ["RRPCash",_cash];
					_player setVariable ["RRPAtm",_atm];
				};
				default {};
			};
		};
		case "point":
		{
			switch (_mode) do
			{
				/* 
				case "add": 
				{
					_point = floor (_point + _price);
					_player setVariable ["RRPPoint",_point];
				};
				 */
				case "take": 
				{
					if (_price < 0) then
					{
						[_playerUID,999999,"Пополнять RC нужно было через ЛК! Сорян:)"] call RRPHC_DB_addBan;
					};
					_point = floor (_point - _price);
					_player setVariable ["RRPPoint",_point];
				};
				case "set": 
				{
					_player setVariable ["RRPPoint",_price];
				};
				case "drop": 
				{
					_player setVariable ["RRPPoint",0];
				};
				default {};
			};
		};
		case "dcash":
		{
			switch (_mode) do
			{
				case "add": 
				{
					_dcash = floor (_dcash + _price);
					_player setVariable ["RRPDcash",_dcash];
				};
				case "take": 
				{
					_dcash = floor (_dcash - _price);
					_player setVariable ["RRPDcash",_dcash];
				};
				case "set": 
				{
					_player setVariable ["RRPDcash",_price];
				};
				case "drop": 
				{
					_player setVariable ["RRPDcash",0];
				};
				case "swap": 
				{
					_cash = floor(_cash + _price);
					_player setVariable ["RRPDcash",0];
					_player setVariable ["RRPCash",_cash];
				};
				default {};
			};
		};
		case "serverbank":
		{
			switch (_mode) do
			{
				case "add": {
					format ["ADD MONEY CHANGE SERVER BANK %1 - BALANCE %2 #1111",_price, server_bank, server_bank + _price] call RRPHC_util_debugConsole;
					server_bank = server_bank + _price;
					publicVariable "server_bank";
					format ["serverBank:%1",server_bank] call RRPHC_DB_fireAndForget;
				};
				case "take": {
					format ["TAKE MONEY CHANGE SERVER BANK %1 - BALANCE %2 | NEW BALANCE %3 #1111",_price, server_bank,server_bank - _price] call RRPHC_util_debugConsole;
					server_bank = server_bank - _price;
					publicVariable "server_bank";
					format ["serverBank:%1",server_bank] call RRPHC_DB_fireAndForget;
				};
				case "set": {
					server_bank = _price;
					publicVariable "server_bank";
					format ["serverBank:%1",server_bank] call RRPHC_DB_fireAndForget;
					format ["SET MONEY CHANGE SERVER BANK %1 #1111",_price] call RRPHC_util_debugConsole;
				};
				default {};
			};
		};
	};
	_cash = _player getVariable ["RRPCash",0];
	_atm = _player getVariable ["RRPAtm",0];
	_point = _player getVariable ["RRPPoint",0];
	_dcash = _player getVariable ["RRPDcash",0];
	_trx = _player getVariable ["RRPTRX",0];
	[format ["New Balance Player: %7 (%8): CASH (%1) ATM (%2) POINT (%3) DCASH (%4) - mode: %5 Price: %6",CTEXT(_cash),CTEXT(_atm),CTEXT(_point),CTEXT(_dcash),_mode,CTEXT(_price),name _player,_playerUID],"MoneyChange"] call RRPHC_system_logIt;
	format["updateMoney:%1:%2:%3:%4:%5:%6",_cash,_atm,_point,_dcash,_trx,_playerUID] call RRPHC_DB_fireAndForget;
	[_cash,_atm,_point,_dcash] remoteExecCall ["RRPClient_system_syncMoney",_player];
}catch{
	_exception call RRPHC_util_log;
};
true