
_display = _this select 0;
(_display getVariable ["objects",[]]) params ["_cam","_local_npc","_hangar","_light_1","_light_2"];
_cam cameraeffect ["terminate","back"];
camdestroy _cam;
deleteVehicle _local_npc;
deleteVehicle _hangar;
deleteVehicle _light_1;
deleteVehicle _light_2;
_cam = nil;
uiNamespace setVariable ["RRPDialogCharCreate",displayNull];