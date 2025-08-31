
private _display = uiNamespace getVariable ["RRPDialogGarage",displayNull];
private _text_to_find = toLower (ctrlText (_this select 0));
private _group = _display displayCtrl 27001;
private _vehicleList = _group controlsGroupCtrl 27005;
forceUnicode 0;
if (_text_to_find isEqualTo "Быстрый поиск...") then {_text_to_find = ""};
if (_display getVariable ["last_search",""] isEqualTo _text_to_find) exitWith {};
_display setVariable ["last_search",_text_to_find];
lbClear _vehicleList;
{
	_x params ["_id","_classname","_plate"];
	if (
			((toLower _classname) find (toLower _text_to_find) > -1) or 
			{ (toLower _plate) find (toLower _text_to_find) > -1 } or 
			{ (toLower (([_classname] call RRPClient_util_fetchVehInfo) select 3)) find (toLower _text_to_find) > -1 } or 
			{ _text_to_find isEqualTo "" }
	)then {
		_vehicleInfo = [_classname] call RRPClient_util_fetchVehInfo;
		_index = _vehicleList lbAdd (_vehicleInfo select 3);
		_vehicleList lbSetTextRight [_index,_plate];
		_vehicleList lbSetValue [_index,_id];
		if (getNumber(getMissionConfig "LifeCfgVehicles" >> _classname >> "ignoreSlots") == 1) then 
		{
			_vehicleList lbSetPicture [_index,"\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\mp_serverlike_ca.paa"];
		};
	};
}forEach (_display getVariable ["search",[]]);