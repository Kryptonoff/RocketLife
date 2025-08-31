/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

RRPCameraSystemBase = objNull;
if!(isNull RRPClientCameraObject)then
{
	RRPClientCameraObject cameraEffect ["terminate", "back", "rendertarget0"];
	camDestroy RRPClientCameraObject;
	RRPClientCameraObject = objNull;
	RRPClientCameraParentObject setVariable ["CameraInUse",false,true];	
	RRPClientCameraParentObject = objNull;
};
RRPClientCameraNVG = false;
false call RRPClient_gui_util_blur;
true
