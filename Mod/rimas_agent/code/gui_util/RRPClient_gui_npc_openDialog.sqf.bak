params[['_npc', objNull, [objNull]]];
showHUD false;
private _npcClass = _npc getVariable ['npcClass', ''];

private _npcdialogClass = _npc getVariable ["NPC_InitDialog",""];
if (_npcdialogClass isEqualTo "") exitWith {};

private _npcConditionCode = (_npc getVariable ["NPC_Condition","false"]);

private _npcCondition = [_npcConditionCode] call RRPClient_util_conditionsCheck;
if(isnil{_npcCondition} or {!(_npcCondition isEqualtype false)} or {!(_npcCondition)}) exitwith{};

private _initialDir = getDir _npc;
private _display = (findDisplay 46) createDisplay 'RscDisplayEmpty';
_display displayAddEventHandler['Keydown', {
	params['_display', '_code', '_shift', '_ctrl', '_alt'];
	private _handled=false;
	if!(_code isEqualto 0x01) then{
		_handled=true
	};
	_handled
}];
_display setVariable['npcObject', _npc];
private _DT_fnc_gotodialog = {
	params['_dialogClass'];
	private _dialogConfig = missionConfigFile >> "NPCdialogs" >> "Cfgdialogs" >> _dialogClass;
	private _renameData = getArray(_dialogConfig >> "rename");
	_renameData params[['_newname', ''], ['_newTitle', '']];
	if!(_newname isEqualto '') then{ [_npcname, _newname] call RRPClient_gui_util_updateStructuredText };
	if!(_newTitle isEqualto '') then{ [_npcTitle, _newTitle]call RRPClient_gui_util_updateStructuredText };
	private _newtext = gettext(_dialogConfig >> "text");
	private _randomText = getArray(_dialogConfig >> "randomText");
	if (_randomText isNotEqualTo []) then {_newtext = selectRandom _randomText};
	private _dialogAnimation = gettext(_dialogConfig >> "animation");
	private _sound = getText(_dialogConfig >> "soundOnOpen");
	if (_sound isNotEqualTo "") then {playSound _sound};
	private _DT_fnc_animate = _display getVariable['DT_fnc_animate', {}];
	[_npc, _dialogAnimation] call _DT_fnc_animate; 
	private _DT_fnc_lipSync = _display getVariable['DT_fnc_lipSync', {}];
	[_newtext, _npc] call _DT_fnc_lipSync;
	[_dialogtext, _newtext] call RRPClient_gui_util_updateStructuredText;
	private _answers = getArray(_dialogConfig >> "answers");
	_display setVariable['answersArray', _answers];
	_display setVariable['mode', 2];
};
_display setVariable['DT_fnc_gotodialog', _DT_fnc_gotodialog];

private _DT_fnc_lipSync = {
	disableSerialization;
	params[["_toSync", -1, [0, ""]], ["_npcObject", objNull, [objNull]]];
	if (_toSync isEqualto-1) exitwith{};
	if(isNull _npcObject) exitwith {};
	private _previousHandle = _npcObject getVariable['previousSequnece', objNull];
	if(!isNull _previousHandle) then { terminate _previousHandle };
	private _handle = [_toSync, _npcObject] spawn 
	{
		params['_toSync', '_npcObject'];
		_npcObject setRandomLip true;
		private _sleeptime = 0;
		if (_toSync isEqualtype '') then {
			_sleeptime = round((count(toArray _toSync)) / 8);
		} else {
			_sleeptime = _toSync;
		};
		uiSleep _sleeptime;
		_npcObject setRandomLip false;
	};
	_npcObject setVariable['previousSequnece', _handle];
};
_display setVariable['DT_fnc_lipSync', _DT_fnc_lipSync];

private _DT_fnc_animate = {
	params['_npc', ["_animation",""]];
	if (_animation isNotEqualTo "") then {_npc switchMove _animation};
};
_display setVariable['DT_fnc_animate', _DT_fnc_animate];

private _DT_fnc_createCamera = {
	params ["_npc"];
	player hideObject true;
	showCinemaBorder true;
	private _camAGL = ASLtoAGL (eyePos _npc);
	private _camera = "camera" camCreate _camAGL;
	_camera cameraEffect ["internal", "back"];
	_camera camPrepareFov 1;
	_camera camCommitPrepared 0;
	_pos = getPosATL _npc;
	_camera camSetPos (_npc modeltoWorld([0.229004, 1.22217, 1.7193]));
	_camera camCommit 0;
	_camera
};

