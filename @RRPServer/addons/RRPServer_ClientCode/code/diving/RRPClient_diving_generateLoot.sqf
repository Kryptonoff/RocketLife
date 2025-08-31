/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_container","_lootArray","_lootArrayFiltred","_lootList"];
params ["_what","_pos"];
_container = "Box_Wps_F" createVehicle [0,0,0];
waitUntil {!isNull _container};

_container setPosWorld _pos;

_lootArray = getArray(missionConfigFile >> "cfgDiving" >> "items");
if (_what isEqualTo "illegalItems") then {
    _lootArray + (getArray(missionConfigFile >> "cfgDiving" >> "illegalItems"))
};


[
    _container,                                                                           
    "Открыть",                                                                       
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                     
    "_this distance _target < 10",                                                        
    "(_caller distance _target < 10)",                                                      
    {},                                                                                  
    {},                                                                                  
    {
    [_target] call RRPClient_inventory_open;
    },                                                
    {},                                                                                  
    [],                                                                              
    1,                                                                            
    0,                                                                          
    false,                                                                            
    false                                                                           
] call RRPClient_holdAction_Add;

private _amount = ceil(random 5);

_lootList = [];
for "_i" from 1 to _amount do {
    private _chanse = [[
         ["Legendary",5],
         ["Mythical",10],
         ["uncommon",15],
         ["rare",25],
         ["common",45]
    ]] call RRPClient_util_selectRandom;
    private _chanseItemsList = _lootArray select {(_x select 2) isEqualTo _chanse};
    _lootList pushBack (selectRandom _chanseItemsList);

};

{
    _x params ["_class","_mod","_chance"];
    if (_mod isEqualTo "virt") then {
        [_container,_class,1,true] call RRPClient_system_vehicleInv;
    } else {
        private ["_infoItems","_itemMag"];
        _infoItems = [_class] call RRPClient_util_itemDetails;
        if !(_infoItems isEqualTo []) then {
            [_class,_container] call RRPClient_system_addItemToBox;
        } else {
            private _error = format ["%1 не существует или опечатка в конфиге!", _class];
            diag_log _error; systemChat _error;
        }
    };
} forEach _lootList;

[_container] spawn {
    uiSleep 5;
    call RRPClient_diving_startAction;
    ["ErrorTitleAndText", ["Дайвинг", "Появилось новое место для исследования!"]] call SmartClient_gui_toaster_addTemplateToast;
    uiSleep 60; deleteVehicle (_this # 0);
};
