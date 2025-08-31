/*

	Filename: 	RRPClient_effects_Init.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _lastSync = time;
while {!debug} do {
	private _isUnderWater = underwater player;
	private _backPack = (backpack player);
	private _isUWW = (["RRP_UWW_", backpack player] call RRPClient_util_xString);

	private _display = uiNamespace getVariable ["playerHUD",displayNull];
	private _group = _display displayCtrl 1999;
	private _pbStamina = _group controlsGroupCtrl 2001;
	private _iconStamina = _group controlsGroupCtrl 2006;
	private _w = (0.0889536 * safezoneW);
	if (_isUnderWater AND !_isUWW) then {
		private _stamina = (getOxygenRemaining player);
		if ((ctrlText _iconStamina) isNotEqualTo "\RRP_icons\holdAction\lungs.paa") then {_iconStamina ctrlSetText "\RRP_icons\holdAction\lungs.paa"};
		_pbStamina ctrlSetPositionW ((_stamina * _w) min _w);
		_pbStamina ctrlSetBackgroundColor [0,(_stamina * 0.92),0.99,0.8];
		_pbStamina ctrlCommit 0.05;
	};

	if (_isUnderWater AND _isUWW AND (RRPOxygenRemaining > 0)) then {
		private _stamina = RRPOxygenRemaining;
		if ((ctrlText _iconStamina) isNotEqualTo "\RRP_icons\holdAction\balloon.paa") then {_iconStamina ctrlSetText "\RRP_icons\holdAction\balloon.paa"};
		_pbStamina ctrlSetPositionW ((_stamina * _w) min _w);
		_pbStamina ctrlSetBackgroundColor [0,(_stamina * 0.92),0.99,0.8];
		_pbStamina ctrlCommit 0.05;

		private _oneTick = 1 / ((((getNumber(missionConfigFile >> "cfgDiving" >> "capacityOxygenTime")) * 60) * 3) / 2);
	  	RRPOxygenRemaining = RRPOxygenRemaining - _oneTick;
		{
		    if (RRPOxygenRemaining <= _x) exitWith {
				 private _queueVest = format["RRP_UWW_%1",(_x * 100)];

				 if !(_backPack isEqualTo _queueVest) then {
					 diag_log format ["%1 change на %2",_backPack,_queueVest];
					 removeBackpack player;
					 player addBackpack _queueVest;
					 currentBackpack = _queueVest;
				 };
			};
		} forEach [
			0,
			0.05,
			0.1,
			0.15,
			0.2,
			0.25,
			0.3,
			0.35,
			0.4,
			0.45,
			0.5,
			0.55,
			0.6,
			0.65,
			0.7,
			0.75,
			0.8,
			0.85,
			0.9,
			0.95
		];
		if (RRPOxygenRemaining > 0.2) then {player setOxygenRemaining 1};
		if (RRPOxygenRemaining <= 0.2) then {player setOxygenRemaining 0.6};
		if (RRPOxygenRemaining <= 0.15) then {player setOxygenRemaining 0.4};
		if (RRPOxygenRemaining <= 0.1) then {player setOxygenRemaining 0.3};
		if (RRPOxygenRemaining <= 0) then {
			player setOxygenRemaining 1;
			["InfoTitleAndText", ["У вас закончился кислород", "Пополните баллон кислородом, это можно сделать на пирсе"]] call SmartClient_gui_toaster_addTemplateToast;
		};
	};

	if (isNil 'InfoList') then {
		[] spawn RRPClient_herbalist_init;
	};
	private _inDivingZone =  player inArea "gather_diving_zone";
	if (_inDivingZone AND isNil 'diving_point') then {
		[] spawn RRPClient_diving_startAction
	};

	if (!_inDivingZone AND !(isNil 'diving_point')) then {
		deleteVehicle diving_point;
		diving_point = nil;
	};

	if !(currentBackpack isEqualTo (backpack player)) then {
		currentBackpack = (backpack player);
		[] spawn RRPClient_evh_changeGear;
	};

	//не наркоман ли ты случаем?
	if (isNull LIFE_HANDLE_DRUGS && {RRPClientNarcomania > 0}) then {
		LIFE_HANDLE_DRUGS = [] spawn RRPClient_effects_Drugs;
	};

	//паспорта и взломанные дома
	if (isNull LIFE_HANDLE_TEMPVARS && {(count life_ids > 0) OR (count life_tempHouses > 0)}) then {
		LIFE_HANDLE_TEMPVARS = [] spawn RRPClient_effects_TempVars;
	};

	//если не полная жизнь
	if (isNull LIFE_HANDLE_DMG && {damage player > 0.25}) then {
		LIFE_HANDLE_DMG = [] spawn RRPClient_effects_Dmg;
	};

	//болеем ли мы
	if (isNull LIFE_HANDLE_SICK && {life_sickness}) then {
		LIFE_HANDLE_SICK = [] spawn RRPClient_effects_Sick;
	};

	//бухлишко
	if (isNull LIFE_HANDLE_DRUNK && {life_drink > 0}) then {
		LIFE_HANDLE_DRUNK = [] spawn RRPClient_effects_Drunk;
	};

	//рюкзак и макс вес
	if (isNull LIFE_HANDLE_WEIGHT) then {
		LIFE_HANDLE_WEIGHT = [] spawn RRPClient_effects_Weight;
	};

	//пвп режим
	if (life_pvp && isNull LIFE_HANDLE_PVP) then {
		LIFE_HANDLE_PVP = [] spawn RRPClient_effects_PvP;
	};

	//внутри зоны боя
	if (isNull LIFE_HANDLE_WARZONES && {life_inwarzone OR {!(EQUAL(RRPServerWarZones,[]))} }) then {
		LIFE_HANDLE_WARZONES = [] spawn RRPClient_effects_WarZones;
	};

	//позиция
	if (isNull LIFE_HANDLE_POSITION) then {
		LIFE_HANDLE_POSITION = [] spawn RRPClient_effects_Position;
	};

	//TeamSpeak
	if (isNull LIFE_HANDLE_TEAMSPEAK && {!server_ddos_ts}) then {
		LIFE_HANDLE_TEAMSPEAK = [] spawn RRPClient_effects_TeamSpeak;
	};

	//houses
	if (count life_tempHouses > 0) then {
		{
			if (player distance (_x) > 50) then {
				life_tempHouses set [_forEachIndex,-1];
				["InfoTitleOnly",["Вы далеко отошли от взломанного дома и потеряли ключи"]] call toast;
			}
		} forEach life_tempHouses;
		life_tempHouses = life_tempHouses - [-1];
	};


	if (time - _lastSync > 15*60) then
	{
		call RRPClient_session_updateRequest;
		_lastSync = time;
	};


	if (player getVariable ["RRPVariablePartyMeatActive",false]) then {
		if !(player inArea "other_party_meat") then {
			call RRPClient_partymeat_respawn;
		};
	} else {
		if (player inArea "other_party_meat") then {
			(vehicle player) setPos [29768.3,29771.1,114.932];
		};
	};




	uiSleep 2;
};
