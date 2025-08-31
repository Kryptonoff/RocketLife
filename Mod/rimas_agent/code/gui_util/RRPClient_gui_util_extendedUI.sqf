/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
params [
	['_ctrl',controlNull,[controlNull]],
	['_group',controlNull,[controlNull]],
	['_memoryVariable','NONE',['']]
];
if (isNull _ctrl) exitWith {};
if (isNull _group) then {_group = _ctrl};
private _display = ctrlParent _group;
_group setVariable ['EUIDefaultCoords',[ctrlPosition _group,ctrlAngle _group]];
_group setVariable ['EUIMemoryVariable',_memoryVariable];
_ctrl ctrlEnable true;
private _isControlsGroup = ctrlClassName _group in [
	'RscControlsGroup',
	'RscControlsGroupNoScrollbars',
	'RscControlsGroupNoHScrollbars',
	'RscControlsGroupNoVScrollbars'
];
_group setVariable ['EUIControlsGroup',_isControlsGroup];

private _DT_fnc_ExtendedUISave = {
	params ['_activeElement',['_forcedPosition',[]]];
	if (canSuspend) then {waitUntil {ctrlCommitted _activeElement}};
	private _memoryVariable = _activeElement getVariable ['EUIMemoryVariable','NONE'];
	if (_memoryVariable isEqualTo 'NONE') exitWith {};
	private _angleData = ctrlAngle _activeElement;
	private _position = if (_forcedPosition isEqualTo []) then {ctrlPosition _activeElement} else {_forcedPosition};
	if (isNil '_angleData') then {_angleData = [0,0.5,0.5]};

	switch (true) do {
		case (_activeElement getVariable ['EUIMinimized',false]): {
			private _maximizeSize = _activeElement getVariable ['EUIMaximizeSize',[]];
			profileNamespace setVariable [_memoryVariable,[_position,_angleData,_maximizeSize]];
		};
		default {profileNamespace setVariable [_memoryVariable,[_position,_angleData]]};
	};      
};
uiNamespace setVariable ['DT_fnc_ExtendedUISave',_DT_fnc_ExtendedUISave];

private _DT_fnc_ExtendedUINormalizePos = {
	params ['_xP','_yP','_wP','_hP'];
	_xP = _xP min (safeZoneWAbs + safeZoneX - _wP) max (safeZoneXAbs);
	_yP = _yP min (1 * safezoneH + safezoneY - _hP) max (0 * safezoneH + safezoneY);
	[_xP,_yP,_wP,_hP]
};
uiNamespace setVariable ['DT_fnc_ExtendedUINormalizePos',_DT_fnc_ExtendedUINormalizePos];

if !(_memoryVariable isEqualTo 'NONE') then {
	private _memoryData = profileNamespace getVariable [_memoryVariable,[]];
	private _DT_fnc_ExtendedUINormalizePos = uiNamespace getVariable ['DT_fnc_ExtendedUINormalizePos',{}];
	if !(_memoryData isEqualTo []) then {
		_memoryData params ['_memoryPosition',['_angleData',[]],['_maximizeSize',[]]];
		_memoryPosition params ['_gX','_gY','_gW','_gH'];
		_angleData params [['_angle',0],['_xCenter',0.5],['_yCenter',0.5]];
		_group ctrlSetPosition ([_gX,_gY,_gW,_gH] call _DT_fnc_ExtendedUINormalizePos);
		_group ctrlCommit 0;
		_group ctrlSetAngle [_angle,_xCenter,_yCenter,true];
		_group setVariable ['EUIMaximizeSize',_maximizeSize];
		if !(_maximizeSize isEqualTo []) then {
			_group setVariable ['EUIMinimized',true];
		};
	};
}; 
_ctrl ctrlAddEventHandler ['MouseButtonDown',{
	params ['_ctrl','_button','_offsetX','_offsetY'];
	private _display = ctrlParent _ctrl;
	private _activeElement = _ctrl getVariable ['EUISelectedControl',controlNull];
	switch (_button) do {
		case 0: {
			switch (true) do {
				case (_activeElement getVariable ['EUIControlsGroup',false]): {
					_display setVariable ['EUISelectedControlOffsets',[_offsetX,_offsetY]];
				};
				case (!isNull (ctrlParentControlsGroup _activeElement)): {
					_display setVariable ['EUISelectedControlOffsets',[0,0]];
				};
				default {_display setVariable ['EUISelectedControlOffsets',[0,0]]};
			};
		};          
		case 1: {
			if (_activeElement getVariable ['EUIControlPinned',false]) then {
				_activeElement setVariable ['EUIControlPinned',false];
				_ctrl ctrlSetTooltip '';
			} else {
				_activeElement setVariable ['EUIControlPinned',true];
				_ctrl ctrlSetTooltip 'Позиция закреплена';
			};
		};
	};
	_display setVariable ['EUISelectedControl',_activeElement];
}];    
_ctrl ctrlAddEventHandler ['MouseButtonUp',{
	params ['_ctrl','_button'];
	private _display = ctrlParent _ctrl;
	_display setVariable ['EUISelectedControl',controlNull];
}];
if (_isControlsGroup) then {
	_ctrl ctrlAddEventHandler ['MouseButtonDblClick',{
		params ['_ctrl'];
		private _display = ctrlParent _ctrl;
		private _activeElement = _ctrl getVariable ['EUISelectedControl',controlNull];
		if (_activeElement isEqualTo _ctrl) exitWith {};
		private _DT_fnc_ExtendedUINormalizePos = uiNamespace getVariable ['DT_fnc_ExtendedUINormalizePos',{}];
		private _animationEndSize = [];

		switch (true) do {
			case !(_activeElement getVariable ['EUIMinimized',false]): {
				(ctrlPosition _ctrl) params ['','','_cW','_cH'];
				(ctrlPosition _activeElement) params ['_cX','_cY','',''];
				private _maximizeSize = ctrlPosition _activeElement;
				_animationEndSize = ([_cX,_cY,_cW,_cH] call _DT_fnc_ExtendedUINormalizePos);
				_activeElement setVariable ['EUIMaximizeSize',_maximizeSize];
				_activeElement setVariable ['EUIMinimized',true];
				_activeElement ctrlSetPosition _animationEndSize;
			};
			case (_activeElement getVariable ['EUIMinimized',false]): {
				private _maximizeSize = _activeElement getVariable ['EUIMaximizeSize',[]];
				_maximizeSize params ['','','_aW','_aH'];
				(ctrlPosition _activeElement) params ['_aX','_aY','',''];
				_animationEndSize = ([_aX,_aY,_aW,_aH] call _DT_fnc_ExtendedUINormalizePos);
				_activeElement setVariable ['EUIMinimized',false];
				_activeElement ctrlSetPosition _animationEndSize;
			};              
		};
		_activeElement ctrlCommit 0.25;
		private _DT_fnc_ExtendedUISave = uiNamespace getVariable ['DT_fnc_ExtendedUISave',{}];
		[_activeElement,_animationEndSize] call _DT_fnc_ExtendedUISave;
	}];
};
_ctrl setVariable ['EUISelectedControl',_group];

