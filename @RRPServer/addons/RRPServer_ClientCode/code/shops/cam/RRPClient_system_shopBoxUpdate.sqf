/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_dialog",displayNull,[displayNull]],
	["_vehicleClassName","",[""]],
	["_color","",[""]],
	["_material","",[""]],
	["_plate","",[""]]
	
];

_previewVehicle = _dialog getVariable ['previewVehicle', objNull];

_dialog setVariable ["previewCache",[_vehicleClassName,_color,_material,_plate]];
private _cache = _dialog getVariable ["previewCache",[]];

if !(_cache isEqualTo _this) then 
{
	deleteVehicle (_dialog getVariable['previewVehicle', objNull]);
	private _previewHangar = _dialog getVariable ['previewHangar', objNull];
	private _previewVehicle = _vehicleClassName createVehicleLocal [0, 0, 2500];
	_previewVehicle setVariable ["BIS_enableRandomization", false];
	_previewVehicle allowDamage false;
	private _animationList = getArray(missionConfigFile >> "LifeCfgVehicles" >> _vehicleClassName >> "animationList");
	[
		_previewVehicle,
		nil,
		if (_animationList isEqualTo []) then {false} else {_animationList}
	] call BIS_fnc_initVehicle;

	_dialog setVariable ['previewVehicle', _previewVehicle];

	if (!isNull _previewHangar) then {
		_previewVehicle setPosASL(getPosASL _previewHangar);
		_previewVehicle setVectorDirAndUp[(vectorDir _previewHangar),(vectorUp _previewHangar)];
	} else {
		_previewVehicle setPosATL (getMarkerPos _marker);
	};

	_previewVehicle enableSimulation false;
	[_dialog,_previewVehicle] call RRPClient_gui_arsenalCamera;

	showHUD false;
	showCinemaBorder true;
	
	if !(_color isEqualTo "") then {[_previewVehicle,_color,false] call RRPClient_system_colorVehicle};
	if !(_material isEqualTo "") then {[_previewVehicle,_material,false] call RRPClient_system_materialVehicle};
	if !(_plate isEqualTo "") then {_previewVehicle setPlateNumber _plate};

};
