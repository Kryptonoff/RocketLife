/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_control", "_xAxis", "_yAxis", "_display", "_currentPosition", "_inScreen", "_deflectionHorisontal", "_deflectionVertical", "_currentAnimationYaw", "_currentAnimationPitch", "_newAnimYaw", "_newAnimPitch", "_startPosition", "_endPosition", "_excludedControls", "_backgroundControls", "_ctrlClassname"];
_control = _this select 0;
_xAxis = _this select 1;
_yAxis = _this select 2;
_display = uiNamespace getVariable ["RRPDialogCCTV",displayNull];
_currentPosition = [_xAxis,_yAxis];
_inScreen = _currentPosition  call RRPClient_gui_util_mouseControl_inLimit;
if(_inScreen)then
{
	if(isNil "RRPCameraMousePrevious")exitWith{RRPCameraMousePrevious = _currentPosition;};
	if(RRPCameraRightClickDown)then
	{
		if(!isNull RRPClientCameraParentObject)then
		{
			if!(_currentPosition isEqualTo RRPCameraMousePrevious)then
			{
				_deflectionHorisontal = (_currentPosition select 0) - (RRPCameraMousePrevious select 0);
				_deflectionVertical = (_currentPosition select 1) - (RRPCameraMousePrevious select 1);
				_currentAnimationYaw = RRPClientCameraParentObject animationPhase "ExileCctvYaw";
				_currentAnimationPitch = RRPClientCameraParentObject animationPhase "ExileCctvPitch";
				_newAnimYaw = ((((_deflectionHorisontal * 3) + _currentAnimationYaw) min 1) max 0);
				_newAnimPitch = ((((_deflectionVertical * 2) + _currentAnimationPitch) min 1) max 0);
				RRPClientCameraParentObject animate ["ExileCctvYaw",_newAnimYaw,true];
				RRPClientCameraParentObject animate ["ExileCctvPitch",_newAnimPitch,true];
				_startPosition = RRPClientCameraParentObject modelToWorld (RRPClientCameraParentObject selectionPosition "cctv_view_from");
				_endPosition = RRPClientCameraParentObject modelToWorld (RRPClientCameraParentObject selectionPosition "cctv_view_to");
				RRPClientCameraObject camSetPos _startPosition;
				RRPClientCameraObject camSetTarget _endPosition;
				RRPClientCameraObject camCommit 0;
			};
		};
	};
	RRPCameraMousePrevious = _currentPosition;
}
else
{
	if(RRPClientDisplayResetFocus)then
	{
		_path = getMissionConfig "RRPDialogCCTV";
		if !(isClass getMissionConfig "RRPDialogCCTV") then 
		{
			_path = (configFile >> "RRPDialogCCTV");
		};
		_excludedControls = getArray(_path >> "hideControls");
		_excludedControls pushBack (ctrlClassName _control);
		_backgroundControls = "true" configClasses (_path >> "controlsBackground");
		_excludedControls append _backgroundControls;
		{
			_ctrlClassname = (ctrlClassName _x);
			if !(_ctrlClassname in _excludedControls)then
			{
				ctrlSetFocus _x;
			};
		}forEach allControls _display;
		RRPClientDisplayResetFocus = false;
	};
	RRPCameraRightClickDown = false;
};
true
