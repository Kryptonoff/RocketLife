/*

	Filename: 	RRPClient_ds_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if !(isNull life_ds_job) throw "Вы уже взяли эту работу";
	if !(((currentWeapon player) isEqualTo "") && ((primaryWeapon player) isEqualTo "") && ((handgunWeapon player) isEqualTo "") && ((secondaryWeapon player) isEqualTo "")) throw "Вы должны быть без оружия в руках или на виду";
	life_ds_house = selectRandom nearestObjects [player, ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F"], 500];
	life_ds_house = life_ds_house modelToWorldVisual (life_ds_house selectionPosition "door_1");

	life_ds_job = player createSimpleTask [format["JOB_DS_%1",getPlayerUID player]];
	life_ds_job setSimpleTaskDescription ["Работа курьером описание","Работа курьером","Работа курьером"];
	life_ds_job setTaskState "CREATED"; 
	life_ds_job setSimpleTaskDestination life_ds_house;
	player setCurrentTask life_ds_job;

	RRP_job_waypoints set ["ds_point", life_ds_house];

	life_ds_box = (getText(missionConfigFile >> "CfgJobs" >> "dhlland" >> "life_ds_box")) createVehicle [0,0,0];
	player playAction "FT_Act_Box_Idle";
	life_ds_box attachTo [player,[-0.2, 0, 0.23],"RightHand"];
	AID_DROPDSBOX = player addAction ["Поставить коробку",RRPClient_ds_boxPutDown,nil,0,false,true,"",' life_job_inProgress && life_ds_box in (attachedObjects player) && life_ds_box distance2D (taskDestination life_ds_job) < 2.5'];

	["Работа", "Вы взяли заказ, следуйте на точку"] call toastSuccess;
	life_job_inProgress = true;
	life_job_startTime = time;

	player spawn {
		while {!isNull life_ds_box} do {_this playAction "FT_Act_Box_Idle"; uiSleep 0.5};
		_this playActionNow "FT_Act_Gesture_Reset"
	};
} catch {
	["Работа", _exception] call toastError;
};
