params ["_mode"];

try
{
    switch (_mode) do
    {
        case "request_store": {
            
            params ["","_parameters"];
            private _object = _parameters param [0,false,[false,objNull]];
            private _type = _parameters param [2,"",["",[]]];
            _type = if (_type isEqualTo "") then {"Car"}else{_type};
            if (_object isEqualType objNull and {_type isEqualTo ""} or {_type isEqualTo []}) throw "Не определен тип гаража";
            
            {
                if (player distance2D getMarkerPos("war_marker_" + (str(_x#0))) < _x#1) throw "Гараж заблокирован так как находится в военном положении";
            } forEach RRPServerWarZones;

            
        	_object = [cursorObject,_object] select (_object isEqualType objNull);
            private _vehicles = [_object,_type] call RRPClient_garage_collectVehicles;

            if (_vehicles isEqualTo []) throw "Рядом с парковщиком нет вашей техники.";
            private _vehicles = _vehicles apply {netId _x};
            
            createDialog "RRPDialogGarageStore";
            private _display = uiNamespace getVariable ["RRPDialogGarageStore",displayNull];
            private _group = _display displayCtrl 27101;
            private _list = _group controlsGroupCtrl 27104;

            {
                _vehicle = objectFromNetId _x;
                if (isNull _vehicle or {!(_vehicle isKindOf _type)}) then {continue};

                _index = _list lbAdd (getText(configOf _vehicle >> "displayName"));
                _list lbSetTextRight [_index,((_vehicle getVariable ["dbInfo",[]]) select 1)];
                _list lbSetData [_index,_x];

            }forEach _vehicles;
            _list lbSetCurSel 0;
            _display setVariable ["position",getPosWorld _object];
            _display setVariable ["settings",_parameters];

        };
        case "request": {
            private _type = param [1,"",[""]];
            private _marker = param [2,"",[[],""]];
            private _isHouse = param [3,false];
            if (_type isEqualTo "") throw "Тип гаража не определен";
            if (life_jail_coin > 0) throw "У Вас есть долг перед государством, ваш счет временно заморожен в банке до окончания исправительных работ!";
            RRPClientGarageLoaded = false;
            life_garage_sp = _marker;
            life_garage_sp_name = if (_isHouse) then {"none"}else{_marker};
            life_garage_type = _type;
            life_garage_isHouse = _isHouse;

            [
                "Загрузка гаража",
                "Подождите пожалуйста...",
                [1,1,1,1],
                "\RRP_icons\NPC\RRP_Icon_Garage.paa",
                {RRPClientGarageLoaded},
                {},
                [],
                9999
            ] spawn RRPClient_gui_createLoadingScreen;
            [[_type],"garage_getVehicles"] call RRPClient_system_hcExec;
        };
        case "response": {
            private _response = param [1,[]];
            private _type = param [2,"",[[],""]];
            if (_response isEqualTo []) throw "У вас нет техники в гараже!";
            comment "_response params [
                id,
                classname, 
                color, 
                spname, 
                tuning_data, 
                insure, 
                baseprice, 
                material, 
                fuel, 
                parking, 
                plate, 
                distance, 
                damage,
                filled_trunk
            ]";
            _response = _response apply {
                [_x select 0,_x select [1,((count _x) -1)]]
            };

            createDialog "RRPDialogGarage";
            false call RRPClient_hud_show;
            private _display = uiNamespace getVariable ["RRPDialogGarage",displayNull];
            private _group = _display displayCtrl 27001;
            _display setVariable ["last_search",""];
            private _searchFilter = _display displayCtrl 27004;
            _searchFilter ctrlAddEventHandler["SetFocus", {["set_search_focus",_this select 0] call RRPClient_garage_actions}];
            _searchFilter ctrlAddEventHandler["KillFocus", {["kill_search_focus",_this select 0] call RRPClient_garage_actions}];
            _searchFilter ctrlAddEventHandler["Char", "_this call RRPClient_garage_finder"];
            private _vehicleList = _display displayCtrl 27005;
            private _keyCombo = _display displayCtrl 27008;

            private _progressFill = _group controlsGroupCtrl 27120;
            _progressFill ctrlSetBackgroundColor [0,0.92,0.99,0.8];
            _progressFill ctrlSetPositionW ( (((player getVariable ["CountVehicles",0]) / (call RRPClient_garage_limitMultiplier)) * 0.475) min 0.475);
            _progressFill ctrlCommit 0.1;
            private _progressFillText = _group controlsGroupCtrl 27121;
            _progressFillText ctrlSetStructuredText parseText (format [
                "<t align='left' shadow='2'>Заполненность гаража: </t><t align='right' shadow='2'>%1/%2</t>",
                player getVariable ["CountVehicles",0],
                call RRPClient_garage_limitMultiplier
            ]);

            {
                _x params ["_name","_value",["_condition",{true}]];
                if (call _condition) then 
                {
                    _index = _keyCombo lbAdd _name;
                    _keyCombo lbSetValue [_index,_value];
                };
            }forEach [
                ["Ключи только себе",0, {true}],
                ["Ключи всем в тусовке",1, {(count (units (group player)) > 1)}],
                ["Ключи всем в организации",2, {player getVariable ["GroupId",-1] isNotEqualTo -1}],
                ["Ключи всем в тусовке и организации",3, {player getVariable ["GroupId",-1] isNotEqualTo -1 and { (count (units (group player)) > 1)}}]
            ];
            _keyCombo lbSetCurSel 0;

            lbClear _vehicleList;
            private _hash = createHashMapFromArray _response; 
            _display setVariable ["search",_response apply {[(_x select 0),(_x select 1) select 0,(_x select 1) select 9]}];
            _display setVariable ["cache",_hash];
            _display setVariable ["marker",life_garage_sp];
            _tot = 0;
            reverse _response;
            {
                _x params ["_id","_data"];
                _data params ["_classname","_color","_spname","_tuning","_insure","_baseprice","_material","_fuel","_parking","_plate","_distance","_damage","_filled"];
                if !(isClass(configFile >> "CfgVehicles" >> _classname)) then 
                {
                    diag_log format ["Не найдена машина в аддоне %1",_classname];
                    continue;
                };
                _vehicleInfo = [_classname] call RRPClient_util_fetchVehInfo;
                _index = _vehicleList lbAdd (_vehicleInfo select 3);
                _vehicleList lbSetTextRight [_index,_plate];
                _vehicleList lbSetValue [_index,_id];
                switch (true) do
                {
                    case (_insure isEqualTo 2): 
                    {
                        _vehicleList lbSetPicture [_index,"\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_version_ca.paa"];
                    };
                    case (getNumber(getMissionConfig "LifeCfgVehicles" >> _classname >> "ignoreSlots") == 1): 
                    {
                        _vehicleList lbSetPicture [_index,"\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\mp_serverlike_ca.paa"];
                    };
                };
                _tot = _baseprice + _tot;
            }forEach _response;
            ["Land_TentHangar_V1_F",_display,life_garage_sp] call RRPClient_system_shopBoxCreate;

            _vehicleList lbSetCurSel 0;
            if (_tot > 10000000) then {["capital_2",1] call RRPClient_ach_gateway};
            if (_tot > 5000000) then{["capital_1",1] call RRPClient_ach_gateway};
            RRPClientGarageLoaded = true;
        };
        case "kill_search_focus": {
            private _ctrlSetFocus = param [1,controlNull];
            if ((ctrlText _ctrlSetFocus) isEqualTo "") exitWith
            {
                [_ctrlSetFocus] call RRPClient_garage_finder;
                _ctrlSetFocus ctrlSetText "Быстрый поиск...";
            };
        };
        case "set_search_focus": {
            private _ctrlSetFocus = param [1,controlNull];
            if ((ctrlText _ctrlSetFocus) isEqualTo "Быстрый поиск...") exitWith
            {
                _ctrlSetFocus ctrlSetText "";
            };
        };
        default{throw "ЧЕГО ЧЕГО ЧЕГО???"};
    };

}catch{
    RRPClientGarageLoaded = true;
    ["ErrorTitleAndText",["Гараж", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
