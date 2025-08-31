_which = param [0,false,[false]];

if (_which) then {

    if (!RRPHC_enable) exitWith {diag_log "ERROR: Server is trying to give AI ownership to HC when RRPHC_enable is false";};
    {
        if (!(isPlayer _x)) then {
            _x setOwner HC_Life;  //Move agents over to HC
        };
    } forEach animals;

} else {

    if (RRPHC_enable) exitWith {diag_log "ERROR: Server is trying to give AI ownership to back to itself when RRPHC_enable is true";};
    {
        if (!(isPlayer _x)) then 
		{
            _x setOwner 2;
        };
    } forEach animals;
};
