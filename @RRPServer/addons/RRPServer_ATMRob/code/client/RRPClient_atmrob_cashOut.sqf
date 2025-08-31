try 
{
	_target = _this;

	if (life_action_inUse) throw "Вы заняты";
	if ((_target getVariable ['ATMRob', 'Work']) isNotEqualto 'CardInserted') throw "Банкомат уже ограбили!";
	if ((_target getVariable ['ATMRob_Robber', objNull]) isNotEqualto objNull) throw "Банкомат обналичивают или чинят!";

	_condition = getText (missionConfigFile >> "CfgATMRob" >> "robCondition");
	if !([_condition] call condition) throw getText (missionConfigFile >> "CfgATMRob" >> "robConditionMessage");

	[getPlayerUID player,"211AB"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	_target setVariable ["ATMRob_Robber", player, true];
	["Обналичиваем карточку", getNumber (missionConfigFile >> "CfgATMRob" >> "robTime"),"","",true] call RRPClient_system_progressBarCustom;
	_target setVariable ["ATMRob_Robber", objNull, true];
	_target setVariable ["ATMRob", "Robbed", true];

	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	life_atm_robCounter = life_atm_robCounter + 1;
	profileNamespace setVariable ["PRNS_atm_robCounter", life_atm_robCounter];
	saveProfileNamespace;
	
	_price = getNumber(missionConfigFile >> "CfgATMrob" >> "robReward");
	_price = _price + round(random _price);
	if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
	["Обнал", format ["Вы успешно выполнили работу и получили вознаграждение в $%1 грязными деньгами",_price]] call toastSuccess;
	[player,"dcash","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
	[50,"ограбление банкомата"] call addXP;
} catch {
	["Обнал", _exception] call toastError;
};