try{
	private _target = param [0,ObjNull,[ObjNull]];
	if (isNull _target) throw "???";
	if (life_inwarzone) throw "Вы в зоне боевых действий, реанимация недоступна";

	if (count RRPClientGroupInfo isEqualTo 0 AND {player call getSide in ["civ","reb"]}) throw "У вас нет навыков для реанимации. Используйте больничную койку.";

	if (
			(player call getSide isEqualTo "cop") AND
			{((["cop"] call RRPClient_system_playerCount) > getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_cop_min") OR
			{(["med"] call RRPClient_system_playerCount) > getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_med_min")}) } &&
			{!([player] call RRPClient_system_isHospitalNear)}
	) throw format["Полицейских на острове больше %1, или медиков больше %2, а значит реанимировать можно только через больничную койку или дефибриллятор",getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_cop_min"),getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_med_min")];

	if (!(player call getSide in ["cop","med"]) AND {!([player] call RRPClient_system_isHospitalNear)}) throw "Члены организаций могут реанимировать только рядом с дефибриллятором!";

	if (
		player call getSide isEqualTo "med" &&
		{!("extItem_defibrillator" in (magazines player))}
	) throw "У вас нет дефибриллятора, необходимого для реанимации в полевых условиях";

	if !(_target getVariable ["lifeState",""] isEqualTo "INCAPACITATED") throw "Цель не в критическом состоянии";
	if (!isNil {_target getVariable "draggedBy"}) throw "Его кто-то несет...";
	if (_target getVariable ["reviving",objNull] == player) throw "Кто-то уже реанимирует этого человека";
	if (player distance _target > 5) throw "Слишком далеко";

	private _targetName = _target getVariable ["realname",""];
	private _title = format["%1 реанимация",_targetName];
	call RRPClient_actions_inUse;
	_target setVariable ["reviving",player,true];
	private _badDistance = false;
	private _cP = 0;
	private _cPStep = 0.01;
	_cPStep = ["LifeSaver", _cPStep] call RRPClient_perks_activatePerk;

	disableSerialization;
	player say3D "defib";
	titleText[_title,"PLAIN"];
	while {true} do
	{
		_cP = _cP + 0.01;
		[_cP,"medic"] call RRPClient_system_progressBar;
		if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};
		if (player distance _target > 4) exitWith {_badDistance = true;};
		if !(_target getVariable ["lifeState",""] isEqualTo "INCAPACITATED") exitWith {};
		if (_target getVariable ["reviving",ObjNull] != player) exitWith {};
		call RRPClient_animation_kneelWork;
		uiSleep 0.15;
	};

	["life_progress"] call RRPClient_gui_DestroyRscLayer;
	life_action_inUse = false;
	if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false;_target setVariable ["Reviving",nil,true];};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
	if (_target getVariable ["reviving",ObjNull] != player) then {_target setVariable ["Reviving",nil,true]; throw "Кто-то уже реанимирует этого человека";};
	[_target,"reviving"] call RRPClient_system_clearGlobalVar;
	if !(_target getVariable ["lifeState",""] isEqualTo "INCAPACITATED") throw "Этот человек появляется либо уже возродился.";
	if (_badDistance) throw "Вы слишком далеко от тела.";

	if ((player call getSide) isEqualTo "med") then
	{
		private _reviveFee = (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_revive_fee")) * 2;
		_reviveFee = if (('med' call RRPClient_groups_getSideLevel) >= 5) then {_reviveFee * 2} else {_reviveFee};
		[player,"atm","add",_reviveFee] remoteExecCall ["RRPServer_system_moneyChange",2];
		_log = format ["revived: atm (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_reviveFee];
		["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
		titleText[format["Вы реанимировали %1 и получили $%2 в качестве награды",_targetName,[_reviveFee] call RRPClient_util_numberText],"PLAIN"];
	};
	[100,"лечение"] call addXP;
	[player] remoteExec ["RRPClient_system_revived",_target];
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};