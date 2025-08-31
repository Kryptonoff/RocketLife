params ["_house","_position","_cooldown"];
_house = param [0,objNull,[objNull]];
_position = param [1,[],[[]]];
_cooldown = param [2,20,[0]];

if (isNull _house) exitWith {};
if !((_house getVariable ["house_cooldown", serverTime]) <= serverTime) exitWith {};
if (_house getVariable ["lootSpawned", false]) exitWith {};

if (_position isEqualTo []) then {
    _position = [_house,0] call client_anomaly_lootPos;
} else {
    if (player distance _position < 500) then {
        life_anomalyArtefactArray pushBackUnique _house;
	};
};
if (player distance _position > 500) exitWith {};
if (_position isEqualTo []) exitWith {diag_log "client_anomaly_lootCreate: _position = []";};


private _containerClassName = "RRP_RZ_Container_2";

private _container = _containerClassName createVehicleLocal [0,0,0];
waitUntil {!isNil "_container" && {!isNull _container}};
_position set [2,_position select 2 - 0.25];
_container setPosATL _position;
_container allowDamage false;
_house setVariable ["lootSpawned",true];


if (anomalyDebug) then {
    private _marker1 = createMarkerLocal [str(_position),_position];
    _marker1 setMarkerShapeLocal "ICON";
    _marker1 setMarkerTypeLocal "hd_dot";
    _marker1 setMarkerTextLocal "Лут";
	_house setVariable ["anomaly_loot_marker",_marker1];
	_house setVariable ["anomaly_loot_contenter",_container];
};

_idAction = [_container,
"Покопаться в вещах",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
"!(call RRPClient_system_isInterrupted) && {_this distance _target < 3} && {isNull objectParent player} && {!life_action_inUse} && {isNull life_DraggedBody}",
"!(call RRPClient_system_isInterrupted) && {_caller distance _target < 3} && {isNull objectParent player} && {!life_action_inUse} && {player isEqualTo ((_arguments # 0) getVariable ['house_action',objNull])} && {((_arguments # 0) getVariable ['house_cooldown', serverTime]) <= serverTime}",
{
	_arguments params ["_house"];
    _house setVariable ["house_action", player, true];
},
{
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
},
{
	_arguments params ["_house","_containerClassName"];
    [_house,"house_cooldown",serverTime + (15 * 60)] call CBA_fnc_setVarNet;
    [_house,"house_action"] call RRPClient_system_clearGlobalVar;

    if (anomalyDebug) then {
        deleteMarkerLocal (_house getVariable "anomaly_loot_marker");
        _house setVariable ["anomaly_loot_marker",nil];
        _house setVariable ["anomaly_loot_contenter",nil];
    };


    private _targetPos = getPosATL _target;

    {
        if (_house isEqualTo (_x getVariable ["trunkAnchorTo",objNull])) then {
            deleteVehicle _x;
        };
    } forEach ((getPos _house) nearObjects ["Box_Wps_F",10]);
    _house setVariable ["lootSpawned",nil];
    deleteVehicle _target;

    private _container = "Box_Wps_F" createVehicle [0,0,0];
    _container setVariable ["trunkAnchorTo",_house, true];
    waitUntil {!isNull _container};
    _container setPosATL _targetPos;
    [_house,_container] call client_anomaly_lootAddBox;
    ["looter",1] call RRPClient_ach_gateway;

	player playActionNow "Stop";
},
{
    ["ErrorTitleAndText", ["Ошибка!", "Действие прервано!"]] call SmartClient_gui_toaster_addTemplateToast;
},
[_house,_containerClassName],
_cooldown,
16,
true,
false] call BIS_fnc_holdActionAdd;
