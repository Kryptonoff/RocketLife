RRPClient_resource_capture_Manage = {
try
{
	if (RRPClientGroupInfo isEqualTo []) throw "У вас нет доступа";
	if !("captureMenu" call RRPClient_groups_util_permCheck) throw "У вас нет доступа";
	private _display = uiNamespace getVariable ["RRPDialogResCapture",displayNull];
	if (isNull _display) throw "Ошибка #404";
	private _list = _display displayCtrl 4501;
	private _value = _list lbValue (lbCurSel 4501);
	if (_value isEqualTo -1) throw "Ошибка #405";
	private _data = enabledCaptures select _value;
	_data params ["_objectString","_procName","_groupOwner", ["_groupName",""],"_earned","_applics","_nextBattle","_captured", "_applicantsNames","_applicantsIDs"];
	private _cost = _earned * 0.5;

	if ((RRPClientGroupInfo get "name") in _applicantsIDs) then 
	{
		[
			_display,
			{
				params ["_object","_cost"];
				// [[false,_object,_cost],"resource_capture_manageApplicants"] call RRPClient_system_hcExec;
				[false,_object,_cost] remoteExecCall ["RRPServer_resource_capture_manageApplicants",2];
			},[_objectString,_cost],
			"Отказаться от битвы?",
			format["Вы хотите отказаться от боя за %2? Внесенные ранее средства возвращены не будут!",[_cost] call RRPClient_util_numberText,_procName]
		] call RRPClient_util_prompt;
	}else{
		[
			_display,
			{
				params ["_object","_cost"];
				if ((RRPClientGroupInfo get "bank") < _cost) throw "На счету организации недостаточно средств";
				// [[true,_object],"resource_capture_manageApplicants"] call RRPClient_system_hcExec;
				[true,_object] remoteExecCall ["RRPServer_resource_capture_manageApplicants",2];
			},[_objectString,_cost],
			"Записаться на битву?",
			format["Вы хотите записаться на бой за %2? Стоимость участия составляет %1. Средства будут списаны со счета организации, взнос невозможно будет вернуть!",[_cost] call RRPClient_util_numberText,_procName]
		] call RRPClient_util_prompt;
	};


}catch{
	["ErrorTitleAndText",["Битва за ресурс",_exception]] call SmartClient_gui_toaster_addTemplateToast;
}; 
true
}