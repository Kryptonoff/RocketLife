params [
	['_object',objNull,[objNull]],
	['_animSet','STAND',['']]
];
if (isNull _object) exitWith {};
if !(local _object) exitWith {};
detach _object;
_object disableAI 'ALL';
private _animSetParams = _animSet call BIS_fnc_ambientAnimGetParams;
_animSetParams params ['_animations','_azimutDiff','_attachSnap','_attachOffset','_noBackpack','_noWeapon','','_canInterpolate'];
if (_noBackpack) then {removeBackpack _object};
if (_noWeapon) then {
	{_object removeWeapon _x} forEach [primaryWeapon _object,secondaryWeapon _object,handgunWeapon _object];
};
private _logic = 'Logic' createVehicleLocal (position _object);
_logic setPosWorld (getPosWorld _object);
_object attachTo [_logic, [0,0,_attachOffset]];
_object removeAllEventHandlers 'AnimDone';
_object removeAllEventHandlers 'Killed';
_object setVariable ['ambientAnim_canInterpolate',_canInterpolate];
_object setVariable ['ambientAnim_animations',_animations];
_object switchMove (selectRandom _animations);

_object addEventHandler ['AnimDone',{
	params ['_object','_currentAnimation'];
	private _animationsPool = _object getVariable ['ambientAnim_animations',[]];
	if (_animationsPool isEqualTo []) exitWith {};
	private _canInterpolate = _object getVariable ['ambientAnim_canInterpolate',false];
	private _nextAnimation = selectRandom _animationsPool;
	if (alive _object) then {
		if (_canInterpolate) then {_object playMoveNow _anim} else {_object switchMove _anim};
	};
}];
_object addEventHandler ['Killed',{
	params ['_object'];
	_object removeAllEventHandlers 'AnimDone';
	_object removeAllEventHandlers 'Killed';
}];
