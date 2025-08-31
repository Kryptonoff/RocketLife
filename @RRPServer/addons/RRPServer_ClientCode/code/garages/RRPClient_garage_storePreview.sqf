
if !(
	params[
		["_vehicle", objNull, [objNull,""]]
	]
) exitwith{};

if (isnil "RRPClientGarageStoreCam") then {

	_vehicle = if (_vehicle isEqualType objNull) then {_vehicle}else{objectFromNetId _vehicle};
	false call RRPClient_hud_show;
	showHUD false;
	showCinemaBorder true;

	RRPClientGarageStoreCamVehicle = _vehicle;
	private _cam_pos = _vehicle getPos [10, (getDir RRPClientGarageStoreCamVehicle)];
	_cam_pos set [2, 5];

	RRPClientGarageStoreCam = "camera" camCreate _cam_pos;
	_camera = RRPClientGarageStoreCam;
	_camera cameraEffect["internal", "BACK"];
	_camera camsetTarget RRPClientGarageStoreCamVehicle;
	_camera camPrepareTarget RRPClientGarageStoreCamVehicle;
	_camera camSetPos _cam_pos;
	_camera camCommit 1;

	CamRunning = true;

	private _angle = 0;

	while {CamRunning} do
	{
		private _vehicle = RRPClientGarageStoreCamVehicle;
		_camera camsetTarget RRPClientGarageStoreCamVehicle;
		_camera camPrepareTarget RRPClientGarageStoreCamVehicle;

		private _new_pos = RRPClientGarageStoreCamVehicle getPos [10, _angle];
		_new_pos set [2, 5];
		_camera camSetPos _new_pos;
		_camera camCommit 1;

		waitUntil{
			(RRPClientGarageStoreCamVehicle != _vehicle) ||
			{(camCommitted _camera)} ||
			{isNull(uiNamespace getVariable["RRPDialogGarageStore", displayNull])} ||
			{isNull RRPClientGarageStoreCamVehicle}
		};

		if ( (isNull(uiNamespace getVariable["RRPDialogGarageStore", displayNull])) || {(isNull RRPClientGarageStoreCamVehicle)} ||
			{ crew RRPClientGarageStoreCamVehicle isNotEqualTo [] } ||
			{ getPosWorld RRPClientGarageStoreCamVehicle distance ((uiNamespace getVariable["RRPDialogGarageStore", displayNull]) getVariable ["position",getPosWorld RRPClientGarageStoreCamVehicle])
			> 50 }
		) exitwith
		{
			if!(isNull(uiNamespace getVariable["RRPDialogGarageStore", displayNull])) then {
				closedialog 0;
			};
			_camera cameraEffect["terminate", "BACK"];
			camDestroy _camera;
			deletevehicle _camera;
			showHUD true;
			showCinemaBorder false;
			true call RRPClient_hud_show;
			RRPClientGarageStoreCam = nil;
		};

		_camera camPreparePos _new_pos;
		_camera camCommitPrepared 0;
		_angle = _angle + 1;

	};
} else {
	RRPClientGarageStoreCamVehicle = _vehicle;
};
if (isNull RRPClientGarageStoreCamVehicle) exitwith {
	closedialog 0;
};
