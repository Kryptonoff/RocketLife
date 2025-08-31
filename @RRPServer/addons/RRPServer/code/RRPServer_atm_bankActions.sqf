/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

params ["_id","_parameters"];
try
{
	_player = _id call RRPServer_session_getPlayerObject;
	_uid = getPlayerUID _player;
	_mode = _parameters param [0,"",[""]];
	_params = _parameters param [1,[],[[]]];
	switch (_mode) do
	{
		case "deposit": {
			_params params ["_value"];
			_cash = _player getVariable ["RRPCash",0];
			_bank = _player getVariable ["RRPAtm",0];
			str _parameters call RRPServer_util_debugConsole;
			if (_value <= 0) throw "Укажите положительное значение";
			if (_value > _cash) throw "У вас недостаточно наличности.";
			[_player,"cash","swap",_value,[format["%1 (%2) положил в банк %3 было в банке (%4) на руках",name _player,_uid,_value,[_bank] call RRPClient_util_numberText,[_cash] call RRPClient_util_numberText],"AtmLog"]] call RRPServer_system_moneyChange;
			["response",["Вы успешно положили деньги на Ваш банковский счет!",["money_out"]]] remoteExecCall ["RRPClient_atm_actions", _player];
		};
		case "withdraw": {
			_params params ["_value"];
			_cash = _player getVariable ["RRPCash",0];
			_bank = _player getVariable ["RRPAtm",0];
			if (_value <= 0) throw "Укажите положительное значение";
			if (_value > _bank) throw "У вас нет такой суммы на вашем счёте!";
			[_player,"atm","swap",_value,[format["%1 (%2) снял с банка %3 было в банке %4 на руках %5",name _player,_uid,_value,[_bank] call RRPClient_util_numberText,[_cash] call RRPClient_util_numberText],"AtmLog"]] call RRPServer_system_moneyChange;
			["response",["Вы успешно сняли наличные деньги!",["money_in"]]] remoteExecCall ["RRPClient_atm_actions", _player];
		};
		case "transfer": {
			_params params ["_value","_tax","_netUnit"];
			_unit = objectFromNetId _netUnit;
			if (isNull _unit) throw "Не определен получатель";
			_cash = _player getVariable ["RRPCash",0];
			_bank = _player getVariable ["RRPAtm",0];
			private _sum = _value + _tax;
			if (_sum > _bank) throw format["У вас не хватает денег на счету. Для перевода $%1 вам необходимо оплатить налог $%2.",[_val] call RRPClient_util_numberText,[_tax] call RRPClient_util_numberText];
			[_player,"atm","take",_sum, 
				[format ["%1 (%2) перевел %3 (%4) %5$ + %6$ налог , было в банке %7",
					name _player,
					_uid,
					name _unit, 
					getPlayerUID _unit,
					[_value] call RRPClient_util_numberText,
					[_tax] call RRPClient_util_numberText,
					[_bank] call RRPClient_util_numberText				
				],"AtmLog"]
			] call RRPServer_system_moneyChange;
			[_unit,"atm","add",_val] call RRPServer_system_moneyChange;
			["response",[format["Вы успешно совершили перевод %1 в сумме $%2, комиссия составила $%3!",_unit call getNickName,[_val] call RRPClient_util_numberText,[_tax] call RRPClient_util_numberText],["money_out"]]] remoteExecCall ["RRPClient_atm_actions", _player];
			["response",[format["Вы получили перевод от %1 Ваши $%2 зачислены на Ваш банковский счет!",_player call getNickName,[_val] call RRPClient_util_numberText],["money_success"]]] remoteExecCall ["RRPClient_atm_actions", _unit];		
		};
		default {throw "Че за нах?"};
	};
}catch{
	["response",[_exception,["bank_error_2"]]] remoteExecCall ["RRPClient_atm_actions", _player];
	_exception call RRPServer_util_log;	
};
 