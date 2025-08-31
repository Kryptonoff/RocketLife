/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_newCameraPerent", "_startPosition", "_endPosition"];
_newCameraPerent = _this select 0;
if(!isNull RRPClientCameraParentObject)then
{
	RRPClientCameraParentObject setVariable ["CameraInUse",false,true];	
};
RRPClientCameraParentObject = _newCameraPerent;
RRPClientCameraParentObject setVariable ["CameraInUse",true,true];	
_startPosition = RRPClientCameraParentObject modelToWorld (RRPClientCameraParentObject selectionPosition "cctv_view_from");
_endPosition = RRPClientCameraParentObject modelToWorld (RRPClientCameraParentObject selectionPosition "cctv_view_to");
if (_this select 1) then
{
	RRPClientCameraObject = "camera" camCreate _startPosition;
};
_display = uiNamespace getVariable ["RRPDialogCCTV",displayNull];
RRPClientCameraObject camSetPos _startPosition;
RRPClientCameraObject camSetTarget _endPosition;
RRPCameraViewMouseZFoV = 1;
RRPClientCameraObject camPrepareFOV RRPCameraViewMouseZFoV;
RRPClientCameraObject camCommit 0;
(_display displayCtrl 20492) ctrlSetText "#(argb,256,256,1)r2t(rendertarget0,1.0)";
showCinemaBorder false;
RRPClientCameraObject
