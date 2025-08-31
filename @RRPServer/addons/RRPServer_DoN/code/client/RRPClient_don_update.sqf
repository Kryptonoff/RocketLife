/*
author : itsleigham
description : updates the double or nothing machine
usage : [machine] spawn RRPClient_don_update;
*/

if !(params [
    ["_machine", objNull, [objNull]]
]) exitwith {};

private _dummy = "#particlesource" createvehiclelocal ASLtoAGL getPosWorld _machine;
switch (_machine getVariable ["multiplier", -1]) do
{
    case -1 :
    {
        _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\loss.jpg"];
        _dummy say3D ["doNXN", 1000, 1];
    };
    case 0 :
    {
        _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\WaitingX_01.jpg"];
    };
    case 10 :
    {
        private _start = floor diag_ticktime;
        private _machine = cursorObject;
        _dummy say3D ["doNXJ", 1000, 1];
        while {true} do {
            private _diff = (floor diag_ticktime) - _start;
            private _exit = false;
            
            switch (true) do
            {
                case (!(_machine getVariable ["multiplier", -1] isEqualto 10)) : {
                    _exit = true;
                };
                case (_diff isEqualto 0) : {
                    _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\jackpot\bs.jpg"]
                };
                case (_diff isEqualto 2) : {
                    _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\jackpot\dw.jpg"]
                };
                case (_diff isEqualto 4) : {
                    _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\jackpot\dw2.jpg"]
                };
                case (_diff isEqualto 6) : {
                    _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\jackpot\dw3.jpg"]
                };
                case (_diff isEqualto 8) : {
                    _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\jackpot\dw4.jpg"]
                };
                case (_diff isEqualto 10) : {
                    _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\jackpot\dw5.jpg"]
                };
                case (_diff isEqualto 12) : {
                    _machine setobjecttextureGlobal [0, "\rimas_agent\assets\don\jackpot\dw6.jpg"]
                };
                case (_diff >= 15) :
                {
                    sleep 0.5;
                    while {(_machine getVariable ["multiplier", -1] isEqualto 10) && (((floor diag_ticktime) - _start) < 60)} do {
                        for "_i" from 1 to 13 do
                        {
                            _machine setobjecttextureGlobal [0, format ["\rimas_agent\assets\don\jackpot\jp_%1.jpg", _i]];
                            sleep 0.05;
                        };
                    };
                };
            };
            sleep 1;
        };
    };
    default
    {
        _machine setobjecttextureGlobal [0, format ["\rimas_agent\assets\don\%1.jpg", (_machine getVariable ["multiplier", -1])]];
    };
};
deletevehicle _dummy;
_machine setVariable ["don_inprogress", false];