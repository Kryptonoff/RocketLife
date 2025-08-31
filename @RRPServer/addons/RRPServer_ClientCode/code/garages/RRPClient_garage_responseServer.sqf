/**
All private functions can be throwed
*/

private ["_retrieve", "_sell", "_setPlate", "_closedialog", "_store"];

params ["_mode"];

_store = {
    private _response = param [1, "", [""]];
    ["SuccessTitleandtext", ["Гараж", _response]] call SmartClient_gui_toaster_addTemplatetoast;
    RRPClientAtmWaitingResponse = false;
    call _closedialog;
};

_retrieve = {
    if !(canSuspend) exitwith {
        _this spawn RRPClient_garage_responseServer
    };
    params ["", "_bool", ["_id", -1, ["", 0]], ["_query", []]];
    
    if !(_bool) throw _id;
    if (_query isEqualto []) throw "Данные об авто повреждены";
    
    _query params [
        ["_classname", ""],
        ["_pid", ""],
        "_alive",
        "_active",
        "_insure",
        ["_plate", "OYWEY" ],
        ["_color", "default" ],
        ["_material", "default" ],
        ["_inventory", [[], 0] ],
        ["_gear", [] ],
        ["_fuel", 1 ],
        ["_damage", 0 ],
        ["_hitpoints", [] ],
        ["_tuning_data", [] ],
        "",
        ["_baseprice", 0 ],
        ["_distance", 0 ]
    ];
    
    if !(_pid isEqualto (getplayerUID player)) throw "Что за нипонятки то такие???";
    _display = uiNamespace getVariable ["RRPdialogGarage", displayNull];
    if (isNull _display) throw "Что то пошло не так, попробуйте еще раз";
    
    _spname = if (life_garage_sp isEqualtype []) then {
        life_garage_sp select 0
    } else {
        getmarkerPos life_garage_sp
    };
    _dir = if (life_garage_sp isEqualtype []) then {
        life_garage_sp select 1
    } else {
        markerDir life_garage_sp
    };
    
    _keymode = (lbValue[27008, lbCurSel 27008]);
    if (life_garage_sp isEqualtype "") then {
        if (isClass (missionConfigFile >> "LifeCfgGarages" >> toLower worldName >> life_garage_sp)) then {
            _check = getArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> life_garage_sp >> "position");
            if !(_check isEqualto []) then
            {
                _spname = getArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> life_garage_sp >> "position") select 0;
                _dir = getArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> life_garage_sp >> "position") select 1;
            };
        };
    };
    ["SuccessTitleandtext", ["Гараж", "Ваша техника выгружается..."]] call SmartClient_gui_toaster_addTemplatetoast;
    call _closedialog;
    private _vehicle = [_classname, _spname, _dir, true] call RRPClient_system_createSafetyvehicle;
    waitUntil {
        !isnil "_vehicle" && {
            !isNull _vehicle
        }
    };
    waitUntil {
        (local _vehicle)
    };
    
    [_vehicle, _fuel] remoteExecCall ["RRPClient_system_setFuel", _vehicle];
    [_vehicle, _plate] remoteExecCall ["RRPClient_system_setPlateNumber", _vehicle];
    
    if !((_inventory select 0) isEqualto []) then {
        [_vehicle, "Trunk", _inventory] call CBA_fnc_setVarNet
    };
    _vehicle setVariable ["RRPDatabaseID", _id, true];
    [_vehicle, "vehicle_info_vid", round(random(999999))] call CBA_fnc_setVarNet;
    [_vehicle, "dbinfo", [getplayerUID player, _plate]] call CBA_fnc_setVarNet;
    [_vehicle, "vehicle_info_owners", [[getplayerUID player, player call getNickname]]] call CBA_fnc_setVarNet;
    [_vehicle, "insPrice", _baseprice] call CBA_fnc_setVarNet;
    [_vehicle, "alldistance", _distance] call CBA_fnc_setVarNet;
    
    player reveal _vehicle;
    life_vehicles pushBack _vehicle;
    
    switch _keymode do
    {
        case 1: {
            {
                [[getplayerUID _x, _vehicle, 1], "system_keyManagement"] call RRPClient_system_hcexec;
                _vehicle remoteExecCall ["RRPClient_util_push_lifevehicles", _x];
            }forEach units (group player);
        };
        case 2: {
            {
                [[getplayerUID _x, _vehicle, 1], "system_keyManagement"] call RRPClient_system_hcexec;
                _vehicle remoteExecCall ["RRPClient_util_push_lifevehicles", _x];
            }forEach (RRPClientgroupinfo call RRPClient_groups_getmembers);
        };
        case 3: {
            {
                [[getplayerUID _x, _vehicle, 1], "system_keyManagement"] call RRPClient_system_hcexec;
                _vehicle remoteExecCall ["RRPClient_util_push_lifevehicles", _x];
            }forEach units (group player);
            
            {
                [[getplayerUID _x, _vehicle, 1], "system_keyManagement"] call RRPClient_system_hcexec;
                _vehicle remoteExecCall ["RRPClient_util_push_lifevehicles", _x];
            }forEach (RRPClientgroupinfo call RRPClient_groups_getmembers);
        };
        default {
            [[getplayerUID player, _vehicle, 1], "system_keyManagement"] call RRPClient_system_hcexec;
        };
    };
    
    if !(_color isEqualto "") then {
        [_vehicle, _color] call RRPClient_system_colorvehicle
    };
    if !(_material isEqualto "") then {
        [_vehicle, _material] call RRPClient_system_materialvehicle
    };
    
    _vehicle lock 2;
    _vehicle disableTIEquipment true;
    _vehicle enableRopeAttach (if (getNumber(missionConfigFile >> "LifeCfgvehicles" >> _classname >> "enableRopeAttach") isEqualto 1) then {
        true
    } else {
        false
    });
    
    clearBackpackCargoGlobal _vehicle;
    clearitemCargoGlobal _vehicle;
    clearmagazineCargoGlobal _vehicle;
    clearweaponCargoGlobal _vehicle;
    
    [_vehicle] spawn RRPClient_system_vehicleanimate;
    [_vehicle, _tuning_data] call RRPClient_adac_setup;
    [_vehicle] call RRPClient_system_vehsetupradio;
    [_vehicle] call RRPClient_system_trunkCheck;
    [_vehicle] call RRPClient_system_clearvehicleammo;
    [_vehicle] call RRPClient_system_clearvehicleTrunk;
    [_vehicle] call RRPClient_system_clearvehiclesensors;
    
    private _animationlist = getArray(missionConfigFile >> "LifeCfgvehicles" >> typeOf _vehicle >> "animationlist");
    [
        _vehicle,
        nil,
        if (_animationlist isEqualto []) then {
            false
        } else {
            _animationlist
        }
    ] call BIS_fnc_initvehicle;
    
    private ["_weaponcount", "_magazinecount", "_itemcount", "_backpackcount", "_itemData"];
    if !(_gear isEqualto []) then
    {
        {
            if !(_x isEqualto []) exitwith {};
            _x params ["_weapons", "_magazines", "_items", "_backpacks"];
            {
                _itemData = [_x] call RRPClient_util_itemDetails;
                if !(_itemData isEqualto []) then
                {
                    _weaponcount = (_weapons select 1) select _forEachindex;
                    _vehicle addweaponCargoGlobal [_x, _weaponcount];
                };
            } forEach (_weapons select 0);
            
            {
                _itemData = [_x] call RRPClient_util_itemDetails;
                if !(_itemData isEqualto []) then
                {
                    _magazinecount = (_magazines select 1) select _forEachindex;
                    _vehicle addmagazineCargoGlobal [_x, _magazinecount];
                };
            } forEach (_magazines select 0);
            
            {
                _itemData = [_x] call RRPClient_util_itemDetails;
                if !(_itemData isEqualto []) then
                {
                    _itemcount = (_items select 1) select _forEachindex;
                    _vehicle additemCargoGlobal [_x, _itemcount];
                };
            } forEach (_items select 0);
            
            {
                _itemData = [_x] call RRPClient_util_itemDetails;
                if !(_itemData isEqualto []) then
                {
                    _backpackcount = (_backpacks select 1) select _forEachindex;
                    _vehicle addbackpackCargoGlobal [_x, _backpackcount];
                };
            } forEach (_backpacks select 0);
        } forEach _gear;
    };
    
    [(netId _vehicle)] remoteExecCall ["RRPServer_event_vehicleMsnHandlers", 2];
    waitUntil {
        !(local _vehicle)
    };
    
    if (_classname isKindOf "Ship") then {
        _vehicle setPosASL _spname;
    } else {
        _vehicle setPosATL _spname;
    };
    player moveInDriver _vehicle;
    ["SuccessTitleandtext", ["Гараж", "Ваша техника готова"]] call SmartClient_gui_toaster_addTemplatetoast;
    
    RRPClientAtmWaitingResponse = false;
};

_sell = {
    call _closedialog;
    params ["", "_bool", "_text"];
    if !(_bool) throw _text;
    ["SuccessTitleandtext", ["Гараж", _text]] call SmartClient_gui_toaster_addTemplatetoast;
};

_setPlate = {
    private _response = param [1, "", [""]];
    ["SuccessTitleandtext", ["Гараж", _response]] call SmartClient_gui_toaster_addTemplatetoast;
    ["plate", 1] call RRPClient_ach_gateway;
    RRPClientAtmWaitingResponse = false;
    call _closedialog;
};

_closedialog = {
    if !(isNull (uiNamespace getVariable ["RRPdialogGarage", displayNull])) then
    {
        closedialog 0;
    };
};

try
{
    switch _mode do
    {
        case "sell": _sell;
        case "retrieve": _retrieve;
        case "setPlate": _setPlate;
        case "store": _store;
        default {
            throw "Чего чего чего?"
        };
    };
}catch{
    call _closedialog;
    RRPClientAtmWaitingResponse = false;
    ["ErrorTitleandtext", ["Гараж", _exception]] call SmartClient_gui_toaster_addTemplatetoast;
};
true