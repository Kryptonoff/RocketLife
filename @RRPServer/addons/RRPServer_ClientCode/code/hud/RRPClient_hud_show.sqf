/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
*/


private _vanillaUi = {
    params ["_hide"];
    {
        if((ctrlIDD _x) in [300,303,305]) then 
        {
            if((ctrlIDD _x) isEqualTo 300) then 
            {
                private _ctrl = _x displayCtrl 2302;
                _ctrl ctrlSetFade _hide;
                _ctrl ctrlCommit 0;
                private _ctrl = _x displayCtrl 2303;
                _ctrl ctrlSetFade _hide;
                _ctrl ctrlCommit 0;
                private _ctrl = _x displayCtrl 168;
                _ctrl ctrlSetFade _hide;
                _ctrl ctrlCommit 0;
            } else {
                {
                    _x ctrlSetFade _hide;
                    _x ctrlCommit 0;
                } forEach(allControls _x);
            };
        };
    } forEach (uinamespace getvariable "IGUI_displays");
};

if (_this) then {
    if (isNull (uiNamespace getVariable ["playerHUD",displayNull])) then 
    {
        if (isNull LIFE_HANDLE_HUD) then {LIFE_HANDLE_HUD = [] spawn RRPClient_hud_init;};
        if (RRPClientPartyID isNotEqualTo "") then {

            call RRPClient_party_createPanel;
        };
        showHUD true;
        [0] spawn _vanillaUi;
    };
} else {

    showHUD false;
    call RRPClient_party_destroyPanel;
    terminate LIFE_HANDLE_HUD;
    ["RRPHUD"] call RRPClient_gui_DestroyRscLayer;
    [1] spawn _vanillaUi;
};
