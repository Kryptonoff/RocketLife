/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_groupHash","_members","_sessionID", "_parameters", "_player", "_groupID"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует! :)";
	_groupID = _player getVariable ["GroupID",-1];
	if (_groupID isEqualTo -1) throw "Вы не в организации!";
	if !(_groupID call RRPClient_groups_isPayed) throw "У вас не оплачена аренда, оплатить можно в личном кабинете lk.rocket-rp.fun";
	_groupHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_groupID],createHashMap];
	if (count _groupHash isEqualTo 0) throw "Данные организации повреждены!";
	private _mode = _parameters select 0;
	private _scalar = _parameters select 1;
	private _bankGroup = _groupHash get "bank";
	if (_mode) then
	{
		_tax = getNumber(getMissionConfig "CfgGroups" >> "taxToDeposit") / 100;
		private _sum = round (_scalar + (_scalar * _tax));
		if (_scalar > (_player getVariable ["RRPAtm",0])) throw "Недостаточно денег на вашем банковском счету";
		if (_sum > (_player getVariable ["RRPAtm",0])) throw format ["У вас недостаточно денег на счету для оплаты налога в %2%1",_tax,"%"];
		_bankGroup = _bankGroup + _scalar;
		private _limit = getNumber(missionConfigFile >> "CfgGroups" >> "limitDeposit");
		if (_limit < _bankGroup) throw format ["Банк организации имеет ограничение в $%1",[_limit] call RRPClient_util_numberText];
		[_player,"atm","take",_sum] call RRPServer_system_moneyChange;
		["response",[format["Вы положили $%1 в банк организации!<br/>Комиссия составила $%2",[_scalar] call RRPClient_util_numberText,(_scalar * _tax)],["money_out"]]] remoteExecCall ["RRPClient_atm_actions",owner _player];
		[_groupID,"g_bank",getPlayerUID _player,format ["%1 положил в счет организации $%2. Баланс $%3",
			_player call getFullName,
			[_scalar] call RRPClient_util_numberText,
			[_bankGroup] call RRPClient_util_numberText
			]
		] call RRPServer_groups_log;

	}else{
		if (_bankGroup < _scalar) throw "В банке организации нет столько денег!";
		_bankGroup = _bankGroup - _scalar;
		[_player,"cash","add",_scalar] call RRPServer_system_moneyChange;
		["response",[format["Вы сняли $%1 с банка организации!",[_scalar] call RRPClient_util_numberText],["money_in"]]] remoteExecCall ["RRPClient_atm_actions",owner _player];
		[_groupID,"g_bank",getPlayerUID _player,format ["%1 снял со счета организации $%2. Баланс $%3",_player call getFullName,[_scalar] call RRPClient_util_numberText,[_bankGroup] call RRPClient_util_numberText]] call RRPServer_groups_log;

	};
	_groupHash set ["bank",_bankGroup];
	missionNameSpace setVariable [format["ServerGroupsInfo_%1",_groupID],_groupHash];
	_groupID call RRPServer_groups_updateClients;
	format ["setGroupBank:%1:%2",_bankGroup,_groupID] call RRPServer_DB_fireAndForget;
}
catch
{
	_exception call RRPServer_util_log;
	["response",[_exception,[]]] remoteExecCall ["RRPClient_atm_actions",owner _player];
};
