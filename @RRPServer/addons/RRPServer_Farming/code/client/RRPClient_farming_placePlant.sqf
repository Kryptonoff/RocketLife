/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_placePlant.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
try {
	if (life_action_inUse OR life_action_gathering) throw "Вы заняты";
	//if (isNull life_previewPlant) exitWith {hint "Посадка растений в данном момент невозможна!"};
	//if (!life_currentPreviewState) exitWith {hint "Посадка растений в данном месте невозможна!"};

	private _tool = getText(missionConfigFile >> "LifeCfgFarming" >> life_currentSeed >> "tool");
	private _sleep = switch (_tool) do {
		case ("Extremo_Tool_Hoe") : {6.7};
		case ("Extremo_Tool_Shovel") : {8};
		default {5};
	};

	private _kneelWork = false;
	private _animation = switch (_tool) do {
		case ("Extremo_Tool_Hoe"): {"FT_Act_Dig_PickAxe_Loop_Full_3x"};
		case ("Extremo_Tool_Shovel"): {"FT_Act_Dig_Shovel_Loop_Full_3x"};
		default {_kneelWork = true; ""};
	};

	["Сажаем растение", 10, "", _animation, _kneelWork, {isNull life_previewPlant}] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
	if (isNull life_previewPlant) throw "Действие отменено";

	private _return = false;
	private _itemName = "";

	if (isClass (missionConfigFile >> "VirtualItems" >> life_currentSeed)) then {
		_itemName = getText(missionConfigFile >> "VirtualItems" >> life_currentSeed >> "displayName");
		_return = [false,life_currentSeed,1] call RRPClient_system_handleInv;
	} else {
		_itemName = life_currentSeed call RRPClient_inventory_getItemName;
		_return = [life_currentSeed] call RRPClient_system_removeItem;
	};

	if (!_return) throw "Что то пошло не так!";

	[player, call(life_donator), life_currentSeed, getPos life_previewPlant] remoteExecCall ["RRPServer_system_plantPlantae",2];

	detach life_previewPlant;
	deletevehicle life_previewPlant;
	life_previewPlant = objNull;
	(findDisplay 46) displayRemoveEventHandler["KeyDown", INIT_KEY];
	INIT_KEY = nil;
	hint ""
} catch {
	["Растения", _exception] call toastError;
}
