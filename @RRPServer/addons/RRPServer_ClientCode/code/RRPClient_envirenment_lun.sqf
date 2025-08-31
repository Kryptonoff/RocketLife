/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (!isNil "lightpointMoonEffect") then {deleteVehicle lightpointMoonEffect};
lightpointMoonEffect = "#lightpoint" createVehicleLocal [0,0,2000];  
lightpointMoonEffect setLightBrightness 1; 
lightpointMoonEffect setLightAmbient [1,0.98, 0.95];
lightpointMoonEffect setLightAttenuation [10e10, 150, 4.31918e-005, 4.31918e-005];
lightpointMoonEffect setLightDayLight false;
