/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

params ["_unit","_weapon","_muzzle","_mode","_ammoType","_magazine","_projectile","_gunner"];

if (player getVariable ["RRPVariablePartyMeatRespawn",false]) then {
	deleteVehicle _projectile;
};

if (player getVariable ["RRPVariablePartyMeatActive",false]) exitWith {};

if (RRPClientInDeathZone) exitWith {
	deleteVehicle _projectile;
};

([player] call RRPClient_system_isSafeZone) params ["_isSafeZone","_isNeutralZone"];
if (_isSafeZone && !(('cop' call RRPClient_groups_getSideLevel) > 0) && !(_weapon isEqualTo "DDOPP_X26_b")) then {
		deleteVehicle _projectile;
};

if (_isNeutralZone) then {
	deleteVehicle _projectile;
};

if !(isNull(player getVariable ["escortingPlayer",objNull])) then {
	if (((missionNameSpace getVariable ["escort_weapon_lowered",0]) isEqualTo 0) && ((currentWeapon player) isEqualTo (handgunWeapon player)) && !(missionNameSpace getVariable ["escort_action",false])) then {
		if ((currentWeapon player) in ["DDOPP_X26","DDOPP_X26_b"]) exitWith {};
		escort_action = true;
		[] spawn {
			_unit = (player getVariable ["escortingPlayer",objNull]);
			_unit attachTo [player,[0,0.75,0]];
			player playActionNow "Disable_Gesture";
			[player,"ag_hostage_main_killed",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			[_unit,"ag_hostage_victim_killed",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			uiSleep 1.9;
			player forceWalk false;
			[_unit,player] remoteExec ["RRPClient_dmg_Agony",_unit];
			detach _unit;
			uiSleep 0.2;
			[player,"AmovPercMstpSrasWpstDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			escort_action = false;
			[_unit,"Escorting"] call life_fnc_clearGlobalVar;
		};
	};
};

switch (true) do
{
	case (_ammoType isEqualTo life_anomalyBoltAmmo) : {
		[_projectile] call client_system_grenadeBolt;
	};

	case (life_jail_coin > 0):
	{
		deleteVehicle _projectile;
		["WarningTitleAndText", ["Внимание!", "Вы не можете наносить урон игрокам пока не пройдете исправительные работы!"]] call SmartClient_gui_toaster_addTemplateToast;
	};
	case (_ammoType isEqualTo "Extremo_Ammo_Swing"):
	{
		deleteVehicle _projectile;
		if ({_x == "Extremo_Magazine_Swing"} count magazines player > 0) then
		{
			player removeMagazines "Extremo_Magazine_Swing";
		};
		if !((stance _unit) isEqualTo "STAND") exitWith {};
		switch (true) do
		{
			case (_weapon isEqualTo "Extremo_Tool_Shovel"): {player playActionNow "FT_Act_Dig_Shovel_Loop_Full_3x"; [] spawn RRPClient_archeology_checkDistance;};
			case (_weapon isEqualTo "Extremo_Tool_Axe"): {player playActionNow "FT_Act_Axe_Swing"; [] spawn RRPClient_gather_Tree;};
			default {};
		};
	};
	case (_ammoType isEqualTo "BP_Pickaxe_Swing_Ammo"):
	{
 		deleteVehicle _projectile;
	};

	case (_ammoType isEqualto "BP_Hatchet_Swing_Ammo") :
	{
		[] spawn RRPClient_jobs_gatherTree;
	};

/*
	case (isClass(missionConfigFile >> "LifeCfgItems" >> _weapon)):
	{
		if !([getText(missionConfigFile >> "LifeCfgItems" >> _weapon >> "condition_use")] call RRPClient_util_conditionsCheck) then {
			"Вы стреляете с охолощенного оружия!" call chat;
			deleteVehicle _projectile;
		};
	};
*/
	default {
		life_pvp = true;
		life_pvp_start = time;
		if (RRPClientDeleteAmmoTime > time AND (call life_adminlevel) <= 3) then
		{
			addCamShake [6, 0.4, 8];
			"Какие то помутнения в глазах...наверное не полностью отошел после ранения!" call chat;
			[] spawn
			{
				if (life_warBlur_status) exitWith {};
				life_warBlur_status = true;
				player say3d "action_panic_1";
				private _blurEffect = ppEffectCreate ["DynamicBlur",500];
				_blurEffect ppEffectForceInNVG true;
				_blurEffect ppEffectEnable true;
				_blurEffect ppEffectAdjust [10];
				_blurEffect ppEffectCommit 0.3;
				uiSleep 10;
				_blurEffect ppEffectAdjust [0];
				_blurEffect ppEffectCommit 3;
				uiSleep 3;
				_blurEffect ppEffectEnable false;
				ppEffectDestroy _blurEffect;
				life_warBlur_status = false;
			};
		};
		_this call RRPClient_suppression_fired;
	};
};

if (_weapon in ["MeleeHatchet","MeleeKatana","MeleeHammer","MeleeHammer2","MeleeShovel","MeleeCrowbar","MeleeClub"]) then {player playActionNow "FT_Act_Axe_Swing";};
