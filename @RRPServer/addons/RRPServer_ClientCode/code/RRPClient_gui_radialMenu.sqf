
private _display = findDisplay 46;
_display displayAddEventHandler ['KeyDown',{
	params ['_display','_code','_shift','_ctrl','_alt'];
	private _interactionKey = if (count (actionKeys 'User10') isEqualTo 0) then {219} else {(actionKeys 'User10') select 0};
	if (_code isEqualTo _interactionKey) then {
		uiNamespace setVariable ['RMHold',true];
	};
	false
}];
_display displayAddEventHandler ['KeyUp',{
	params ['_display','_code','_shift','_ctrl','_alt'];
	private _interactionKey = if (count (actionKeys 'User10') isEqualTo 0) then {219} else {(actionKeys 'User10') select 0};
	if (_code isEqualTo _interactionKey) then {
		uiNamespace setVariable ['RMHold',false];
	};
}];	

_interData = {
	private _pH = (pixelH * 5) * ((getResolution select 1) / 1080);
	private _imgArgs = format["size='%1' image='\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types",200*_pH];

	[
		[format["<img %2\help_ca.paa'/><br/>%1",localize "Танцевать",_imgArgs],{[] call life_fnc_stopEscorting},"true;"], 
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

private _DT_fnc_radialMenu = {
	disableSerialization;
	private _display = (findDisplay 46) createDisplay 'RscDisplayEmpty';
	private _data = [] call _interData;
	if (_data isEqualTo []) exitWith {
		systemChat "data is empty []";
		_display closeDisplay 0
	};
	private _scaleFactorCtrlH = (getResolution select 1) / 1080;
	private _scaleFactorCtrlW = (getResolution select 0) / 1920;
	private _pW = (pixelW * 5) * _scaleFactorCtrlW;
	private _pH = (pixelH * 5) * _scaleFactorCtrlH;
	private _group = _display ctrlCreate ['RscControlsGroupNoScrollbars',-1];
	_group ctrlSetPosition [0.20 * safezoneW + safezoneX, 0.20 * safezoneH + safezoneY, 0.6 * safezoneW, 0.6 * safezoneH];
	_group ctrlCommit 0;
	(ctrlPosition _group) params ['_gX','_gY','_gW','_gH'];		
	setMousePosition [0.5,0.5];

	private _DT_fnc_createLeaf = {
		params [
			['_idc',-1,[0]],
			'_text',
			'_action',
			'_enabled'
		];
		private _pathIndex = _idc;
		_idc = _idc + 100;
		private _leaf = _display ctrlCreate ['RscPictureKeepAspect',_idc,_group];
		_leaf ctrlSetPosition [0,0,_gW,_gH];
		_leaf ctrlSetText format ["dialog\radial\%1.paa",_pathIndex];
		_leaf ctrlSetFade 1;
		_leaf ctrlCommit 0;
		_leaf ctrlEnable false;
		_leaf setVariable ['enabled',_enabled];
		if (_enabled) then {
			_leaf ctrlSetTextColor [0.03,0.03,0.03,0.8];
			_leaf ctrlSetFade 0;
		} else {
			_leaf ctrlSetFade 0.5;
			_leaf ctrlEnable false;
			_leaf ctrlSetTextColor [0,0,0,0.5];
		};
		_leaf ctrlCommit (_pathIndex/15);
		_leaf setVariable ['action',_action];

		private _textCtrl = _display ctrlCreate ['RscStructuredText',-1,_group];
		private _textPos = switch (_pathIndex) do {
			case 1: {[96 * _pW,8 *_pH, 36 * _pW, 16 * _pH]};
			case 2: {[130 * _pW,25 *_pH, 36 * _pW, 16 * _pH]};
			case 3: {[140 * _pW,54 *_pH, 36 * _pW, 16 * _pH]};
			case 4: {[133 * _pW,87 *_pH, 36 * _pW, 16 * _pH]};
			case 5: {[99 * _pW,106 *_pH, 36 * _pW, 16 * _pH]};
			case 6: {[65 * _pW,87 *_pH, 36 * _pW, 16 * _pH]};
			case 7: {[55 * _pW,54 *_pH, 36 * _pW, 16 * _pH]};
			case 8: {[64 * _pW,25 *_pH, 34 * _pW, 16 * _pH]};
			default {[0,0,0.1,0.1]};
		};
		_textCtrl ctrlSetPosition _textPos;
		if (_enabled) then {
			_textCtrl ctrlSetStructuredText (parseText format["<t align='center'>%1</t>",_text]);
		} else {
			_textCtrl ctrlSetStructuredText (parseText format["<t align='center' color='#FF0000'>%1</t>",_text]);
		};
		_textCtrl ctrlSetBackgroundColor [0,0,0,0];
		_textCtrl ctrlEnable true;
		_textCtrl ctrlSetFade 1;
		_textCtrl ctrlCommit 0;
		_textCtrl ctrlSetFade 0;
		_textCtrl ctrlCommit (_pathIndex/15);			
	};

	comment "DETECT CURSOR ANGLE";
	_display displayAddEventHandler ['mouseMoving',"
		params ['_display'];
		private _screenPos = getMousePosition;
		_screenPos params ['_xP','_yP'];
		_xDelta = _xP - 0.5;
		_yDelta = _yP - 0.5;
		private _rad = _xDelta atan2 _yDelta;
		private _degree = if (_rad > 0) then {180 - _rad} else {180 + abs(_rad)};
		if !((_xP > 0.65) OR (_xP < 0.35) OR (_yP < 0.3) OR (_yP > 0.7)) exitWith {};

		private _currentLeaf = switch (true) do {
			case ((_degree < 15) OR (_degree > 342)): {_display displayCtrl 101};
			case ((_degree > 17) AND (_degree < 57)): {_display displayCtrl 102};
			case ((_degree > 61) AND (_degree < 114)): {_display displayCtrl 103};
			case ((_degree > 116) AND (_degree < 158)): {_display displayCtrl 104};
			case ((_degree > 159) AND (_degree < 197)): {_display displayCtrl 105};
			case ((_degree > 199) AND (_degree < 245)): {_display displayCtrl 106};
			case ((_degree > 247) AND (_degree < 300)): {_display displayCtrl 107};
			case ((_degree > 302) AND (_degree < 340)): {_display displayCtrl 108};
			default {controlNull};
		};
		private _leafIDC = ctrlIDC _currentLeaf;
		private _enabled = _currentLeaf getVariable ['enabled',false];
		if (_enabled) then {
			_currentLeaf ctrlSetTextColor [
				(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13]),
				(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54]),
				(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21]),
				(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])
			];
			_display setVariable ['currentLeaf',_currentLeaf];
		} else {
			_display setVariable ['currentLeaf',controlNull];
		};

		{
			private _ctrl = (_display displayCtrl _x);
			private _enabled = _ctrl getVariable ['enabled',false];
			if (_enabled) then {
				_ctrl ctrlSetFade 0;
				_ctrl ctrlSetTextColor [0.03,0.03,0.03,0.8];
			} else {
				_ctrl ctrlSetFade 0.5;
				_ctrl ctrlSetTextColor [0,0,0,0.5];
			};
		} forEach [101,102,103,104,105,106,107,108] - [_leafIDC];
		

	"];
	comment "ALLOW MOVING";
	_display displayaddEventHandler ['KeyDown',"
		params ['_display','_code'];
		private _handled = true;
		private _movementKeysUnit = actionKeys 'MoveForward' + actionKeys 'MoveBack' + actionKeys 'TurnLeft' + actionKeys 'TurnRight';
		private _movementKeysLand = actionKeys 'CarForward' + actionKeys 'CarBack' + actionKeys 'CarLeft' + actionKeys 'CarRight';
		if (_code in (_movementKeysLand + _movementKeysUnit)) then {
			_handled = false;
		};
		_handled
	"];
	_display displayAddEventHandler ['KeyUp',"
		params ['_display','_code'];
		private _interactionKey = if (count (actionKeys 'User10') isEqualTo 0) then {219} else {(actionKeys 'User10') select 0};
		private _codeCtrl = _display getVariable ['currentLeaf',controlNull];
		private _actionCode = _codeCtrl getVariable ['action',{}];

		if (_code isEqualTo _interactionKey) then {
			_display closeDisplay 0;
			if !(_actionCode isEqualTo {}) then {
				playSound 'readoutClick';
			};
			call _actionCode;
		};
	"];
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [1];
	"dynamicBlur" ppEffectCommit 0.25;

	for '_x' from 1 to 8 do {
		private _currentData = _data select (_x - 1);
		_currentData params [['_text',"",[""]],['_code',{true},[{}]],['_condition',"false",[""]]];
		private _enabled = call compile _condition;
		[_x,_text,_code,_enabled] call _DT_fnc_createLeaf;
	};

	private _logo = _display ctrlCreate ['RscPictureKeepAspect',-1,_group];
	_logo ctrlSetPosition [0,0,_gW,_gH];
	_logo ctrlSetText "dialog\radial\logo.paa";
	_logo ctrlSetTextColor [1,1,1,1];
	_logo ctrlEnable false;
	_logo ctrlSetFade 1;
	_logo ctrlCommit 0;
	_logo ctrlSetFade 0;
	_logo ctrlCommit 0.25;		

	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 0.25;
};
call _DT_fnc_radialMenu

(findDisplay 46) setVariable ['DT_fnc_radialMenu',_DT_fnc_radialMenu];

while {true} do {
	waitUntil {uiNamespace getVariable ['initRadial',false]};
	call ((findDisplay 46) getVariable ['DT_fnc_radialMenu',{}]);
	uiNamespace setVariable ['initRadial',false];
};
