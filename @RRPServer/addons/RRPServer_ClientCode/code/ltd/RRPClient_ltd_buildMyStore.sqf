/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
try
{
	if (RRPClientCredits < 6600) throw "Для установки собственного магазина требуется 6600 RCredits";
	createDialog "RRPDialogPlaceStore";
	_display = uiNamespace getVariable ["RRPDialogPlaceStore",displayNull];
	_listBox = _display displayCtrl 9601;
	
	lbClear _listBox;
	{
		if ([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then 
		{
			_name = getText(_x >> "displayName");
			_classname = getText(_x >> "classname");
			_var = getText(_x >> "var");
			private _index = _listBox lbAdd format["%1",_name];
			_listBox lbSetData [_index,STR ([_classname,_var])];
		};
	} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPlaceablesStore"));	
	
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
