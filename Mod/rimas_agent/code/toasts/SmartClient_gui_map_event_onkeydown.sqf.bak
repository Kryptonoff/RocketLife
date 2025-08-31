/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private["_display", "_keyCode", "_shift", "_ctrl", "_alt", "_stopPropagation", "_map", "_waypointPosition"];
_display = _this select 0;
_keyCode = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_stopPropagation = false;
switch (_keyCode) do {
    case 0xD3:{
            if !(SmartClientWaypoints isEqualTo[]) then {
                _map = _display displayCtrl 51; 
                {
                    _waypointPosition = _map ctrlMapWorldToScreen _x;
                    if ((_waypointPosition distance2D getMousePosition) < (50 * pixelW)) then {
                        SmartClientWaypoints deleteAt _forEachIndex;
                        profileNamespace setVariable ["PRNS_Waypoints",SmartClientWaypoints];
                        _stopPropagation = true;
                    };
                }
                forEach SmartClientWaypoints;
            };
        };
};
_stopPropagation
