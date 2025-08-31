/*

	Filename: 	RRPClient_dhl_boxPutDown.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
detach life_dhl_box;
private _pos = (vehicle player) modelToWorld [0,1.5,0];
life_dhl_box setPosATL [_pos select 0, _pos select 1, 0];

//проверка а не в конечной ли мы точке!
if (life_dhl_box distance2D life_dhl_finishPoint < 10 && life_job_inProgress) then {
	[] call RRPClient_dhl_orderDone;
};