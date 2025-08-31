/*
	Project: Aurora Role Play
	Filename: RRPServer_farming_createPugalo.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
params [
	["_pugaloObj",objNull,[objNull]],
	["_playerUid","",[""]],
	["_pugaloPos",[],[[]]],
	["_pugaloClass","",[""]]
];

if (_playerUid isEqualTo "" || _pugaloClass isEqualTo "" || _pugaloPos isEqualTo []) exitWith {diag_log "Error Argument RRPServer_farming_createPugalo";};

private _days = getNumber(missionConfigFile >> "LifeCfgPugalo" >> _pugaloClass >> "days");
private _dateEnd = format["insertPugalo:%1:%2:%3:%4", _playerUid, _pugaloClass, _pugaloPos, _days] call RRPServer_DB_selectSingle;
[_pugaloObj, "dateEnd", _dateEnd] call CBA_fnc_setVarNet;
