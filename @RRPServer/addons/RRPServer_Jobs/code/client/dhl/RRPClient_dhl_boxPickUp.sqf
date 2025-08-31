/*

	Filename: 	RRPClient_dhl_boxPickUp.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if !("dhl" call RRPClient_jobs_clothCheck) throw "Вы должны быть одеты в комплект формы компании DHL. А так же никакого оружия в руках или на виду";

	player playAction "FT_Act_Box_Idle";
	life_dhl_box attachTo [player,[-0.2, 0, 0.23],"RightHand"];

	AID_DROPBOX = player addAction ["<img image='\rimas_dhl\data\dhl_logo.paa' /> Поставить коробку",RRPClient_dhl_boxPutDown,nil,0,false,true,"",' life_job_inProgress && life_dhl_box in (attachedObjects player)'];
	AID_STOREBOX = player addAction ["<img image='\rimas_dhl\data\dhl_logo.paa' /> Убрать коробку в фургон",RRPClient_dhl_boxStoreInVehicle,nil,0,false,true,"",' life_job_inProgress && life_dhl_box in (attachedObjects player) && cursorObject isEqualTo life_dhl_vehicle && player distance life_dhl_vehicle < 5'];

	waitUntil {uiSleep 0.03; player forceWalk true; !((currentWeapon player) isEqualTo "") OR !(isNull objectParent player) OR !life_job_inProgress OR isNull life_dhl_box OR isNull life_dhl_vehicle OR !(life_dhl_box in (attachedObjects player))};

	player forceWalk false;

	player removeAction AID_DROPBOX;
	player removeAction AID_STOREBOX;

	if (life_dhl_box in (attachedObjects player)) then {
		[] call RRPClient_dhl_boxPutDown;
	};

	if ((currentWeapon player) isEqualTo "") then {
		player PlayActionNow "FT_Act_Gesture_Reset";
	};
} catch {
	["Работа", _exception] call toastError;
};
