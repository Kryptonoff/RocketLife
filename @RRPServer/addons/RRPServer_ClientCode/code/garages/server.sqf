lega_fnc_chopShop_handleServer={
    if!(params[["_type", "", [""]], ["_vehicle", objNull, [objNull]], ["_price", 0, [0]], ["_player", objNull, [objNull]]]) exitwith{};
    private _vehicle_data=_vehicle getVariable["dbinfo", []];private _caller=(playableunits select{
        (owner _x) isEqualto remoteExecutedOwner
    }) select 0;
    private _units=[];(_vehicle getVariable["vehicle_info_owners", []]) apply {
        private _data=_x;
        playableunits apply {
            if ((getplayerUID _x) isEqualto(_data select 0)) then {
                _units pushBack _x;
            };
        };
    };
    switch(_type) do {
        case"sell":{
            deletevehicle _vehicle;
            private _return=[format["UPdate vehicles set alive='0' WHERE pid='%1' and plate='%2'", (_vehicle_data select 0), (_vehicle_data select 1)], 1]call DB_fnc_asynccall;[[_vehicle], {
                life_vehicles=life_vehicles select{
                    !isNull _x
                };
            }]remoteExecCall["call", _units];
            [_price, {
                CASH=CASH+_this;
                ["ChopShops", (["sold", [_this]]call Lega_fnc_chopShop_getstring), [0, 1, 0, 1]]call Lega_fnc_sendMessage;
            }]remoteExecCall["call", _player];
        };
        case"removeowner":{
            _vehicle setVariable["vehicle_info_owners", nil, true];
            _vehicle setVariable["dbinfo", nil, true];private _return=[format["UPdate vehicles set pid='' WHERE pid='%1' and plate='%2'", (_vehicle_data select 0), (_vehicle_data select 1)], 1]call DB_fnc_asynccall;
            {
                life_vehicles=life_vehicles select {
                    !((_x getVariable["vehicle_info_owners", []]) findif{
                        (_x select 0) isEqualto(getplayerUID player)
                    }isEqualto-1)
                };
            }remoteExecCall["call", _units];
            [_price, {
                CASH=CASH-_this;
                ["ChopShops", (["removed", [_this]]call Lega_fnc_chopShop_getstring), [0, 1, 0, 1]]call Lega_fnc_sendMessage;
            }]remoteExecCall["call", _player];
        };
        case"claim":{
            _vehicle setVariable["vehicle_info_owners", [[(getplayerUID _player), (_player getVariable["realname", name _player])]], true];
            _vehicle setVariable["dbinfo", [getplayerUID _player, (_vehicle_data select 1)], true];private _return=[format["UPdate vehicles set pid='%3' WHERE pid='%1' and plate='%2'", (_vehicle_data select 0), (_vehicle_data select 1), (getplayerUID _caller)], 1]call DB_fnc_asynccall;{
                life_vehicles=life_vehicles select {
                    !((_x getVariable["vehicle_info_owners", []]) findif{
                        (_x select 0) isEqualto(getplayerUID player)
                    }isEqualto-1)
                };
            }remoteExecCall["call", _units];
            [_price, {
                CASH=CASH-_this;
                ["ChopShops", (["claimed", [_this]]call Lega_fnc_chopShop_getstring), [0, 1, 0, 1]]call Lega_fnc_sendMessage;
            }]remoteExecCall["call", _player];
        };
    };
};