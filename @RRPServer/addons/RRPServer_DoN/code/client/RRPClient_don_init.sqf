
[cursorObject] call {
    if !(params [
        ["_machine", objNull, [objNull]]
    ]) exitwith {};
    
    if (count (playableunits select {
        (getplayerUID _x) isEqualto (_machine getVariable ["don_user", ""])
    }) <= 0) then
    {
        _machine setVariable ["don_user", "", true];
    };
    
    if (!(_machine getVariable ["don_user", ""] isEqualto "") &&
    !(_machine getVariable ["don_user", ""] isEqualto (getplayerUID player))) exitwith {
		["Все или ничего!", "That machine is already in use"] call toastError;
    };
    if ((_machine getVariable ["don_user", ""]) isEqualto "") exitwith {

		if(RRPClientAtmMoney < (getNumber (missionConfigFile >> "cfgdon" >> "betAmount"))) exitWith 
		{
			["Все или ничего!", "You do not have enough cash to do that!"] call toastError;
        };
        [player,"atm","take",(getNumber (missionConfigFile >> "cfgdon" >> "betAmount"))] remoteExecCall ["RRPServer_system_moneyChange",2];
        [_machine, player] remoteExecCall ["RRPServer_don_query", 2];
    };
    [_machine] call RRPClient_don_main;
};