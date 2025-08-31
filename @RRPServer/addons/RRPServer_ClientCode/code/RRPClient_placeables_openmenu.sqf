/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/


disableSerialization;
createDialog "RRPDialogPlaceables";
waitUntil {!isNull (findDisplay 20000)};
private _ctrl = (findDisplay 20000) displayCtrl 20001;
lbClear _ctrl;

{
    if ([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then {
		_name = getText(_x >> "displayName");
	    _classname = getText(_x >> "classname");
	    private _index = _ctrl lbAdd format["%1",_name];
	    _ctrl lbSetData [_index,_classname];
    };
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPlaceables"));