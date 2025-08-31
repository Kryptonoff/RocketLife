/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

call RRPServer_refinery_produceOil;

private _queryResult = "initRefinery" call RRPServer_DB_selectFull;
diag_log format ["initRefinery: _queryResult = %1", _queryResult];
if (_queryResult isEqualTo []) exitWith {};

{
	_x params ["_id","_refinery_var", "_ref_name", "_owner_name", "_owner_id", "_oil","_item","_license"];

	private _refinery_control = missionNamespace getVariable [format["%1_control", _refinery_var], objNull];
	if (isNull _refinery_control) then {
		diag_log format ["[REFINERY] %1 isNull", _refinery_var];
	} else {
		_refinery_control setVariable ["ref_name", _ref_name, true];
		_refinery_control setVariable ["ref_gang_id", _owner_id, true];
		_refinery_control setVariable ["ref_gang_name", if (_owner_name isEqualTo "") then {"Нейтральная"} else {_owner_name}, true];
		_refinery_control setVariable ["ref_oil", _oil, true];
		_refinery_control setVariable ["ref_status", "Captured", true];
		_refinery_control setVariable ["ref_item", _item, true];
		_refinery_control setVariable ["ref_license", _license, true];
		_refinery_control setVariable ["ref_canCaptured", true, true];
		("other_" + _refinery_var) setMarkerText _ref_name;

		if !(_license isEqualTo "") then {
			[_refinery_var, _license] call RRPServer_refinery_setFlag;
		};
	};
} forEach _queryResult;
