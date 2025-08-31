
params ["_error","_response"];
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 39100;
private _group = _slide controlsGroupCtrl 39102;
if (_error isEqualTo "error") exitWith {
	RRPClientCaseLoaded = true;
	[_response, "ОК"] call RRPClient_tablet_showWarning;
};

_xC = 0.002058 * safezoneW;
_yc = 0.011004 * safezoneH;

{
	_x params ["_id","_class","_expired"];
	_config = getMissionConfig "CfgCases" >> _class;
	if !(isClass _config) then {continue};
	_image = getText (_config >> "image");
	_name = getText (_config >> "displayName");

	_ctrl = [_group,-1, [
		_xC,
		_yc,
		0.12862 * safezoneW,
		0.231085 * safezoneH
	],"CaseItem"] call RRPClient_gui_util_makeCustom;
	_xC = _xC + 0.134794 * safezoneW;
	if ((_forEachIndex + 1) % 3 == 0) then {
		_xC = 0.002058 * safezoneW;
		_yc = _yc + 0.237687 * safezoneH;
	};
	_background = _ctrl controlsGroupCtrl 1000;
	_background ctrlSetText "\rimas_agent\assets\gradients.paa";
	_imageCtrl = _ctrl controlsGroupCtrl 1001;
	_imageCtrl ctrlSetText _image;
	_descCtrl = _ctrl controlsGroupCtrl 1002;
	_descCtrl ctrlSetStructuredText parseText format ["<br/><t size='.8'>Доступен до: <t align='right'>%1</t></t>",["msg2",_expired] call RRPClient_util_convertTime];
	_buttonCtrl = _ctrl controlsGroupCtrl 1003;
	_buttonCtrl ctrlSetStructuredText parseText format ["<t size='.8'>ПОДРОБНЕЕ</t>"];
	_buttonCtrl ctrlAddEventHandler ["ButtonClick",format ["[%1] call RRPClient_cases_openSlide",
		[["type","owned"],["class",_class],["id",_id]]
	]];
	_nameCtrl = _ctrl controlsGroupCtrl 1004;
	_nameCtrl ctrlSetStructuredText parseText format ["<t size='.8' align='center'>%1</t>",_name];
} forEach _response;
RRPClientCaseLoaded = true;
