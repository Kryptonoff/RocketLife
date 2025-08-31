/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
*/
private ["_display","_type","_show","_indicatorsIDC","_group"];
_type = param [0,"",[""]];
_show = param [1,false,[false]];
if (_type in RRPClientHUDIndicators AND _show) Exitwith {};



_display = uiNamespace getVariable ["playerHUD",displayNull];
_group = _display displayCtrl 23000;
_indicatorsIDC = [23015, 23016, 23017, 23018, 23019, 23020, 23021];

if (_show) then {

    private _img = switch (_type) do {
        case ("inSZ"): {"RRPicon_savezone"};
        case ("inNZ"): {"RRPicon_neutralzone"};
        case ("inFarmZone"): {"RRPicon_workzone"};
        case ("beginner"): {"RRPicon_son"};
        case ("onlyPistols"): {"RRPicon_pistolzone"};
        case ("inDZ"): {"RRPicon_deadzone"};
        case "test": {"bar2"};
        case "test1": {"bar2"};
        case "test2": {"bar2"};
        case "test3": {"bar2"};
        case "test4": {"bar2"};
        case "test5": {"bar2"};
        case "test6": {"bar2"};
        default {
            ""
        };
    };

    {
        if (_x isEqualto "") exitWith {
            _group controlsGroupCtrl (_indicatorsIDC # _foreachIndex) ctrlSetText format["\RRP_icons\miner\%1.paa",_img];
            RRPClientHUDIndicators set [_foreachIndex,_type];
        };
    } forEach RRPClientHUDIndicators;
} else {
    {
        if (_x isEqualto _type) exitWith {
            _group controlsGroupCtrl (_indicatorsIDC # _foreachIndex) ctrlSetText "";
            RRPClientHUDIndicators set [_foreachIndex,""];
        };
    } forEach RRPClientHUDIndicators;
};