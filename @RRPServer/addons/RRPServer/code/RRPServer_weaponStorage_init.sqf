/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private _storages = "initWeaponStorages" call RRPServer_DB_selectFull;
{
    _x params ["_id", "_balance", "_license", "_toolboxs", "_pos", "_dir", "_up", "_soldAmount","_name"];
    private _obj = createVehicle ["bv_terminal_weapon", (parseSimpleArray _pos), [], 0, "CAN_COLLIDE"];
    //_obj setVectorDirAndUp [parseSimpleArray _dir,parseSimpleArray _up];
    _obj setVariable ["id", _id, true];
    _obj setVariable ["balance", _balance, true];
    _obj setVariable ["toolboxs", (parseSimpleArray _toolboxs), true];
    _obj setVariable ["soldAmount", (parseSimpleArray _soldAmount), true];
    _obj setVariable ["licenseStorage", _license, true];
    _obj setVariable ["displayName", _name, true];
} forEach _storages;

"Weapons storage loaded..." call RRPServer_util_debugConsole;
true
