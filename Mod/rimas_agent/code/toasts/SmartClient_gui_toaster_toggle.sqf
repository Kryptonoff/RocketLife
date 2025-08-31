/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private["_show"];
_show = _this;
if (_show) then {
    if !(SmartClientToastAreaVisible) then {
        ("RscToastAreaLayer"
            call BIS_fnc_rscLayer) cutRsc["RscToastArea", "PLAIN", 0, true];
        SmartClientToastAreaVisible = true;
    };
} else {
    if (SmartClientToastAreaVisible) then {
        ("RscToastAreaLayer"
            call BIS_fnc_rscLayer) cutText["", "PLAIN"];
        SmartClientToastAreaVisible = false;
    };
};