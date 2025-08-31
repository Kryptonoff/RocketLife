/*
	Filename: 	RRPClient_parking_Menu.sqf
	Project: 	Rimas Altis Life RPG
*/

["Parking"] remoteExec ["RRPServer_garage_getVehicles",2];

disableSerialization;
createDialog "UnionDialogParkingCiv";
waitUntil {!isNull (findDisplay 5700)};
ctrlSetText[5702,("Поиск автомобилей...")];
ctrlShow[5703,false];
ctrlShow[5704,false];