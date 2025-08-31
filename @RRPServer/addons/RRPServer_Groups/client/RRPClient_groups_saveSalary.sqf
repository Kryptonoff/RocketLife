
try{
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	_page = _display displayCtrl 1043;
	_salList = _page controlsGroupCtrl 16001;
	if !("salary" call RRPClient_groups_util_permCheck) throw "У вас нет на это полномочий";

	private _toSave = createHashMap;
	{
		_rankID = _x getVariable ["rankID",0];
		if (_rankID isEqualTo 0) then {
			continue
		};
		_salaryTime = _x getVariable ["salaryTime",0];

		_moneyEdit = _x controlsGroupCtrl 15206;
		_money = ctrlText _moneyEdit;
		if !([_money] call RRPClient_system_isnumber) throw format["Неверный формат зарплаты у ранга %1",_rankID];

		_enabledCheckBox = _x controlsGroupCtrl 15201;
		_toSave set [_rankID,[_salaryTime, parseNumber _money,cbChecked _enabledCheckBox]];
		
	} forEach (allControls _salList);
	["saveSalary",[_toSave]] call RRPClient_system_send;

}catch{
	["Организация",_exception] call toastError;
};
true
