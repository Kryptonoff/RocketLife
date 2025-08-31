/*

	Filename: 	RRPClient_dhl_boxSpawn.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
private _place = param [0,objNull,[objNull]];
life_dhl_box = (getText(missionConfigFile >> "CfgJobs" >> "dhl" >> "life_dhl_box")) createVehicleLocal getPosATL _place;
life_dhl_box addAction ["<img image='\rimas_dhl\data\dhl_logo.paa' /> Взять коробку",RRPClient_dhl_boxPickUp,nil,0,true,true,"",' life_job_inProgress ', 4];