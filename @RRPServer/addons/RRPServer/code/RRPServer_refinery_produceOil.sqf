/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

private _queryResult = "initRefineryUpdateOil" call RRPServer_DB_selectFull;
diag_log format ["OK RRPClient_refinery_produceOil: _queryResult = %1", _queryResult];
if (_queryResult isEqualTo []) exitWith {};

private _produceAmount = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_refinery_oilProduce");
{
	_x params ["_refinery_var", "_owner_id", "_amount"];
	if (_owner_id != -1) then {
		format["refineryUpdateOil:%1:%2",(_amount + _produceAmount), _refinery_var] call RRPServer_DB_fireAndForget;
	};
} forEach _queryResult;
