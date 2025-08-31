private _object = param [0,objNull,[objNull]];
private _className = param [1,"",[""]];
private _radius = param [2,10,[0]];
if (isNull _object) exitWith {};

private _containerRemoveArray = (getPos _object) nearObjects [_className,_radius];
if !(_containerRemoveArray isEqualTo []) then {
	{
		deleteVehicle _x;
		if (anomalyDebug) then {deleteMarkerLocal str getPosATL _x};
	} forEach _containerRemoveArray;

	if (anomalyDebug) then {
	    _object setVariable ["anomaly_loot_marker",nil];
	    _object setVariable ["anomaly_loot_contenter",nil];
    };
};
