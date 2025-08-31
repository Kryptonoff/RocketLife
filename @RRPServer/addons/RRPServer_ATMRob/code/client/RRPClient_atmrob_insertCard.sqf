try 
{
	_target = _this;
	([_target] call RRPClient_system_isSafeZone) params ["_isSafeZone","_isNeutralZone"];
	if (_isSafeZone or _isNeutralZone) throw "В безопасной зоне нельзя ограбить банкомат!";
	if (life_action_inUse) throw "Вы заняты";
	if ((_target getVariable ['ATMRob', 'Work']) isNotEqualto 'Work') throw "Банкомат уже ограбили!";
	if ((_target getVariable ['ATMRob_Robber', objNull]) isNotEqualto objNull) throw "Банкомат обналичивают или чинят!";

	_condition = getText (missionConfigFile >> "CfgATMRob" >> "insertCardCondition");
	if !([_condition] call condition) throw getText (missionConfigFile >> "CfgATMRob" >> "insertCardConditionMessage");

	["Обнал", "Вас заметили жители, о вашей деятельности сообщено в полицию!"] call toastWarning;
	[
		[1,2],
		format["!!! Обнальщик (координаты: %1) орудует в городе %2 !!!",mapGridPosition player,text (nearestLocation[getPos player,"NameCity"])],false,[]
	] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];
	if (life_atm_robCounter % 3 isEqualTo 0 AND {life_atm_robCounter isNotEqualto 0} AND {!(player getVariable ["ATMRobber", false])}) then {
		["Обнал", "Из-за того, что вы ограбили слишком много банкоматов вы теперь в национальном розыске, за вами установлена слежка!"] call toastWarning;
		player setVariable ["ATMRobber", true, true];
	};

	[getPlayerUID player,"211AB"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	_target setVariable ["ATMRob_Robber", player, true];
	["Вставляем левую карточку", getNumber (missionConfigFile >> "CfgATMRob" >> "insertCardTime"),"","",true] call RRPClient_system_progressBarCustom;
	_target setVariable ["ATMRob_Robber", objNull, true];
	_target setVariable ["ATMRob", "CardInserted", true];

	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	["Обнал", "Вы вставили карточку, теперь ее нужно обналичить..."] call toastInfo;
} catch {
	["Обнал", _exception] call toastError;
};