/*
	Project: 	Rimas Role Play
	Author:		Arrra and Fairy Tale
	https://vk.com/id478482025
	https://vk.com/juba_johnson
*/
#include "..\script_macros.hpp"
switch (player call getSide) do
{
	case "civ":
	{
		//player addAction ["<img image='\rimas_pack\icons\ui\s_icon_passport.paa' /> Показать паспорт",RRPClient_system_showPassport,"",0,false,false,"",'!isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"} '];
		player addAction ["<img image='\rimas_pack\icons\ui\s_icon_key.paa' /> Сорвать тюремный номер с заключенного",RRPClient_system_removeLegcuffs,"",0,false,false,"",'!isNull cursorObject && {"extItem_prisonKey" in (magazines player)} && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {cursorObject getVariable ["isArrested",false]}'];
		player addAction ["<img image='\rimas_pack\icons\ui\s_icon_stop.paa' /> Требование об остановке",RRPClient_warning_requestOut,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 100 && ((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && alive cursorTarget && isPlayer (driver cursorTarget) && (vehicle player != player)'];
	};

	case "reb":
	{
		//player addAction ["<img image='\rimas_pack\icons\ui\s_icon_passport.paa' /> Показать паспорт",RRPClient_system_showPassport,"",0,false,false,"",' !isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"} '];
		player addAction ["<img image='\rimas_pack\icons\ui\s_icon_key.paa' /> Сорвать тюремный номер с заключенного",RRPClient_system_removeLegcuffs,"",0,false,false,"",'!isNull cursorObject && {"extItem_prisonKey" in (magazines player) }&& {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {cursorObject getVariable ["isArrested",false]}'];
		player addAction ["<img image='\rimas_pack\icons\ui\s_icon_stop.paa' /> Требование об остановке",RRPClient_warning_requestOut,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 100 && ((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && alive cursorTarget && isPlayer (driver cursorTarget) && (vehicle player != player)'];
	};

	case "cop":
	{
		//player addAction ["<img image='\rimas_pack\icons\ui\s_icon_passport.paa' /> Показать жетон",RRPClient_system_showPassport,"",0,false,false,"",'!isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"}'];
		player addAction ["Обыскать инвентарь",RRPClient_system_lootInvSearch,"",0,false,false,"",'!isNull cursorObject && {cursorObject distance player < 3} && {(typeOf cursorObject) == "Box_Wps_F"}'];
		player addAction ["Алкотест",{[player] remoteExecCall ["RRPClient_system_breathalyzer",cursorObject]},"",0,false,false,"",'!isNull cursorObject && {cursorObject distance player < 3} && {cursorObject getVariable ["restrained",false]} '];

		player addAction ["<t color='#96ff00'>Переместить</t>",{[player,cursorObject] spawn RRPClient_dragging_start},"",0,false,false,"",'
			!isNull cursorObject &&
			isNull objectParent player &&
			!life_barrier_active &&
			(cursorObject getVariable ["owner",""] isEqualTo (getPlayerUID player))'
		];
		player addAction ["<t color='#ff0000'>Удалить</t>",RRPClient_placeables_remove,"",0,false,false,"",'!isNull cursorObject && isNull objectParent player && !life_barrier_active && (cursorObject getVariable ["owner",""] isEqualTo (getPlayerUID player))'];
	};

	case "med":
	{
		//player addAction ["<img image='\rimas_pack\icons\ui\s_icon_passport.paa' /> Показать жетон",RRPClient_system_showPassport,"",0,false,false,"",'!isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"}'];
		player addAction ["Закопать грешника",{_this spawn RRPClient_dmg_HideBody;},"",0,false,false,"",'!isNull cursorObject && {player distance cursorObject < 3.5} && {!alive cursorObject} && {cursorObject isKindOf "Man"}'];
		player addAction ["<t color='#96ff00'>Переместить</t>",{[player,cursorObject] spawn RRPClient_dragging_start},"",0,false,false,"",'!isNull cursorObject && isNull objectParent player  && !life_barrier_active && (cursorObject getVariable ["owner",""] isEqualTo (getPlayerUID player))'];
		player addAction ["<t color='#ff0000'>Удалить</t>",RRPClient_placeables_remove,"",0,false,false,"",'!isNull cursorObject && isNull objectParent player  && !life_barrier_active && (cursorObject getVariable ["owner",""] isEqualTo (getPlayerUID player))'];

	};
};

player addAction["Запустить сбор урожая",{call RRPClient_farm_canRunCombain},"",0,false,false,"","(vehicle player != player) && (typeOf (vehicle player) == 'New_Holland_TC590_civ') && ((vehicle player) getVariable ['isRun',false])"];
player addAction["<img image='\rimas_pack\icons\ui\s_icon_stop.paa' /> Отменить эскорт",RRPClient_system_stopEscortingAction,"",0,false,false,"",'!box_work_port_active && {!(call RRPClient_util_attachedObjectsPlayer isEqualTo [])} && {(isNull objectParent player)} && {isNull life_DraggedBody} && {isNull life_dhl_box} && {isNull life_ds_box} && {isNull life_previewPlant}'];
// player addAction["<img image='\rimas_pack\icons\ui\s_icon_box.paa' /> Инвентарь",RRPClient_system_openInventory,"",0,false,false,"",'!isNull cursorObject && {cursorObject distance player < 3} && {(typeOf cursorObject) == "Box_Wps_F"} && {isNull objectParent player}'];
//player addAction["Посмотреть номер",RRPClient_system_seePlate,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 300 && ((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && alive cursorTarget'];
// player addAction["Закинуть сеть",{call RRPClient_farm_fishing},"",0,false,false,"",'!life_action_inUse and (surfaceisWater (getPos vehicle player)) and ((vehicle player isKindOf "Ship") or (typeOf(vehicle player) isEqualTo "d3s_uaz_3907"))'];
player addAction["ВКЛ спектральное устройсво",{call RRPClient_spectrDevice_setSettings; RRPClientSpectrDeviceEnable = true},"",0,false,false,"",'!RRPClientSpectrDeviceEnable AND (currentWeapon player) isEqualTo "hgun_esd_01_F"'];
// player addAction [format ["Предупредить %1",name cursorObject],{[cursorObject] call RRPClient_player_ugomonis},"",0,false,false,"","((call life_adminLevel) > 0) && !isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf 'Man'}"];


[
	player,
	"EMP",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",

	"(currentWeapon player isEqualTo 'hgun_esd_01_F') AND
	cursorObject isKindOf 'Car' AND
	(player distance cursorObject) < 300 AND
	(player weaponAccessories (currentWeapon player) select 0 isEqualTo 'muzzle_antenna_01_f') AND
	(player isEqualTo vehicle player) AND
	!(([player] call RRPClient_system_isSafeZone) # 0) AND
	!(([player] call RRPClient_system_isSafeZone) # 1)
	",

	"(currentWeapon player isEqualTo 'hgun_esd_01_F') AND
	cursorObject isKindOf 'Car' AND
	(player distance cursorObject) < 300 AND
	(player weaponAccessories (currentWeapon player) select 0 isEqualTo 'muzzle_antenna_01_f') AND
	(player isEqualTo vehicle player) AND
	!(([player] call RRPClient_system_isSafeZone) # 0) AND
	!(([player] call RRPClient_system_isSafeZone) # 1)
	",

	{},
	{playSound 'readoutClick'},
	{
		if (cursorObject getVariable ["empEffectActive",-1] < time) then {
			cursorObject setVariable ['empEffectActive', (time + getNumber(missionConfigFile >> "LifeCfgSettings" >> "empEffectTime")),true];
			cursorObject engineOn false;
		};

		{
				player removeHandgunItem _x;
		} forEach (player weaponAccessories (currentWeapon player));
		playSound "ZoomIn"
	},
	{},
	[],
	3,
	0,
	false,
	false
] call RRPClient_holdAction_Add;
