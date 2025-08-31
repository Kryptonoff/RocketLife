
try
{
	if (RRPClientGroupInfo isEqualTo []) throw "У вас нет доступа";
	if !("captureMenu" call RRPClient_groups_util_permCheck) throw "У вас нет доступа";

	disableSerialization;
	createDialog "RRPDialogResCapture";
	private _display = uiNamespace getVariable ["RRPDialogResCapture",displayNull];
	private _list =_display displayCtrl 4501;
	ctrlShow[4505,("captureMenu" call RRPClient_groups_util_permCheck)];
	private _captures = enabledCaptures;
	lbClear _list;
	{
		_index = _list lbAdd format ["%1", _x select 1];
		_list lbSetValue [_index,_forEachIndex];
	} foreach _captures;
	_list lbSetCurSel 0;
}catch{
	["ErrorTitleAndText",["Битва за ресурс", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};

true
