private _ret = false;
{
    private ["_refItem","_refLicense"];
    _refItem = _x getVariable ['ref_item',""];
    _refLicense = _x getVariable ['ref_license',""];
    if ((_this isEqualTo _refItem) and (missionNamespace getVariable [format ["license_%1",_refLicense],false])) exitWith {
        _ret = true;
    };
} forEach [ref1_control,ref2_control,ref3_control,ref4_control];

_ret
