/*

	Filename: 	RRPClient_system_shopBoxCreate.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

params [
	["_previewHangar","",[""]],
	"_display",
	["_marker","",["",[]]]
];
showHUD false;
showCinemaBorder true;
showChat false;
if !(_previewHangar isEqualTo '') then 
{
	private _hangar = _previewHangar createVehicleLocal[0, 0, 0];
	_hangar allowDamage false;
	_hangar setPosATL [22152.492,14446.313,2000];
	_hangar setVectorDirAndUp [[-0.996935,-0.0782352,0],[0,0,1]];
	_display setVariable ['previewHangar', _hangar];
	private _lightSource = "#lightpoint" createVehicleLocal [0, 0, 0];
	_lightSource lightAttachObject [_hangar, [2, 0, 2]];
	_lightSource setLightColor[255, 255, 255];
	_lightSource setLightAmbient[1, 1, 0.2];
	_lightSource setLightAttenuation[1, 0, 0, 0];
	_lightSource setLightIntensity 10;
	_display setVariable ['lightpoint', _lightSource];
	_hangar hideObject true;
} else {
	private _markerPos = getMarkerPos _marker;
	_markerPos set [2, 8];
	private _lightSource = "#lightpoint" createVehicleLocal _markerPos;
	_lightSource setLightColor[255, 255, 255];
	_lightSource setLightAmbient[1, 1, 0.2];
	_lightSource setLightAttenuation[1, 0, 0, 0];
	_lightSource setLightIntensity 5;
	_display setVariable ['lightpoint', _lightSource];
};