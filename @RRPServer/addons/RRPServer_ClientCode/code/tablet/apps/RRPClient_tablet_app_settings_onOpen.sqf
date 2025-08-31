
if !canSuspend exitWith {_this spawn RRPClient_tablet_app_settings_onOpen};
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 35500;
private _group = _slide controlsGroupCtrl 35502;

private _cfg = getMissionConfig "CfgSettings";


if (_display getVariable ["SettingsLoaded",false]) exitWith {};
_display setVariable ["SettingsLoaded",true];

toggleVar = {
	if (_this isEqualTo "tags") exitWith {enableTags};
	if (_this isEqualTo "grass") exitWith {enableGrass};
	if (_this isEqualTo "sound") exitWith {enableSoundAmbient};
	if (_this isEqualTo "HUD") exitWith {enableHUD};
	if (_this isEqualTo "OpenApp") exitWith {openApp};
	if (_this isEqualTo "SaveBinds") exitWith {life_saveBind};
	if (_this isEqualTo "ShowHotkeys") exitWith {life_showWeaponHud};
	if (_this isEqualTo "ShowCaseTimer") exitWith {life_showCaseTimer};
	if (_this isEqualTo "stream") exitWith {life_streamerMode};
	if (_this isEqualTo "music") exitWith {life_music};
	if (_this isEqualTo "WelcomeScreen") exitWith {life_welcomeScreen};
	false
};

sliderVar = {
	if (_this isEqualTo "viewDistanceFoot") exitWith {life_viewDistanceFoot};
	if (_this isEqualTo "viewDistanceCar") exitWith {life_viewDistanceCar};
	if (_this isEqualTo "viewDistanceAir") exitWith {life_viewDistanceAir};
	0
};

_yPos = 0.01 * safezoneH;
private _categoryName = "";
private _ctrl = controlNull;
private _type = "";
private _inside = [];
private _toggle = controlNull;
private _titleCtrl = controlNull;

{
	_categoryName = getText (_x >> "displayName");
	_titleCtrl = _display ctrlCreate ["TitleCtrl",-1, _group];
	_titleCtrl ctrlSetPositionY _yPos;
	(_titleCtrl controlsGroupCtrl 1402) ctrlSetStructuredText parseText format ["<t size='.9'>%1</t>",_categoryName];
	_titleCtrl ctrlCommit 0;
	_yPos = _yPos + (0.03 * safezoneH);
	
	_inside = ("true" configClasses _x);
	{
		_type = getText (_x >> "type");
		configName _x call debugConsole;
		_ctrlSettings = switch (_type) do
		{
			case "TOGGLE": {
				private _ctrl = _display ctrlCreate ["ToggleCtrl",-1, _group];
				(_ctrl controlsGroupCtrl 1002) ctrlSetStructuredText parseText format ["<t size='.8'>%1</t>",getText (_x >> "displayName")];
				_ctrl ctrlSetTooltip getText (_x >> "tooltip");
				_ctrl ctrlSetPositionY _yPos;
				_ctrl ctrlCommit 0;
				
				[_ctrl, _x] spawn{
					params ["_ctrl","_config"];
					_var = (getText(_config >> "actionToggle")) call toggleVar;
					_toggler = _ctrl controlsGroupCtrl 1003;
					_toggler setVariable ["ToggleAction",getText(_config >> "onAction")];
					(_toggler getVariable ["Toggle",controlNull]) cbSetChecked _var;
					[_toggler, _var] call RRPClient_tablet_toggle;
				};
				_ctrl
			};
			case "SLIDER": {
				private _ctrl = _display ctrlCreate ["SliderCtrl",-1, _group];
				(_ctrl controlsGroupCtrl 1102) ctrlSetStructuredText parseText format ["<t size='.8'>%1</t>",getText (_x >> "displayName")];
				_ctrl ctrlSetTooltip getText (_x >> "tooltip");

				[_ctrl,_x] spawn {
					params ["_ctrl","_config"];
					_slider = _ctrl controlsGroupCtrl 1103;
					getArray (_config >> "values") params [ "_boundaries", "_defaultValue", "_speed" ];
					_slider sliderSetRange _boundaries;
					_slider sliderSetPosition ((getText(_config >> "var")) call sliderVar);
					_slider sliderSetSpeed _speed;
					_slider ctrlAddEventHandler ["SliderPosChanged", getText(_config >> "onAction")];
				};
				_textValue = _ctrl controlsGroupCtrl 1104;
				_textValue ctrlSetStructuredText parseText format["<t size='.8' align='left'>%1</t>", (getText(_x >> "var")) call sliderVar];
				_ctrl ctrlSetPositionY _yPos;
				_ctrl ctrlCommit 0;
				_ctrl	

			};
			case "DROPDOWN": {
				private _ctrl = _display ctrlCreate ["DropdownCtrl",-1, _group];
				(_ctrl controlsGroupCtrl 1202) ctrlSetStructuredText parseText format ["<t size='.8'>%1</t>",getText (_x >> "displayName")];
				_ctrl ctrlSetTooltip getText (_x >> "tooltip");
				_ctrl ctrlSetPositionY _yPos;
				_list = _ctrl controlsGroupCtrl 1203;
				_list ctrlAddEventHandler ["LBSelChanged", getText(_x >> "onAction")];
				_current = -1;
				{
					_hash = _x get _forEachIndex;
					_index = _list lbAdd (_hash get "name");
					_list lbSetData [_index, _hash get "data"];
					_list lbSetPicture [_index, _hash get "icon"];
					_list lbSetPictureRight [_index, _hash get "rightPicture"];
					if !([_hash get "condition"] call condition) then {
						_list lbSetTooltip [_index, _hash get "conditionMessage"];	
					};
					if (_hash getOrDefault ["current",false]) then {
						_current = _forEachIndex;
					};
				} forEach (call compile getText(_x >> "fillFunction"));
				format ["CUR: %1",_current] call chat;
				_list lbSetCurSel _current;
				_ctrl ctrlCommit 0;
				_ctrl
			};
			case "SLIDE": {
				private _ctrl = _display ctrlCreate ["SlideCtrl",-1, _group];
				(_ctrl controlsGroupCtrl 1302) ctrlSetStructuredText parseText format ["<t size='.8' align='left'>%1</t><t align='right'>%2</t>",getText (_x >> "displayName"),">"];
				_ctrl ctrlSetTooltip getText (_x >> "tooltip");
				_ctrl ctrlSetPositionY _yPos;
				_button = _ctrl controlsGroupCtrl 1302;
				_button ctrlAddEventHandler ["MouseButtonClick", getText(_x >> "onAction")];
				_ctrl ctrlCommit 0;
				_ctrl
			};
		};
		
		_yPos = _yPos + (0.03 * safezoneH);

	} forEach _inside;
} forEach ("true" configClasses _cfg);