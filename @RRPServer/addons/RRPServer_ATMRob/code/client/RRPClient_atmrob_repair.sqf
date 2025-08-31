try 
{
	_target = _this;

	if (life_action_inUse) throw "Вы заняты";
	if ((_target getVariable ['ATMRob', 'Work']) isEqualto 'Work') throw "Банкомат уже работает!";
	if ((_target getVariable ['ATMRob_Robber', objNull]) isNotEqualto objNull) throw "Банкомат обналичивают или чинят!";

	_condition = getText (missionConfigFile >> "CfgATMRob" >> "repairCondition");
	if !([_condition] call condition) throw getText (missionConfigFile >> "CfgATMRob" >> "repairConditionMessage");

	_target setVariable ["ATMRob_Robber", player, true];
	["Чиним банкомат", getNumber (missionConfigFile >> "CfgATMRob" >> "repairTime"),"","",true] call RRPClient_system_progressBarCustom;
	_target setVariable ["ATMRob_Robber", objNull, true];
	_target setVariable ["ATMRob", "Work", true];

	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	_price = getNumber(missionConfigFile >> "CfgATMrob" >> "price");
	if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
	["Починка банкомата", format ["Вы успешно починили банкомат и получили вознаграждение в размере $%1",_price]] call toastSuccess;
	[player, "cash","add", getNumber (missionConfigFile >> "CfgATMRob" >> "repairReward")] remoteExecCall ["RRPServer_system_moneyChange",2];
	[150,"ремонт банкомата"] call addXP;
} catch {
	["Починка банкомата", _exception] call toastError;
};