if (_display getVariable ['EUIDisplayInit',false]) exitWith {};
_display setVariable ['EUIDisplayInit',true];
_display displayAddEventHandler ['KeyDown',{
	params ['_display','_code','_shift','_control','_alt'];
	private _activeElement =_display getVariable ['EUISelectedControl',controlNull];
	private _DT_fnc_ExtendedUINormalizePos = uiNamespace getVariable ['DT_fnc_ExtendedUINormalizePos',{}];
	if (_control) then {
		switch (_code) do {
			case 44: {
				if (isNull _activeElement) exitWith {};
				private _defaultCoords = _activeElement getVariable ['EUIDefaultCoords',[]];
				_defaultCoords params ['_scriptedPosition',['_angleData',[]]];
				_angleData params [['_angle',0],['_xCenter',0.5],['_yCenter',0.5]];                    
				if (_defaultCoords isEqualTo []) exitWith {};
				_activeElement ctrlSetPosition (_scriptedPosition call _DT_fnc_ExtendedUINormalizePos);
				_activeElement ctrlSetAngle [_angle,_xCenter,_yCenter];
				_activeElement ctrlCommit 0;
				_activeElement setVariable ['EUIMinimized',false];
				private _DT_fnc_ExtendedUISave = uiNamespace getVariable ['DT_fnc_ExtendedUISave',{}];
				[_activeElement] call _DT_fnc_ExtendedUISave;
			};                
		};
	};
	false
}];           
_display displayAddEventHandler ['MouseMoving',{
	params ['_display','_dOffsetX','_dOffsetY'];
	private _activeElement = _display getVariable ['EUISelectedControl',controlNull];
	if (isNull _activeElement) exitWith {};
	if (_activeElement getVariable ['EUIControlPinned',false]) exitWith {};
	private _DT_fnc_ExtendedUINormalizePos = uiNamespace getVariable ['DT_fnc_ExtendedUINormalizePos',{}];
	(ctrlPosition _activeElement) params ['_dX','_dY','_dW','_dH'];
		switch (true) do {
			case (_activeElement getVariable ['EUIControlsGroup',false]): {
				private _ctrlOffsets = _display getVariable ['EUISelectedControlOffsets',[]];
				_ctrlOffsets params ['_offsetX','_offsetY'];                    
				private _mousePosition = getMousePosition;
				_mousePosition params ['_dX','_dY'];
				_activeElement ctrlSetPosition ([_dX - _offsetX,_dY - _offsetY,_dW,_dH] call _DT_fnc_ExtendedUINormalizePos);
			};
			case (!isNull (ctrlParentControlsGroup _activeElement)): {
				private _mousePosition = getMousePosition;
				private _controlGroup = ctrlParentControlsGroup _activeElement;
				(ctrlPosition _controlGroup) params ['_gX','_gY','_gW','_gH'];
				_mousePosition params ['_dX','_dY'];
				_activeElement ctrlSetPosition [
					(_dX - _gX) min (_gW - _dW),
					(_dY - _gY) min (_gH - _dH),
					_dW,
					_dH
				];
			};
			default {
				private _mousePosition = getMousePosition;
				_mousePosition params ['_dX','_dY'];
				_activeElement ctrlSetPosition ([_dX,_dY,_dW,_dH] call _DT_fnc_ExtendedUINormalizePos);
			};
		};        
	_activeElement ctrlCommit 0;
	private _DT_fnc_ExtendedUISave = uiNamespace getVariable ['DT_fnc_ExtendedUISave',{}];
	[_activeElement] call _DT_fnc_ExtendedUISave;
}];
