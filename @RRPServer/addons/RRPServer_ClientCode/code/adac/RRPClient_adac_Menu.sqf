
_vehicle = param [0,objNull];

try
{
	if (isNull _vehicle) throw "Техника не определена";
	private _config = getMissionConfig "LifeCfgAdac" >> "AdacSettings";
	if !([getText(_config >> "condition")] call RRPClient_util_conditionsCheck) throw "У вас нет доступа";
	if!((player distance (getMarkerPos "other_ZZ_centralHospital") < 120) or {(player distance (getMarkerPos "other_ZZ_rebHospital") < 55)}) throw "Устанавливать улучшения можно только на территории центральной больницы в зеленой зоне!";
	
	private _dbInfo = _vehicle getVariable ["dbInfo",[]];
	if (_dbInfo isEqualTo []) throw "Техника в аренде";
	if (!isClass (missionConfigFile >> "LifeCfgAdac" >> typeof _vehicle)) throw "Для этой техники нет настроек";
	
	createDialog "RRPDialogAdacs";
	private _display = uiNamespace getVariable ["RRPDialogAdacs",displayNull];
	_display setVariable ["vehicle",_vehicle];

	_textGroup = _display displayCtrl 25002;
	(_display displayCtrl 24999) ctrlSetText format["Апгрейд техники: %1",getText(configOf _vehicle >> "displayName")];
	_textCtrl = _textGroup controlsGroupCtrl 25003; 
	
	_adacGroup = _display displayCtrl 25001;
	_yO = 0.02;
	_idc = 300;
	
	_textInfo = [" <t size='1.3'>Доступны следующие улучшения: "];
	{
		if (configName _x isEqualTo "nitro") then {
			if (getNumber(getMissionConfig "LifeCfgAdac" >> typeOf _vehicle >> "nitro") isNotEqualTo 1) then {continue};
		};
		if (configName _x isEqualTo "boxes") then {
			if (getNumber(getMissionConfig "LifeCfgAdac" >> typeOf _vehicle >> "boxes") isEqualTo 0) then {continue};
		};

		[_adacGroup,-1,[0.0125,_yO,0.325,0.06],format ["%1:",getText(_x >> "displayName")],"RobotoCondensed",1,"left","#FFFFFF"] call RRPClient_gui_util_makeStructuredText;
		_button = [_adacGroup,300 + _forEachIndex,[0.5,_yO,0.2375,0.06],"RRP_btn_blue"] call RRPClient_gui_util_makeCustom;
		_button ctrlSetTooltip (getText(_x >> "tooltip"));

		_yO = _yO + 0.068;
		
		_button ctrlSetEventHandler ["ButtonClick",format["['%1'] call RRPClient_adac_install",configName _x]];
		
		if (getNumber(_x >> "levels") > 1) then 
		{
			_lev = _vehicle getVariable [(getText(_x >> "variable")),0];
			if (_lev >= getNumber(_x >> "levels")) then 
			{
				_button ctrlEnable false;
				_button ctrlSetText "Установле макс. ур.";
				_textInfo pushBack (format [" <t size='1.1'>%1: Установле макс. ур.</t>",(getText(_x >> "displayName"))]);
			}else{
				_button ctrlSetText format ["Установить %1 ур.",_lev + 1];
				_textInfo pushBack (format [" <t size='1.1'>%1: Установить макс %2 ур.</t>",(getText(_x >> "displayName")),getNumber(getMissionConfig "LifeCfgAdac" >> typeOf _vehicle >> "boxes")]);
			};
		}else{
			_installed = isNil {_vehicle getVariable (getText(_x >> "variable"))};
			_button ctrlEnable _installed;
			_button ctrlSetText (["Установлено","Установить"] select _installed);
			_textInfo pushBack (format [" <t size='1.1'>%1: %2</t>",(getText(_x >> "displayName")),(["Можно установить","Установлено"] select !_installed)]);
		};

	} forEach ("true" configClasses _config);
	
	_textInfo = _textInfo joinString "<br/>";
	_textCtrl ctrlSetStructuredText parseText _textInfo;
	_positionText = ctrlPosition _textCtrl;
	_yText = _positionText select 1;
	_hText = ctrlTextHeight _textCtrl;
	_textCtrl ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];
	_textCtrl ctrlCommit 0;

}catch{
	["ErrorTitleAndText",["ADAC",_exception]] call toast;
};