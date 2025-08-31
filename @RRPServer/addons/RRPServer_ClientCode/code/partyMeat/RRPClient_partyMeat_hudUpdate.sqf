/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_display","_ctrlStrText"];
_display = uiNamespace getVariable ['party_meat_HUD',displayNull];
if (isNull _display) then {
    ['party_meat_HUD'] call RRPClient_gui_CreateRscLayer;
    _display = uiNamespace getVariable ['party_meat_HUD',displayNull];
};

if (_this) then {
    {
      [_display, _x, ctrlPosition _x, 0, 0.1] call RRPClient_gui_util_animateAllCtrl;
    } forEach allControls _display;
    _ctrlStrText = _display displayCtrl 94650;
    _ctrlStrText ctrlSetStructuredText parseText format["<t align = 'center' > Level: %1 | kills: %2 | death: %3 | Deposit: %4$</t>",
        player getVariable ["RRPVariablePartyMeatLvl",0],
        player getVariable ["RRPVariablePartyMeatKills",0],
        player getVariable ["RRPVariablePartyMeatDeaths",0],
        player getVariable ["RRPVariablePartyMeatDeposit",0]
    ];
} else {
    {
      [_display, _x, ctrlPosition _x, 1, 0.05] call RRPClient_gui_util_animateAllCtrl;
    } forEach allControls _display;
};
