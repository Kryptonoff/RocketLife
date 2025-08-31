
params [
	['_controlsGroup',controlNull],
	['_camera',objNull],
	['_offsetPower',0.75],
	['_useBlur',true,[true]]
];
private _display = ctrlParent _controlsGroup;
if (isNull _display) exitWith {};
if (_display getVariable ['parallaxInited',false]) exitWith {systemChat "ERROR: Parallax is overlapping with exisiting one."};
_controlsGroup setVariable ['initialPosition',ctrlPosition _controlsGroup];
_display setVariable ['camInitialPosition',getPosASL _camera];
_display setVariable ['parallaxInited',true];
_display setVariable ['camera',_camera];
_display setVariable ['parallaxGroup',_controlsGroup];
_display setVariable ['offsetPower',_offsetPower];
private _DT_fnc_doOffset = {
	params ['_display'];
	getMousePosition params ['_xPos','_yPos'];
	private _controlsGroup = _display getVariable ['parallaxGroup',controlNull];
	private _controlsGroupDefaultPos = _controlsGroup getVariable ['initialPosition',[]];
	private _offsetPower = _display getVariable ['offsetPower',0];
	private _camera = _display getVariable ['camera',objNull];
	(_controlsGroupDefaultPos) params ['_gX','_gY','_gW','_gH'];
	_xPos = [safeZoneXAbs * safeZoneW,_xPos * _offsetPower,abs (safezoneXabs * (safeZoneW + safezoneXAbs))] call BIS_fnc_lerp;
	_yPos = [safeZoneY * safeZoneH,_yPos * _offsetPower,safeZoneH + safeZoneY] call BIS_fnc_lerp;
	_controlsGroup ctrlSetPosition [_gX + (_xPos * pixelW * pixelGrid * 2),_gY + (_yPos * pixelH * pixelGrid * 2),_gW,_gH];
	_controlsGroup ctrlCommit 0;
	if (!isNull _camera) then {
		(_display getVariable "camInitialPosition") params ['_vX','_vY','_vZ'];
		_yPosInt = linearConversion [2,1,_yPos,0,_offsetPower/10];
		_xPosInt = linearConversion [2,1,_xPos,0,_offsetPower/10];
		_camera setPosASL [_vX + _xPosInt,_vY - _xPosInt,_vZ + _yPosInt];
	};        
};
_display setVariable ['DT_fnc_doOffset',_DT_fnc_doOffset];

_display call _DT_fnc_doOffset;
_display displayAddEventHandler ['MouseMoving',{
	params ['_display']; 
	_display call (_display getVariable "DT_fnc_doOffset")
}];
if (_useBlur) then {
	private _blurEffect = ppEffectCreate ["DynamicBlur",777]; 
	_blurEffect ppEffectAdjust [2]; 
	_blurEffect ppEffectForceInNVG true;  
	_blurEffect ppEffectEnable true;  
	_blurEffect ppEffectCommit 0;
	_display setVariable ['blurEffect',_blurEffect];
	_display displayAddEventHandler ['unload',{
		params ['_display'];
		private _blurEffect = _display getVariable ['blureffect',[]];
		ppEffectDestroy _blurEffect;
	}];
};
if (!isNull _camera) then {
	_display displayAddEventHandler ['unload',{
		params ['_display'];
		private _camera = _display getVariable ['camera',objNull];
		_camera setPosASL (_display getVariable 'camInitialPosition');
	}];
};