private _DT_fnc_initdialog = {
	params['_npc'];
	private _npcClass = _npc getVariable ['npcClass', ''];
	private _npcnametext = _npc getVariable ["NPC_Name","NAME PLACEHOLDER"];
	private _npctitleText = _npc getVariable ["NPC_Description","DESCRIPTION PLACEHOLDER"];
	private _npcdialogClass = _npc getVariable ["NPC_InitDialog","undefined"];
	if (_npcdialogClass isEqualTo "undefined") exitWith {};
	[_npcname, _npcnametext] call RRPClient_gui_util_updateStructuredText;
	[_npcTitle, _npctitleText] call RRPClient_gui_util_updateStructuredText;
	private _dialogConfig = missionConfigFile >> "NPCdialogs" >> "Cfgdialogs" >> _npcdialogClass;
	if (isNull _dialogConfig) exitwith {systemChat format['ERROR: Couldnt find "%1" dialog class!', _npcdialogClass]};
	private _dialogtextContent = gettext(_dialogConfig >> "text");
	private _dialogAnimation = gettext(_dialogConfig >> "animation");
	private _sound = getText(_dialogConfig >> "soundOnOpen");
	if (_sound isNotEqualTo "") then {playSound _sound};
	private _DT_fnc_animate = _display getVariable['DT_fnc_animate', {}];
	[_npc, _dialogAnimation] call _DT_fnc_animate;
	private _DT_fnc_lipSync = _display getVariable['DT_fnc_lipSync', {}];
	[_dialogtextContent, _npc] call _DT_fnc_lipSync;
	[_dialogtext, _dialogtextContent] call RRPClient_gui_util_updateStructuredText;
	private _answers = getArray(_dialogConfig >> "answers");
	if (count _answers isEqualto 0) exitwith {systemChat format['ERROR: "%1" dialog has no answers!', _npcdialogClass]};
	_display setVariable['answersArray', _answers];
	_display setVariable['mode', 0];
	_display setVariable ["npc",_npc];
};
_display setVariable['DT_fnc_initdialog', _DT_fnc_initdialog];

