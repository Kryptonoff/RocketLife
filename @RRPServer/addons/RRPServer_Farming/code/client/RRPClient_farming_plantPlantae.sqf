/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_plantPlantae.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
try {
	if (life_action_inUse OR life_action_gathering) throw "Вы заняты";

	life_currentSeed = param [0,"",[""]];
	if (life_currentSeed isEqualTo "") throw "Не выбрали семена";
	if !(isNull objectParent player) throw "Вы не можете заниматься этим находясь в транспорте!";

	private _weaponNeed = getText(missionConfigFile >> "LifeCfgFarming" >> life_currentSeed >> "tool");
	if ((_weaponNeed isEqualTo "") && {!((currentWeapon player) isEqualTo "")}) throw "Освободите руки!";
	if ((!(_weaponNeed isEqualTo "")) && {!((currentWeapon player) isEqualTo _weaponNeed)}) throw "Для посадки этих семян нужен специальный инструмент!";

	private _conditions = getText(missionConfigFile >> "LifeCfgFarming" >> life_currentSeed >> "conditions");
	if !([_conditions] call condition) throw getText(missionConfigFile >> "LifeCfgFarming" >> life_currentSeed >> "conditionsMessage");
	 
	if !(isNull life_previewPlant) throw "В данный момент вы не можете заниматься посадкой!";

	private _model = getText(missionConfigFile >> "LifeCfgFarming" >> life_currentSeed >> "model");
	life_previewPlant = _model createVehicleLocal [0,0,0];
	life_previewPlant attachTo [player,[0, 1.1, 0.65]];
	life_currentPreviewState = false;
	hint parseText "<t color='#ffffff'>Нажмите [</t><t color='#ffcc00'>SPACE</t><t color='#ffffff'>] что бы посадить растение!<br/><t color='#ffffff'>Нажмите [</t><t color='#ffcc00'>ESC</t><t color='#ffffff'>] для отмены посадки!";
	INIT_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RRPClient_farming_KeyDown"];

	life_previewPlantPFH = [{
		params ["_positionStart", "_idPFH"];
		if (isNull life_previewPlant OR (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"])) exitWith {
			[_idPFH] call CBA_fnc_removePerFrameHandler;
			life_currentPreviewState = false;
			if !(isNil "INIT_KEY") then {
				(findDisplay 46) displayRemoveEventHandler["KeyDown", INIT_KEY];
				INIT_KEY = nil;
			};	
		};
		
		if ((player distance _positionStart) > 30) exitWith {
			[_idPFH] call CBA_fnc_removePerFrameHandler;
			detach life_previewPlant;
			deletevehicle life_previewPlant;
			//{detach _x; deletevehicle _x} forEach attachedObjects player;
			life_previewPlant = objNull;
			life_currentPreviewState = false;
			if !(isNil "INIT_KEY") then {
				(findDisplay 46) displayRemoveEventHandler["KeyDown", INIT_KEY];
				INIT_KEY = nil;
			};	
			["Растения", "Вы отошли слишком далеко"] call toastError;
		};

		private _check1 = (surfaceType position life_previewPlant) in life_farmGroundTypes;
		private _check2 = !((position life_previewPlant) isFlatEmpty [1, -1, -1, -1, -1, false, life_previewPlant] isEqualTo []);
		private _check3 = !(isOnRoad life_previewPlant);
		private _check4 = (call RRPClient_farming_checkZone);
		
		if (_check1 && {_check2} && {_check3} && {_check4}) then {
			if (!life_currentPreviewState) then {
				life_currentPreviewState = true;
				titleText ["Тут можно сажать", "PLAIN DOWN"];
			};
		} else {
			if (life_currentPreviewState) then {
				life_currentPreviewState = false;
				titleText ["Тут нельзя сажать", "PLAIN DOWN"];
			};
		};
	},0.1,position player] call CBA_fnc_addPerFrameHandler;
} catch {
	["Растения", _exception] call toastError;
};