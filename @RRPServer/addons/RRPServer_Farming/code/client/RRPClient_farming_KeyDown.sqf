/*
    Project: Aurora Role Play
    Filename: RRPClient_farming_KeyDown.sqf
    Author: МишаняНуНихуяСебе
    License: CC BY-ND
*/
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];

if (_code == 1) exitWith {
    (findDisplay 46) displayRemoveEventHandler["KeyDown", INIT_KEY];
    detach life_previewPlant;
    deletevehicle life_previewPlant;
    life_previewPlant = ObjNull;
	INIT_KEY = nil;
    ["Растения", "Вы прервали действие"] call toastError;
    true
};

if (_code == 57) exitWith {
    if !(life_currentPreviewState) exitWith {["Растения", "Здесь не получится посадить растение"] call toastError};
    if !(isNull life_previewPlant) then {
        [] spawn RRPClient_farming_placePlant;
    };
	true;
};
    
false