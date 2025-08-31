/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
	Tutorial:
		входящие: диалог - В диалоге обязательно должен быть контрол с зоной для мыши и idc = 9999, иначе не будет работать
					объект - любой объект

*/

params [
	["_display",displayNull,[displayNull]],
	['_center',player,[objNull]]
];
if (isNull _display) exitWith {systemChat "ERROR: Couldn't handle or create display."};
(0 boundingBoxReal _center) params ['_minBox','_maxBox','_diameter'];
cutText ['','BLACK IN',0.25];
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,1]] call bis_fnc_textTiles;
arsenal_type = 1;
arsenalButtons = [[],[]];
arsenalMouseData = [0, 0];
arsenalCenter = _center;
arsenalCamPos = [_diameter + 5, -45, 20, [0, 0, -1]];
private _posCenter = getPosASLVisual _center;
_target = if (isNil {uiNamespace getVariable "logic_agent"}) then {
	"Logic" createVehicleLocal [0,0,0];
}else{
	uiNamespace getVariable "logic_agent";
};
uiNamespace setVariable ["logic_agent",_target];
_target setPosASL _posCenter;
_target attachto [_center, arsenalCamPos select 3, ""];
arsenalTarget = _target;

private _cam = "camera" camcreate (eyePos player);
_cam cameraeffect ["internal", "back"];
_cam camSetFocus [-1,-1];
_cam camSetFov 0.5;
_cam camCommit 0;
showcinemaborder false;
uinamespace setvariable["arsenalCam", _cam];
_display displayAddEventHandler ['unload',{
	private _target = missionnamespace getvariable["arsenalTarget", player];
	private _cam = uinamespace getvariable["arsenalCam", objnull];
	_cam cameraeffect["terminate", "back"];
	camdestroy _cam;
	deletevehicle _target;
	deleteVehicle (uiNamespace getVariable "logic_agent");
	uiNamespace setVariable ["logic_agent",nil];
	removemissioneventhandler ["Draw3D", arsenalDraw3DID];
	arsenalMouseData = nil;
	arsenalButtons = nil;
	arsenalCamPos = nil;
}];
_mouseArea = _display displayCtrl 9999;
if !(_display getVariable ['fnc_cameraEVH',false]) then 
{
	_display setVariable ['fnc_cameraEVH',true];

	_mouseArea ctrlAddEventHandler ['MouseMoving',{
		params ["_ctrl", "_mX", "_mY"];
		private _display = ctrlParent _ctrl;
		if (_display getVariable ['locked',false]) exitWith {};
		arsenalMouseData = [_mX, _mY];
		private _cam = uinamespace getvariable["arsenalCam", objnull];
		if (isNull _cam) exitWith {};
		private _center = missionnamespace getvariable["arsenalCenter", player];
		private _target = missionnamespace getvariable["arsenalTarget", player];
		arsenalCamPos params["_dis", "_dirH", "_dirV", "_targetPos"];
		arsenalButtons params["_LMB", "_RMB"];

		if (count _LMB > 0) then {
			_LMB params["_cX", "_cY"];
			arsenalButtons set[0, [_mX, _mY]];
			(0 boundingboxreal _center) params["_minBox", "_maxBox"];
			private _centerSizeBottom = _minBox select 2;
			private _centerSizeUp = _maxBox select 2;
			private _centerSize = sqrt([_minBox select 0, _minBox select 1] distance2D[_maxBox select 0, _maxBox select 1]);
			private _z = _targetPos select 2;
			_targetPos = _targetPos getPos[(_cX - _mX) * _centerSize, _dirH - 90];
			_z = (_z - (_cY - _mY) * _centerSize) max _centerSizeBottom min _centerSizeUp;
			_targetPos = [0, 0, 0] getPos[([0, 0, 0] distance2D _targetPos) min _centerSize, [0, 0, 0] getDir _targetPos];
			_targetPos set[2, _z max((_minBox select 2) + 0.2)];
			arsenalCamPos set[3, _targetPos];
		};

		if (count _RMB > 0) then {
			_RMB params["_cX", "_cY"];
			private _dX = (_cX - _mX) * 0.75;
			private _dY = (_cY - _mY) * 0.75;
			private _z = _targetPos select 2;
			_targetPos = [0, 0, 0] getPos[[0, 0, 0] distance2D _targetPos, ([0, 0, 0] getDir _targetPos) - _dX * 180];
			_targetPos set[2, _z];
			arsenalCamPos set[1, (_dirH - _dX * 180) % 360];
			arsenalCamPos set[2, (_dirV - _dY * 100) max - 89 min 89];
			arsenalCamPos set[3, _targetPos];
			arsenalButtons set[1, [_mX, _mY]];               
		};       
	}];
	_display displayAddEventHandler ['MouseButtonDown',{
		params ["_display", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
		arsenalButtons set[_button,[_xPos,_yPos]];
	}];
	_display displayAddEventHandler ['MouseButtonUp',{arsenalButtons = [[],[]];}];
	_display displayAddEventHandler ['MouseZChanged',{
		params ["", "_scroll"];
		private _cam = uinamespace getvariable["arsenalCam", objnull];
		if (isNull _cam) exitWith {};
		private _center = missionnamespace getvariable["arsenalCenter", player];
		private _target = missionnamespace getvariable["arsenalTarget", player];


		private _disMax =
		if (arsenal_type > 0) then {
			(boundingboxreal _center select 0 vectordistance(boundingboxreal _center select 1)) * 1.5
		} else {
			7
		};
		private _dis = arsenalCamPos select 0;
		_dis = _dis - (_scroll / 5);
		_dis = _dis max(_disMax * 0.15) min _disMax;
		arsenalCamPos set[0, _dis];
	}]; 
	arsenalDraw3DID = addMissionEventHandler ['Draw3D',{
		with uiNamespace do {
			private _cam = uinamespace getvariable["arsenalCam", objnull];
			private _center = missionnamespace getvariable["arsenalCenter", player];
			private _target = missionnamespace getvariable["arsenalTarget", player];
			private _camData = missionNamespace getVariable "arsenalCamPos";
			_camData params ["_dis", "_dirH", "_dirV", "_targetPos"];
			[_target, [_dirH + 180, -_dirV, 0]] call bis_fnc_setobjectrotation;
			_target attachto[_center, _targetPos, ""];
			_cam setvectordirandup[vectordirvisual _target, vectorupvisual _target];
			_cam setPosASL(_target modeltoworldvisualworld[0, -_dis, 0]);

			if ((getPosASLVisual _cam select 2) < (getPosASLVisual _center select 2)) then {
				_cam setPosASL(_target modeltoworldvisualworld[0, -_dis * (((getPosASLVisual _target select 2) - (getPosASLVisual _center select 2)) / ((getPosASLVisual _target select 2) - (getPosASLVisual _cam select 2) + 0.001)), 0]);

			};
		};      
	}];
};
true
