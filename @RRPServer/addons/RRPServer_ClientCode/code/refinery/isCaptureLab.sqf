/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_refLicense","_ref"];
_refLicense = (missionNamespace getVariable (format ["ref%1_control",_this]))  getVariable ['ref_license',""];
_ref = if (_refLicense isEqualTo "") then {false} else {(missionNamespace getVariable [format ["license_%1",_refLicense],false])};
_ref