private _DT_fnc_generateAnswers = {
	params['_answers', ['_recreate', false]];
	private _hO = _aH / _pH;
	private _wO = 0;
	private _answersArray =+ _answers;
	reverse _answersArray;
	if (_recreate) then {
		ctrlDelete _answergroup;
		_answergroup = _display ctrlCreate['RscControlsgroupNoScrollbars', 100, _maingroup];
		_answergroup ctrlsetPosition [_gW*0.70, 0, _gW*0.30, _gH*0.80];
		_answergroup ctrlCommit 0;
	};
	{
		_x params['_title', '_picture', ['_condition', 'true'], '_code'];
		private _enabled = [_condition] call RRPClient_util_conditionsCheck;
		if (_enabled) then 
		{
			_hO = _hO - _answerBoxH - 1;
			[_answergroup, -1, [_aW * 0.1, _hO * _pH, _aW * 0.9, _answerBoxH * _pH], _hlGradienttextureLeft, false, false, [0.26, 0.24, 0.31,0.8]] call RRPClient_gui_util_makeStaticPicture;
			[_answergroup, -1, [_aW * 0.1, _hO * _pH, _answerBoxH * _pW, _answerBoxH * _pH], _picture, false, false, [1, 1, 1, 1]] call RRPClient_gui_util_makeStaticPicture;
			[_answergroup, -1, [_aW * 0.1, _hO * _pH, _answerBoxH * _pW, _answerBoxH * _pH], '', _fontH, _txtsizeH, "left", _secondaryColor, "1", [0.26, 0.24, 0.31,0.5]] call RRPClient_gui_util_makeStructuredText;
			private _textField = [_answergroup, -1, [_aW * 0.1 + (_answerBoxH * _pW), _hO * _pH, _aW * 0.8, _answerBoxH * _pH], format[' %1', _title], _fontH, _txtsizeH, "left", _secondaryColor, "1", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
			private _field = [_answergroup, -1, [_aW * 0.1 + (_answerBoxH * _pW), _hO * _pH, _aW * 1, _answerBoxH * _pH], '', _fontH, _txtsizeH, "left", _secondaryColor, "1", [1, 1, 1, 0.15]] call RRPClient_gui_util_makeStructuredText;
		
			_field ctrlsetFade 1;
			_field ctrlCommit 0;
			_field ctrlEnable true;
			_field setVariable ['data', [_code]];
			_field ctrlAddEventHandler['MouseEnter', {
				params['_ctrl'];
				_ctrl ctrlsetFade 0;
				_ctrl ctrlCommit 0.15;
				playSound 'ReadoutHideClick1';
			}];
			_field ctrlAddEventHandler['Mouseexit', {
				params['_ctrl'];
				_ctrl ctrlsetFade 1;
				_ctrl ctrlCommit 0.15;
			}];
			_field ctrlAddEventHandler['MouseButtondown', {
				params['_ctrl'];
				private _display = ctrlParent _ctrl;
				private _data = _ctrl getVariable['data', []];
				_data params['_code'];
				_ctrl ctrlEnable false;
				if (_code isEqualto 'closedialog') exitwith {
					_display spawn{
						_this closeDisplay 0
					};
					playSound 'readoutClick';
				};
				private _dialogClass = missionConfigFile >> "NPCdialogs" >> "Cfgdialogs" >> _code;
				switch (true) do
				{
					case (_code isEqualTo "InitDialog"): {
						_display setVariable['currentdialog', (_display getVariable ["npc",objNull]) getVariable ["NPC_InitDialog",""]];
						_display setVariable['mode', 1];
					};
					case (!isNull _dialogClass): {
						_display setVariable['currentdialog', _code];
						_display setVariable['mode', 1];
					};
					default {
						private _npc = _display getVariable['npcObject', objNull];
						[_code, _npc, _display] spawn 
						{
							params['_code', '_npc', '_display'];
							call compile _code;
						};
					}
				};
				playSound 'readoutClick';_ctrl 
				ctrlEnable true;
			}];
		};
	}forEach _answersArray;
};
_display setVariable['DT_fnc_generateAnswers', _DT_fnc_generateAnswers];

if (!isNull(uiNamespace getVariable['npcdialogDisplay', displayNull])) exitwith {};
uiNamespace setVariable['npcdialogDisplay', _display];
private _scaleFactorCtrlH = (getResolution select 1) / 1080;
private _scaleFactorCtrlW = (getResolution select 0) / 1920;
_scaleFactorCtrlH = _scaleFactorCtrlH * 1;
_scaleFactorCtrlW = _scaleFactorCtrlW * 1;
private _pW = parseNumber(((pixelW * 5) * _scaleFactorCtrlW) toFixed 3);
private _pH = parseNumber(((pixelH * 5) * _scaleFactorCtrlH) toFixed 3);
private _scaleFactortext = 1 / (getResolution select 5);
private _txtsizeXH = 1.3 * _scaleFactortext;
private _fontXH = "RobotoCondensedBold";
private _txtsizeNumeric = 0.85 * _scaleFactortext;
private _txtsizeH = 0.75 * _scaleFactortext;
private _fontH = "RobotoCondensedBold";
private _txtsizeM = 0.65 * _scaleFactortext;
private _fontM = "RobotoCondensed";
private _txtsizeS = 0.55 * _scaleFactortext;
private _fontS = "RobotoCondensedLight"; 
private _txtsizeXS = 0.45 * _scaleFactortext;
private _txtsizeSpecific = _txtsizeM * 0.85;
private _wO = 0;
private _hO = 2;
private _titleBoxH = 8;
private _subtitleBoxH = 6;
private _answerBoxH = 8;
private _hlGradienttexture = "\A3\ui_f\data\igui\rscingameui\rscunitinfo\gradient_ca.paa";
private _splashtexture = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
private _hlGradienttextureLeft = "\A3\ui_f\data\gui\rsccommon\rscbackgroundgui\gradient_left_gs.paa";
private _dialogCondition = compile (gettext( missionConfigFile >> "NPCdialogs" >> "condition"));
private _colorPrimary = gettext(missionConfigFile >> "NPCdialogs" >> "primaryColor");
private _secondaryColor = gettext(missionConfigFile >> "NPCdialogs" >> "secondaryColor");
private _maingroup = _display ctrlCreate ['RscControlsgroupNoScrollbars', -1];
_maingroup ctrlsetPosition [0 * safeZoneW + safeZoneX, 0 * safeZoneH + safeZoneY, 1 * safeZoneW, 1 * safeZoneH];
_maingroup ctrlsetFade 1;
_maingroup ctrlCommit 0;
(ctrlposition _maingroup) params ['_gX', '_gY', '_gW', '_gH'];
private _answergroup = _display ctrlCreate['RscControlsgroupNoScrollbars', 100, _maingroup];
_answergroup ctrlsetPosition [_gW * 0.70, 0, _gW * 0.30, _gH * 0.80];
_answergroup ctrlCommit 0;
(ctrlposition _answergroup) params['_aX', '_aY', '_aW', '_aH'];
[_answergroup, -1, [0, 0, _aW, _aH], '', _fontM, _txtsizeM, "left", "#FFFFFF", "0", [0, 1, 0, 0]] call RRPClient_gui_util_makeStructuredText;
private _dialoggroup = _display ctrlCreate['RscControlsgroup', 200, _maingroup];
_dialoggroup ctrlsetPosition [0, _gH * 0.80, _gW, _gH * 0.20];
_dialoggroup ctrlCommit 0; 
(ctrlposition _dialoggroup) params['_dX', '_dY', '_dW', '_dH'];
[_dialoggroup, -1, [0, 0, _dW, _dH], _splashtexture, false, false, [0, 0, 0, 1]] call RRPClient_gui_util_makeStaticPicture;
[_dialoggroup, -1, [0, 0, _dW, _dH], _splashtexture, false, false, [1, 1, 1, 1]] call RRPClient_gui_util_makeStaticPicture;
private _bgGradient = [_dialoggroup, -1, [0, 0, _dW, _dH], _hlGradienttexture, false, false, [0.26, 0.24, 0.31,0.8]] call RRPClient_gui_util_makeStaticPicture;
_bgGradient ctrlsetangle [180, 0.5, 0.5, true];
private _npcname = [_dialoggroup, -1, [_wO*_pW, _hO*_pH, _dW, _titleBoxH*_pH], 'NPC_name_PLACEHOLDER', _fontH, _txtsizeH, "center", _colorPrimary, "1", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
_hO = _hO + _titleBoxH;
private _npcTitle = [_dialoggroup, -1, [_wO*_pW, _hO*_pH, _dW, _subtitleBoxH*_pH], '~ NPC_TITLE_PLACEHOLDER ~', _fontM, _txtsizeM*0.9, "center", _colorPrimary, "1", [0, 1, 0, 0]] call RRPClient_gui_util_makeStructuredText;
_hO = _hO + _subtitleBoxH + 2;
private _dialogtext = [_dialoggroup, -1, [_dW*0.30, _hO*_pH, _dW*0.40, _dH-(_hO*_pH)-(2*_pH)], 'text PLACEHOLDER', _fontM, _txtsizeM*0.9, "center", _secondaryColor, "1", [0, 1, 0, 0]] call RRPClient_gui_util_makeStructuredText;
_maingroup ctrlsetFade 0;
_maingroup ctrlCommit 0.1;
_npc call _DT_fnc_initdialog;
// private _camera = [_npc] call _DT_fnc_createCamera;
while {true} do 
{
	if (isNull _display) exitwith {};
	private _canUsedialog = call _dialogCondition;
	private _npcConditionMet = [_npcConditionCode] call RRPClient_util_conditionsCheck;
	if(!isnil{_canUsedialog} and {_canUsedialog isEqualtype false} and {!(_canUsedialog)}) exitwith
	{
		_display spawn{
			_this closeDisplay 0
		};
	};
	if (dialog) exitWith 
	{
		_display spawn{
			_this closeDisplay 0
		};
	};
	if( isnil{_npcConditionMet} or {!(_npcConditionMet isEqualtype false)} or {!(_npcConditionMet)}) exitwith
	{
		_display spawn{
			_this closeDisplay 0
		};
	};
	private _mode = _display getVariable['mode', -1];
	if!(_mode isEqualto -1) then
	{
		switch(_mode) do
		{
			case 0:
			{
				private _answers = _display getVariable['answersArray', []];
				[_answers] call _DT_fnc_generateAnswers;
				_display setVariable['mode', -1];
			};
			case 1:
			{
				private _dialogClass = _display getVariable['currentdialog', ''];
				[_dialogClass]call _DT_fnc_gotodialog;
			};
			case 2:
			{
				private _answers = _display getVariable['answersArray', []];
				[_answers, true] call _DT_fnc_generateAnswers;
				_display setVariable['mode', -1];
			};
		};
	};
	uiSleep 0.01;
};
_npc setRandomLip false;
_npc switchMove ((_npc getVariable ["Animations",[]]) select 0);
player hideObject false;
showHUD true;