/*
	Filename: 	RRPClient_system_setPlayerLicense.sqf
	Project: 	Rimas Altis Life RPG
*/
private ["_secondaryWeaponItem","_actionSound"];
params [
	["_unit",ObjNull,[ObjNull]],
	["_container",ObjNull,[ObjNull]],
	["_item","",[""]]
];

_actionSound = "click";
_secondaryWeaponItem = switch (_item) do {
    case ("MeleeHatchet"): {"Hatchet_Swing"};
		case ("MeleePickaxe"): {"Pickaxe_swing"};
		case ("MeleeKatana"): {"Katana_swing"};
		case ("Extremo_Tool_Shovel"): {"Extremo_Magazine_Swing"};
		case ("Extremo_Tool_Axe"): {"Extremo_Magazine_Swing"};
		default {""};
};
if !(_secondaryWeaponItem isEqualTo "") then {
	player addSecondaryWeaponItem _secondaryWeaponItem
};


//шмотки
if (isClass(missionConfigFile >> "clothing_settings" >> _item)) then {
	if !([getText(missionConfigFile >> "clothing_settings" >> _item >> "condition_use")] call RRPClient_util_conditionsCheck) then {
		["ErrorTitleAndText", ["Ошибка", "Вы не можете использовать данный предмет!"]] call SmartClient_gui_toaster_addTemplateToast;
		[_item] call RRPClient_system_removeItem;
	};
};


//Предметы
if (isClass(missionConfigFile >> "LifeCfgItems" >> _item)) then {
	if !([getText(missionConfigFile >> "LifeCfgItems" >> _item >> "condition_use")] call RRPClient_util_conditionsCheck) then {
		private ["_itemInfo","_text"];
		_itemInfo = [_item] call RRPClient_util_itemDetails;
		if ((_itemInfo # 4) isEqualTo "Weapon") then {
			_text = format ["%1 будет охолощен в ваших руках!",(_itemInfo # 1)];
		} else {
			_text =format ["%1 поврежден!",(_itemInfo # 1)];
			[_item] call RRPClient_system_removeItem;
		};
		["ErrorTitleAndText", ["Ошибка!", _text]] call SmartClient_gui_toaster_addTemplateToast;
		_actionSound = "3DEN_notificationWarning";
	};
};

if (box_work_port_active) exitWith {
		box_work_port_active = false;
		life_action_inUse = false;
		call RRPClient_system_stopEscortingAction;
		deleteVehicle port_box;
		[boxQuest] call BIS_fnc_deleteTask;
		["ErrorTitleAndText", ["Ошибка", "Ящик можно переносить только с свободными руками!"]] call SmartClient_gui_toaster_addTemplateToast;
};

playSound _actionSound;
call RRPClient_system_saveGear;
