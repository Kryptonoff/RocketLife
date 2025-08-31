private _medic = param [0,objNull,[objNull]];
private _reviveFee = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_revive_fee");

if (_medic call getSide isEqualTo "med" && {(RRPClientAtmMoney > _reviveFee)}) then
{
	[format["%1 реанимировал вас и вы оплатили $%2 за услуги врача.",_medic getVariable ["realname",""],[_reviveFee] call RRPClient_util_numberText]] call hints;
	[player,"atm","take",STR(_reviveFee)] remoteExecCall ["RRPServer_system_moneyChange",2];

	_log = format ["revived: atm (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_reviveFee];
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
};

player setUnconscious false;
[player,"medicStatus"] call RRPClient_system_clearGlobalVar;
if (count RRPClientGroupInfo isEqualTo 0 or {(RRPClientGroupInfo get "name") isNotEqualTo (_medic getVariable ["GroupId",-1])}) then {
	private _chance = if (["washing"] call perk) then {50}else{100};
	if (random 100 < _chance) then {
		RRPClientDeleteAmmoTime = time + (10 * 60)
	};
};

player setVariable ["tf_unable_to_use_radio", false];
["all"] call RRPClient_system_removeBuff;
["Death_Screen_V2"] call RRPClient_gui_DestroyRscLayer;
player setDamage 0;
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

if !(player getVariable ["RRPVariablePartyMeatActive",false]) then {
	player playMoveNow "amovpercmstpsnonwnondnon";
	2 fadeSound 1;
	cutText ["Вы приходите в себя...", "BLACK IN", 5];
	uiSleep 4;
} else {
	cutText ["", "BLACK IN", 0];
};

true call RRPClient_hud_show;
if (isNull LIFE_HANDLE_EFFECTS) then {LIFE_HANDLE_EFFECTS = [] spawn RRPClient_effects_Init};
