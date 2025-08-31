/*

	Filename: 	RRPClient_system_actionKeyHandler.sqf
	Project: 	Rimas Altis Life RPG
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _curTarget = param [0,objNull,[objNull]];
if (life_action_inUse) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false};
if (dialog) exitWith {};
curTarget = _curTarget;
if (EQUAL(_curTarget,player)) exitWith {};
private ["_whatIsIt","_handle"];


switch (true) do
{
	case ((typeOf _curTarget) isEqualto "Land_CargoBox_V1_F"): {
		["fed"] call RRPClient_system_interactionWinKey;
	};
	
	case ((typeOf _curTarget) in ["A3L_Corn", "A3L_Cotton", "A3L_Cannabis", "A3L_Beans", "A3L_Wheat", "A3L_Sunflower"] AND (_curTarget getVariable ["growState", []] isNotEqualTo [])): {
		["farming"] call RRPClient_system_interactionWinKey;
	};
	case ((typeOf _curTarget) isEqualto "RRP_casino_slot_vgo"): {
		["slots"] call RRPClient_system_interactionWinKey;
	};
	case ((typeOf _curTarget) in ["Land_rrp_panel"]): {
		["ltds_stores"] call RRPClient_system_interactionWinKey;
	};

	case (["ref",vehicleVarName _curTarget] call RRPClient_util_xString): {
		["refinery"] call RRPClient_system_interactionWinKey;
	};

	case ((typeOf _curTarget) in ["Land_GateB"]): {
		["gate_lattice"] call RRPClient_system_interactionWinKey;
	};
	case ((typeOf _curTarget) in ['Land_MM_US_Gate_01_Clear','Land_MM_US_Gate_01']): {
		["gate_sand"] call RRPClient_system_interactionWinKey;
	};
	case (!isplayer _curTarget and {_curTarget isKindOf "RRP_NPC_Abstract"} and {player distance _curTarget <= 5} and {_curTarget getVariable ["npcClass", ""] isNotEqualTo ""}):
	{
		[_curTarget] spawn RRPClient_gui_npc_openDialog;
	};
	case ((typeOf _curTarget) isEqualTo "Land_WeldingTrolley_01_F") : {
		call RRPClient_diving_replenishment;
	};
	case ((typeOf _curTarget) in getArray(missionConfigFile >> "cfgDiving" >> "trunks") AND {_curTarget getVariable ["divingObj",false]}): {
		[] spawn RRPClient_diving_action;
	};
	case ((typeOf _curTarget) == "ver_prison_toilet"): {
		[_curTarget] spawn RRPClient_jw_startACtion
	};
	case ((typeOf _curTarget) in ["A3L_Beans","A3L_Cannabis","A3L_Sunflower","acd_b_NeriumO2s_white_F","acd_b_NeriumO2d_F"]): {
		_curTarget call RRPClient_herbalist_takeHarbs;
	};
	case (((typeOf _curTarget) in ["Land_RRP_Gate","Land_RRP_Gate_w","Land_RRP_Gate_w2","Land_RRP_Gate_small","Land_RRP_Gate_small_w","Land_RRP_Gate_small_w2","Lad_RRP_Gate_small2","Land_RRP_Gate2","Land_RRP_Gate_small2"]) AND {(_curTarget distance player < 11)}): {
		["gate"] call RRPClient_system_interactionWinKey;
	};
	case !(_curTarget getVariable ["licenseStorage", ""] isEqualto ""): {
		_curTarget call RRPClient_wpnStorage_openMenu;
	};
	case ((NOTINVEH(player)) AND ((typeOf _curTarget) isEqualto "Land_TransferSwitch_01_F") AND {(_curTarget distance player < 3)}): {
		["generator"] call RRPClient_system_interactionWinKey;
	};
	case ((NOTINVEH(player)) AND ((typeOf _curTarget) == LIFE_SETTINGS(getText,"life_trunkClass")) AND {player distance _curTarget < 5}): {
		["gangTrunk"] call RRPClient_system_interactionWinKey;
	};
	case ((NOTINVEH(player)) AND ((typeOf _curTarget) isEqualto "Land_IndPipe1_valve_F") AND {(_curTarget distance player < 5)}): {
		[] spawn RRPClient_farm_farmOil;
	};
	case ((NOTINVEH(player)) AND ((typeOf _curTarget) isEqualto "Land_Device_assembled_F") and {(_curTarget distance player < 5)}): {
		["processing_obj"] call RRPClient_system_interactionWinKey;
	};
	case ((NOTINVEH(player)) AND ((typeOf _curTarget) isEqualto "RRP_Gift") and (_curTarget distance player < 8)): {
		_curTarget call RRPClient_drops_activate;
	};
	case ((NOTINVEH(player)) AND {["atm_",([_curTarget] call RRPClient_util_getModelName)] call RRPClient_util_xString} && {_curTarget distance player < 3}) :
	{
		["atm"] call RRPClient_system_interactionWinKey;
	};
	case ((NOTINVEH(player)) AND {([_curTarget] call RRPClient_util_getModelName in (getArray (missionConfigFile >> "LifeCfgSettingsTrash" >> "RubbishArray")))} and {_curTarget distance player < 3}) :
	{
		[_curTarget] spawn RRPClient_farm_simulatorBomja;
	};
	case ((NOTINVEH(player)) AND {(_curTarget isKindOf "House_F")} AND {!(typeOf _curTarget in ["Land_SCF_01_pipe_end_F","acd_W_sharpStone_02","acd_c_GrassGreen_GroupHard","acd_c_GrassTall","acd_b_NeriumO2d_F"])}):
	{
		[_curTarget] call RRPClient_system_initHouseMenu;
	};
	case ((NOTINVEH(player)) AND {_curTarget isKindOf "CAManBase"} AND {player distance _curTarget < 5} AND {isPlayer _curTarget} AND {LSINCAP(_curTarget)}):
	{
		["agony"] call RRPClient_system_interactionWinKey;
	};
	case ((NOTINVEH(player)) AND {_curTarget isKindOf "CAManBase"} AND {player distance _curTarget < 5} AND {isPlayer _curTarget} AND {alive _curTarget}):
	{
		if (GVAR_RESTRAINED(_curTarget)) then
		{
			switch (true) do {
				case (ISPSIDE("cop")): {['cop'] call RRPClient_system_interactionWinKey};
				case (ISPSIDE("med")): {['med'] call RRPClient_system_interactionWinKey};
				default {['civ'] call RRPClient_system_interactionWinKey};
			};
		} else {
			['free'] call RRPClient_system_interactionWinKey;
		};
	};

	case ((NOTINVEH(player)) AND {!alive _curTarget} AND {(_curTarget isKindOf "Animal") OR (_curTarget isKindOf "Animal_Abstract")}):
	{
		[_curTarget] spawn RRPClient_farm_gutAnimal;
	};
	case ((NOTINVEH(player)) AND {[_curTarget] call RRPClient_system_isVehicleKind} AND {player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2}):
	{
		if ((typeOf _curTarget) in ["RRPHospitalBed","Rimas_EMS_Stretcher"]) then {
			['HospitalBed'] call RRPClient_system_interactionWinKey;
		} else {
			['vehicle'] call RRPClient_system_interactionWinKey;
		};
	};

	case ((NOTINVEH(player)) AND {(surfaceIsWater position player)}):
	{
		[] spawn RRPClient_farm_clams;
	};
	default {
		[_curTarget,"hand"] call RRPClient_farm_miningInit
	};
};
