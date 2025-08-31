
if !(canSuspend) exitWith {_this spawn RRPClient_tablet_app_perksUp_onOpen};
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 42000;
private _group = _slide controlsGroupCtrl 42002;

private _activatePrestige = _slide controlsGroupCtrl 42006;
_activatePrestige ctrlShow ([] call RRPClient_perks_canPrestige);

private _levelText = _slide controlsGroupCtrl 42003;
_levelText ctrlSetStructuredText parseText format ["<t size='.9'><t align='left'>Уровень:</t><t align ='right'>%1</t></t>",VRP_Level];
private _prestigeText = _slide controlsGroupCtrl 42004;
_prestigeText ctrlSetStructuredText parseText format ["<t size='.9'><t align='left'>Уровень престижа:</t><t align ='right'>%1</t></t>",VRP_Prestige];
private _perkLimitsText = _slide controlsGroupCtrl 42005;
_perkLimitsText ctrlSetStructuredText parseText format ["<t size='.9'><t align='left'>Активно перков:</t><t align ='right'>%1/%2</t></t>",count VRP_Perks,call RRPClient_perks_getPerkLimit];
private _xpNextText = _slide controlsGroupCtrl 42007;
_xpNextText ctrlSetStructuredText parseText format ["<t size='.9'><t align='center'>%1 XP</t></t>",VRP_XP];

private _ctrls = allControls _group;
{ctrlDelete _x} forEach _ctrls;

private _perks = ("isClass _x" configClasses (getMissionConfig "CfgPerks")) apply {
	[switch(true) do{
		case ([configName _x] call RRPClient_perks_hasPerk) : { 0 };
		case ([configName _x] call RRPClient_perks_getPerkRequirement isEqualTo []): { 1 };
		default { 2 };
	},_x]
};

_perks sort true;

_posX = 0 * safezoneW;
_posY = 0.0088 * safezoneH;

{
	_x params ["_state","_cfg"];

	_perkCtrl = [_group, -1, [
		_posX, 
		_posY,
		getNumber(getMissionConfig "PerkCtrl" >> "w"),
		getNumber(getMissionConfig "PerkCtrl" >> "h")
	], "PerkCtrl"] call RRPClient_gui_util_makeCustom;
	_posX = _posX + 0.077 * safezoneW;
	if (((_forEachIndex + 1) % 5) isEqualTo 0) then {
		_posX = 0 * safezoneW;
		_posY = _posY + 0.138 * safezoneH;
	};

	private _enabledPic = _perkCtrl controlsGroupCtrl 106;
	_enabledPic ctrlShow (_state isEqualTo 0);

	private _iconCtrl = _perkCtrl controlsGroupCtrl 101;
	_iconCtrl ctrlSetText getText (_cfg >> "icon");
	_description = getText(_cfg >> "description");
	if (isClass (_cfg >> "Leveling")) then {
		_percent = ((VRP_Perks getOrDefault [configName _cfg, [1, 0]]) call compile getText (_cfg >> "Leveling" >> "levelCalculation"));
		if ("%1" in _description) then {_description = format[_description, _percent, "%"]};
	};

	_iconCtrl ctrlSetTooltip _description;


	private _coverCtrl = _perkCtrl controlsGroupCtrl 103;
	_coverCtrl ctrlShow (_state isEqualTo 2);

	private _button = _perkCtrl controlsGroupCtrl 104;
	_button ctrlSetStructuredText parseText format["<t size='.8' align='center'>%1</t>",  getText (_cfg >> "displayName")];
	_button ctrlSetPositionX (0 * safezoneW);
	_button ctrlCommit 0;

	private _ctrlLevel = _perkCtrl controlsGroupCtrl 105;
	_ctrlLevel ctrlShow false;
	if (_state isEqualTo 2) then {
		private _requirement = [configName _cfg] call RRPClient_perks_getPerkRequirement;
		_coverCtrl ctrlSetTooltip format ["Требуется %1 %2",_requirement#0,_requirement#1];
		_button ctrlEnable false;
	}else{
		private _maxLevel = getNumber (_cfg >> "Leveling" >> "maxLevel");
		if (_maxLevel > 1) then {
			_ctrlLevel ctrlSetStructuredText parseText format["<t align='center'>%1/%2</t>", (([configName _cfg] call RRPClient_perks_getPerkLevel) select 0), _maxLevel];
			_ctrlLevel ctrlShow true;
		};
		_button ctrlSetEventHandler ["ButtonClick", format["[""%1""] call RRPClient_perks_togglePerk", configName _cfg]];
	};

	if (_state isEqualTo 0) then {
		private _cost = getNumber (missionConfigFile >> "CfgPerks" >> "removalCost");
		_cost = _cost * getNumber (_cfg >> "removalMultiplier");

		_button ctrlSetTooltip (["Деактивировать перк", format ["Стоимость деактивации: %1%2", "$", [_cost] call RRPClient_util_numberText]] joinString "\n");
	}else{
		_button ctrlSetTooltip "Активировать перк";
	};
} forEach _perks;
