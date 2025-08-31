/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/
private["_cameraCombo", "_index", "_cameraNetId", "_camera"];
_cameraCombo = _this select 0;
_index = _this select 1;
_cameraNetId = (_cameraCombo lbData _index);
_display = uiNamespace getVariable ["RRPDialogCCTV",displayNull];
if(_cameraNetId isEqualTo "0")then
{
	true call RRPClient_CCTV_toggleCameraScreen;
	if (!isNull RRPClientCameraParentObject) then
	{
	    RRPClientCameraParentObject setVariable ["CameraInUse", false, true];
		(_display displayCtrl 20493) ctrlSetText "Камера не выбрана";
	};
}
else
{
	_camera = (objectFromNetId _cameraNetId);
	if !(isMultiplayer) then
	{
		_camera = _cameraNetId call BIS_fnc_objectFromNetId;
	};
	if !(_camera getVariable ["CameraInUse",false])then
	{
		[_camera,isNull RRPClientCameraObject] call RRPClient_CCTV_camAction;		
		(_display displayCtrl 20493) ctrlSetText (getText(getMissionConfig "CfgCCTV" >> (vehicleVarName RRPCameraSystemBase) >> "cameras" >> (vehicleVarName _camera) >> "displayName"));
		RRPClientCameraObject cameraEffect ["internal", "back", "rendertarget0"];
		RRPCameraViewMouseZFoV = 0.7;
		RRPClientCameraObject camPrepareFOV RRPCameraViewMouseZFoV;
		false call RRPClient_CCTV_toggleCameraScreen;
	}
	else
	{
		["ErrorTitleAndText", ["Камера уже используется!", "Камера не может быть использована несколькими людьми одновременно"]] call SmartClient_gui_toaster_addTemplateToast;
	};
};
true
