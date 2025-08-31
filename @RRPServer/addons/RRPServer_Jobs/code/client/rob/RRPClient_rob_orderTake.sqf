/*

	Filename: 	RRPClient_rob_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/

try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	private _pumps = [
		[19965.1,11447.6,-0.0483704],
		[19961.3,11454.6,-0.0350304],
		[21230.4,7116.56,-0.0601635],
		[17417.2,13936.7,-0.106512],
		[16750.9,12513.1,-0.0527124],
		[20784.8,16665.9,-0.0528221],
		[20789.5,16672.3,-0.021492],
		[16875.2,15469.4,0.0371275],
		[16871.7,15476.6,0.00983143],
		[23379.4,19799,-0.0543318],
		[15297.1,17565.9,-0.284021],
		[14173.2,16541.8,-0.094574],
		[14221.4,18302.5,-0.0698891],
		[11831.6,14155.9,-0.0342703],
		[12026.6,15830.1,-0.0341549],
		[12024.7,15830,-0.0292492],
		[9205.75,12112.2,-0.0494595],
		[8481.69,18260.7,-0.0449524],
		[6798.14,15561.6,-0.0525742],
		[6198.83,15081.4,-0.0909786],
		[5023.27,14429.6,-0.0978069],
		[4001.13,12592.1,-0.0955448],
		[3757.14,13477.9,-0.0541134],
		[5769.02,20085.7,-0.0104675]
	];
	private _pump_pos = selectRandom _pumps;
	private _pump_objs = nearestObjects [_pump_pos, ["Land_fs_feed_F",
			"Land_FuelStation_Feed_F",
			"Land_FuelStation_01_pump_F",
			"Land_FuelStation_02_pump_F",
			"Land_FuelStation_01_pump_malevil_F",
			"Land_FuelStation_03_pump_F",
			"Land_fs_feed_F"]];
	_pump_obj = _pump_objs select 0;
	RRP_job_waypoints set ["rob_point", _pump_pos];

	life_rob_job = [["JOB_ROB"],_pump_pos,["Вам необходимо ограбить заправку!","Работа грабителем","rifle"]] call RRPClient_tasks_createTask;
	_pump_obj addAction ["Ограбить заправку",RRPClient_rob_robGas,"",1,true,true,"","!life_action_inUse",5];
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Темки", _exception] call toastError;
};
