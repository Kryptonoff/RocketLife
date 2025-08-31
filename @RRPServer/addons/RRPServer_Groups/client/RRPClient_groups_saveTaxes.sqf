
try{
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	_page = _display displayCtrl 1041;
	_taxList = _page controlsGroupCtrl 15001;
	if !("tax" call RRPClient_groups_util_permCheck) throw "У вас нет на это полномочий";

	private _toSave = createHashMap;
	{
		_taxName = _x getVariable ["taxName",""];
		if (_taxName isEqualTo "") then {continue};
		_taxValue = _x getVariable [_taxName,0];
		_toSave set [_taxName,_taxValue];
	} forEach (allControls _taxList);

	["saveTax",[_toSave]] call RRPClient_system_send;

}catch{
	["Организация",_exception] call toastError;
};
true
