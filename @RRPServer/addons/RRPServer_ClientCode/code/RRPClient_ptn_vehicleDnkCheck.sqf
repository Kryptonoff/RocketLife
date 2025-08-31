private _classname = _this;
private _bool = true;
{
   if ((_x select 0) isEqualTo _classname) exitWith {
     _bool = call(compile(_x select 1));
   };
} forEach getArray(missionConfigFile >> "ptw" >> "vehicleDNKcheck");

_bool
