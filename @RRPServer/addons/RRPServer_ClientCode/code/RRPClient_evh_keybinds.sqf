#include "..\script_macros.hpp"

params ["_func","_keyDown"];
private _cursorTarget = cursorObject;

if (_keyDown) then
{
	switch (_func) do
	{
		case "WinAction":
		{
			if (!RRPClientIsPlayingRussianRoulette) then
			{
				"show" call RRPClient_system_createCursor;
			};
		};
		case "HideWeapon":
		{
			if (currentWeapon player isNotEqualTo "") then {
				life_curWep_h = currentWeapon player;
				player action ["SwitchWeapon",player,player,100];
				player switchCamera cameraView;
			};
			if(!isNil "life_curWep_h" && {(currentWeapon player isNotEqualTo "")} && {life_curWep_h in [primaryWeapon player,handgunWeapon player,secondaryWeapon player]}) then
			{
				player selectWeapon life_curWep_h;
			};
		};
		case "PlaceItems":
		{
			if (!dialog) then
			{
				if ((player call getSide in ["cop"] && {('cop' call RRPClient_groups_getSideLevel) > 4}) OR {(player call getSide in ["med"] && {('med' call RRPClient_groups_getSideLevel) > 1})} OR {(player call getSide in ["civ"] && license_press)}) then
				{
					[] spawn RRPClient_placeables_openMenu;
				};
			};
		};
		case "Restrain":
		{
			switch(true) do
			{
				case (EQUAL(player call getSide,"cop")): {
					if(!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1}) then {
						[_cursorTarget] spawn RRPClient_system_restrainAction;
					};
				};

				case (EQUAL(player call getSide,"med") && { ('med' call RRPClient_groups_getSideLevel) > 3 }): {
					if (!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1}) then {
						[_cursorTarget] spawn RRPClient_system_restrainAction;
					};
				};

				case (player call getSide in ["civ","reb"]): {
					if(!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1} && {(_cursorTarget GVAR ["knoked",false]) OR (_cursorTarget GVAR ["tazed",false]) OR (_cursorTarget GVAR ["surrender",false])}) then
					{
						if (["cuffCourier"] call perk) exitWith {[_cursorTarget] spawn RRPClient_system_restrainAction};
						if (["extItem_ducttape"] call RRPClient_system_removeItem) then {
							[_cursorTarget] spawn RRPClient_system_restrainAction;
						} else {
							["Вам нечем связать свою жертву. Попробуйте клейкую ленту, к примеру..."] call hints;
						};
					};
				};
			};
		};
		case "Knockout":
		{
			if (!isNull _cursorTarget && {!RRPClientIsPlayingRussianRoulette} && {!(EQUAL(player call getSide,"med"))} && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 4} && {speed _cursorTarget < 1}) then
			{
				if (!(_cursorTarget GVAR ["knoked",false]) && (EQUAL(CURWEAPON,RIFLE) OR EQUAL(CURWEAPON,PISTOL)) && !(EQUAL(CURWEAPON,"")) && !life_knockout) then
				{
					[_cursorTarget] spawn RRPClient_system_knockoutAction;
				};
			};
		};
		/*
		case "Trunk":
		{
			[] spawn RRPClient_system_openInventory;
		};
		*/
		case "Radar":
		{
			call RRPClient_system_radar
		};
		case "Tablet":
		{
			if (!dialog) then
			{
				[true] spawn RRPClient_tablet_open;
			};
		};
		case "Siren":
		{
			if(player call getSide in ["cop","med"] && {!(NOTINVEH(player))} && {EQUAL((driver objectParent player),player)} && {!life_siren_active}) then
			{
				[] spawn {
					life_siren_active = true;
					uiSleep 3;
					life_siren_active = false;
				};
				_veh = objectParent player;
				if (_veh GVAR ["siren",false]) then	{
					titleText ["Вы выключили сирену", "PLAIN"];
					[_veh,"siren"] call RRPClient_system_clearGlobalVar;
				} else {
					_veh SVAR ["siren",true,true];
					titleText ["Вы включили сирену", "PLAIN"];
					if (EQUAL(player call getSide,"cop")) then {
						[_veh] remoteExec ["RRPClient_system_copSiren",RCLIENT];
					} else {
						[_veh] remoteExec ["RRPClient_system_medicSiren",RCLIENT];
					};
				};
			};
		};
		case "OpenDoors":
		{
			private["_pkpz_kavala","_pkpz_atira","_locked_kpz"];
			_pkpz_kavala = nearestObject [[3295.19,12435.9,0],"Land_Cargo_House_V1_F"];
			_pkpz_atira = nearestObject [[15273.9,17444.2,0],"Land_Cargo_House_V1_F"];

			if(_cursorTarget in [_pkpz_kavala,_pkpz_atira] && {player distance _cursorTarget < 10} && {EQUAL(player call getSide,"cop")}) exitWith {
				_locked_kpz = _cursorTarget GVAR [format["bis_disabled_Door_1"],0];

				if(_locked_kpz == 0) then {
					_cursorTarget SVAR ["bis_disabled_Door_1",1,true];
					_cursorTarget animate [format["door_1_rot"],0];
					"КПЗ заркыто" call chat;
				} else {
					_cursorTarget SVAR ["bis_disabled_Door_1",0,true];
					_cursorTarget animate [format["door_1_rot"],1];
					"КПЗ открыто" call chat;
				};
			};

			_veh = if(NOTINVEH(player)) then {_cursorTarget} else {objectParent player};

			if(_veh isKindOf "House_F") then
			{
				if((_veh in life_vehicles OR _veh in life_tempHouses) && player distance _veh < 15) then
				{
					private _door = [_veh] call RRPClient_system_nearestDoor;
					if(EQUAL(_door,0)) exitWith {
						["Вы не рядом с дверью!"] call hints;
					};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];
					if(EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						"Вы закрыли входную дверь." call chat;
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						"Вы открыли входную дверь." call chat;
						if (_veh getVariable ["PayTimeDude",false]) then {["WarningTitleAndText", ["Внимание!", "Пришло время оплатить коммунальные услуги!"]] call SmartClient_gui_toaster_addTemplateToast;};
					};
				};
			} else {
				_locked = locked _veh;
				if(((_veh in life_vehicles) OR (player call getSide in ["cop","med"] AND (getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _veh >> "isCop") isEqualTo 1))) && {player distance _veh < 8}) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							[_veh,0] call RRPClient_system_lockVehicle;
						} else {
							[_veh,0] remoteExecCall ["RRPClient_system_lockVehicle",_veh];
						};
						"Вы открыли свой транспорт." call chat;
						player say3D "unlock";
					} else {
						if(local _veh) then {
							[_veh,2] call RRPClient_system_lockVehicle;
						} else {
							[_veh,2] remoteExecCall ["RRPClient_system_lockVehicle",_veh];
						};
						"Вы закрыли свой транспорт." call chat;
						player say3D "car_lock";
					};
				};
			};
		};
		case "Surrender":
		{
			if (NOTINVEH(player) && {!life_action_inUse} && {isNull life_DraggedBody} && {!RRPClientIsPlayingRussianRoulette}) then {
				if (player GVAR ["surrender",false]) then {
					[player,"surrender"] call RRPClient_system_clearGlobalVar;
					"Вы опустили руки" call chat;
				} else {
					[] spawn RRPClient_system_surrender;
					["terpila",1] call RRPClient_ach_gateway;
					"Вы сдались и закинули руки за голову! Нажмите Shift+V, чтобы опустить руки." call chat;
				};
			};
		};
		case "DanceMenu":
		{
			if (NOTINVEH(player) && {!dialog} && {!life_is_arrested} && {isNull life_DraggedBody} && {!RRPClientIsPlayingRussianRoulette}) then {
				["animation"] call RRPClient_system_interactionWinKey;
			};
		};
		case "WarZone":
		{
			if ([getText(getMissionConfig "CfgWarZone" >> "condition")] call RRPClient_util_conditionsCheck) then
			{
				call RRPClient_WarZone_initControls;
			};
		};
		case "TargetMenu":
		{
			if(!dialog && {('cop' call RRPClient_groups_getSideLevel) > 1}) then
			{
				[] spawn RRPClient_message_copToTargetMenu;
			};
		};
		case "VolumeUp":
		{
			0.1 call RRPClient_system_fadeSound;
		};
		case "VolumeDown":
		{
			-0.1 call RRPClient_system_fadeSound;
		};
		case "Phone":
		{
			if (!dialog) then
			{
				[0] spawn RRPClient_system_OpenPhone;
			};
		};
		case "Phone911":
		{
			if (!dialog) then
			{
				[1] spawn RRPClient_system_OpenPhone;
			};
		};
	};
}else{
	switch (_func) do
	{
		case "Beginner":
		{
			if (isNull (findDisplay 1000)) then {call RRPClient_forBeginner_openMenu};
		};
		case "PingMarker":
		{
			if !(RRPClientPartyID isEqualTo "") then
			{
				if !(player getVariable ["restrained",false]) then
				{
					["place"] call RRPClient_party_pingActions;
				};
			};
		};
		case "WinAction":
		{
			"hide" call RRPClient_system_createCursor;
			if(!life_action_inUse) then
			{
				_cursorTarget spawn
				{
					private _handle = [_this] spawn RRPClient_system_actionKeyHandler;
					waitUntil {scriptDone _handle};
					life_action_inUse = false;
				};
			};
		};
		case "PullFlags":
		{
			call RRPClient_groups_pullFlag;
		};
		case "EMS_beacons":
		{
			if ((('med' call RRPClient_groups_getSideLevel) > 0) AND {!((vehicle player) isEqualTo player)}) then
			{
				private _vehicle = (vehicle player);
				if (_vehicle getVariable ["EMS_beacons",false]) then {
					_vehicle setVariable ["EMS_beacons",false,true];
				} else {
					_vehicle setVariable ["EMS_beacons",true,true];
					[_vehicle] spawn RRPClient_system_medicLights;
				};
			};
		};
	};
};
true
