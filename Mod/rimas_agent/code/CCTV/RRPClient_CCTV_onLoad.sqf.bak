/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_display", "_camerasCombo", "_range", "_cameras", "_index"];
_display = uiNamespace getVariable ["RRPDialogCCTV",displayNull];
_camerasCombo = _display displayCtrl 20497;
(_display displayCtrl 20492) ctrlSetText "#(argb,256,256,1)r2t(rendertarget0,1.0)";
_config = getMissionConfig "CfgCCTV" >> (vehicleVarName RRPCameraSystemBase);
_cameras = [];
{
	_cameras pushBackUnique (configName _x);
}forEach ("call compile (getText(_x >> 'condition'))" configClasses (_config >> "cameras"));
lbClear _camerasCombo;
if(_cameras isEqualTo [])then
{
	_index = _camerasCombo lbAdd "Нет предустановленных камер :(";
	_camerasCombo lbSetData [_index,"0"];
	_camerasCombo lbSetPictureRight [_index,"\exile_assets\assets\camera.paa"];
}
else
{
	_index = _camerasCombo lbAdd "Выберите камеру";
	_camerasCombo lbSetData [_index,"0"];
	_camerasCombo lbSetPictureRight [_index,"\exile_assets\assets\camera.paa"];
	{
		_camCfg = getMissionConfig "CfgCCTV" >> (vehicleVarName RRPCameraSystemBase) >> "cameras" >> _x;
		_object = call compile _x;
		if !(isNil "_object") then 
		{
			_index = _camerasCombo lbAdd ("Камера: " + getText(_camCfg >> "displayName"));
			_nd = if (isMultiplayer) then {netId _object}else{_object call BIS_fnc_netId};
			_camerasCombo lbSetData [_index,_nd];
			_camerasCombo lbSetPicture [_index,"\exile_assets\assets\camera.paa"];
			if(_object getVariable ["CameraInUse",false])then
			{
				_camerasCombo lbSetColor [_index,[221/255, 38/255, 38/255, 1]];
				_camerasCombo lbSetPictureRightColor [_index,[221/255, 38/255, 38/255, 1]];
				_camerasCombo lbSetTextRight [_index,"ИСПОЛЬЗУЕТСЯ!"];
				_camerasCombo lbSetColorRight [_index,[221/255, 38/255, 38/255, 1]];
			}
			else
			{
				_camerasCombo lbSetColor [_index,[160/255, 223/255, 59/255, 1]];
			};
		};
	}
	forEach _cameras;
};
_camerasCombo
