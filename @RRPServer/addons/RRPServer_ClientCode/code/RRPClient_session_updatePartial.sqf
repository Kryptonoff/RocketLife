/*

	Filename: 	RRPClient_session_updatePartial.sqf
	Project: 	Rimas Altis Life RPG
	Web:		Rimas RP

*/
if (isNil "life_loading_completed") exitWith {};
if !(life_loading_completed) exitWith {};

private ["_mode","_packet","_array","_flag"];
_mode = param[0, 0, [0]];
_packet = [getPlayerUID player, player call getSide, nil, _mode];
_array = [];

//not used
//_flag = player call getSide;


switch (_mode) do {
    case 0:
        {
            _packet set [2, RRPClientCashMoney];
        };

    case 1:
        {
            _packet set [2, RRPClientAtmMoney];
        };

    case 2:
        {
            {
                if (missionNamespace getVariable[("license_" + getText(_x >> "variable")), false]) then {
                    _array pushBack configName _x;
                };
            } forEach("true" configClasses(missionConfigFile >> "LifeCfgLicenses"));
            _packet set [2, _array];
        };

    case 3:
        {
            _packet set [2, RRPClientCashMoneyD];
        };

    case 4:
        {
            _packet set [2, life_connected];
            _packet set [4, getPosATL player];
        };

    case 5:
        {
            _packet set [2, life_is_arrested];
            _packet set [4, life_jail_time];
        };
    case 8:
        {
            _packet set [2, life_slave];
        };
    case 13:
        {
            _packet set [2, ('civ' call RRPClient_groups_getSideLevel)];
        };
    case 14:
        {
            _packet set [2, ('reb' call RRPClient_groups_getSideLevel)];
        };
    case 15:
        {
            _packet set [2, life_firstTime];
        };
    case 17:
        {
            _packet set [2, ('cop' call RRPClient_groups_getSideLevel)];
        };
    case 18:
        {
            _packet set [2, life_karma];
        };
    case 19:
        {
            _packet set [2, ('med' call RRPClient_groups_getSideLevel)];
        };
    case 20:
        {
            _packet set [2, life_gear];
        };
    case 21:
        {
            _packet set [2, life_connected];
        };
    case 22:
        {
            {
                _array pushBack[_x, (missionNamespace getVariable _x)];
            }foreach life_indicators_array;

            _packet set [2, _array];
            _array = []; {
                _array pushBack[_x, (missionNamespace getVariable _x)];
            }foreach life_config_array;

            _packet set [4, _array];
        };
    case 23:
        {
            _packet set [2, RRPClientCredits];
        };

    case 24:
        {
            _packet set [2, life_reblevelCom];
        };

    case 25:
        {
            _packet set [2, life_jail_coin];
        };
};
[(_packet),"session_updatePartial"] call RRPClient_system_hcExec;
