
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 40000;
private _group = _slide controlsGroupCtrl 40003;
{ctrlDelete _x}forEach (allControls _group);

_faqButton = _slide controlsGroupCtrl 40002;
_faqButton ctrlSetEventHandler ["ButtonClick", "['trx_faq',1] call RRPClient_tablet_slide"];

_tree = _slide controlsGroupCtrl 40005;
tvClear _tree;
_tree ctrlAddEventHandler ["TreeSelChanged",{
	params ["_ctrl","_path"];
	_rawConfig = _ctrl tvData _path;
	if (_rawConfig isEqualTo "") exitWith {};
	_config = parseSimpleArray _rawConfig;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 40000;
	private _itemGroup = _slide controlsGroupCtrl 40003;
	{ctrlDelete _x}forEach (allControls _itemGroup);


	_cfg = getMissionConfig "CfgTRX" >> _config select 0 >> "items" >> _config select 1;
	_item = configName _cfg;
	_displayName = getText(_cfg >> "displayName");
	_image = getText(_cfg >> "image");
	_description = getText(_cfg >> "description");
	_currency = getText(_cfg >> "currency");
	_price = getNumber(_cfg >> "price");
	
	_ctrl = [_itemGroup,-1, [
		0,
		0,
		0.282774 * safezoneW,
		0.549839 * safezoneH
	],"ItemGroup"] call RRPClient_gui_util_makeCustom;
	_titleCtrl = _ctrl controlsGroupCtrl 1200;
	_imageCtrl = _ctrl controlsGroupCtrl 1201;
	_descrGroup = _ctrl controlsGroupCtrl 1100;
	_descrCtrl = _descrGroup controlsGroupCtrl 1101;
	_buyButCtrl = _ctrl controlsGroupCtrl 2402;

	_titleCtrl ctrlSetStructuredText parseText format [ "<t align='center'>%1</t>",_displayName];
	_imageCtrl ctrlSetText _image;
	_descrCtrl ctrlSetStructuredText parseText _description;
	_buyButCtrl ctrlSetStructuredText parseText format ["<t size='.8'>Купить за %1 <img size='1' image='%2'/></t>",_price, _currency call RRPClient_util_currencyIcon];
	_buyButCtrl ctrlSetEventHandler ["ButtonClick", format ["['%1','%2'] call RRPClient_trx_buyRequest",_config select 0,_config select 1]];
}];

{
	_main = _x;
	_index = _tree tvAdd [[],getText(_main >> "displayName")];
	{
		_daughter = _x;
		_configName = configName _daughter;
		_displayName = getText(_daughter >> "displayName");
		_currency = getText(_daughter >> "currency");

		_idx = _tree tvAdd [[_index],_displayName];
		_tree tvSetData [[_index,_idx],str([configName _main,_configName])];
		_tree tvSetPicture [[_index,_idx],getText(_x >> "image")];
		_tree tvSetPictureRight [[_index,_idx], _currency call RRPClient_util_currencyIcon];
	} forEach ("true" configClasses (_x >> "items"));
} forEach ("true" configClasses (missionConfigFile >> "CfgTRX"));

/*
_xC = 0.00514135 * safezoneW;
_yC = 0.00880332 * safezoneH;

{
	_item = configName _x;
	_displayName = getText(_x >> "displayName");
	_image = getText(_x >> "image");
	_description = getText(_x >> "description");
	_currency = getText(_x >> "currency");
	_price = getNumber(_x >> "price");
	
	_ctrl = [_group,-1, [
		_xC,
		_yc,
		0.390742 * safezoneW,
		0.0770289 * safezoneH
	],"ItemGroup"] call RRPClient_gui_util_makeCustom;
	_yC = _yc + (0.085 * safezoneH);
	_ctrl ctrlSetTooltip _displayName;
	_imageCtrl = _ctrl controlsGroupCtrl 1201;
	_descrCtrl = _ctrl controlsGroupCtrl 1100;
	_buyButCtrl = _ctrl controlsGroupCtrl 2402;

	_imageCtrl ctrlSetText _image;
	_descrCtrl ctrlSetText _description;
	_buyButCtrl ctrlSetStructuredText parseText format ["<t size='.8'>Купить за %1 <img size='1' image='%2'/></t>",_price, _currency call RRPClient_util_currencyIcon];
	_buyButCtrl ctrlSetEventHandler ["ButtonClick", format ["['%1'] call RRPClient_trx_buyRequest",_item]];
} forEach ("true" configClasses (missionConfigFile >> "CfgTRX" >> "items"));
*/