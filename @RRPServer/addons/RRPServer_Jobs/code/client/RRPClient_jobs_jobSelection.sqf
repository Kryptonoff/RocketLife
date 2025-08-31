/*

	Filename: 	RRPClient_jobs_jobSelection.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	disableSerialization;
	if (dialog) throw "";
	if ((player call getSide) in ["cop", "med"]) throw "Вы на службе, какая работа!?";

	createDialog "RocketDialogJobSelection";
	waitUntil {!isNull (findDisplay 7000)};

	((findDisplay 7000) displayCtrl 7001) ctrlSetStructuredText parseText format ["<t align='center' size='0.8' color='%2'>Количество вакансий будет расти с увеличением вашего уровня<br/><br/><t size='1.2'>Доступные вакансии:<br/></t></t>",profileNamespace getVariable ['GUI_V3_TXT_HTML','#000000']];

	private _Btn1 = (findDisplay 7000) displayCtrl 7002;
	private _Btn2 = (findDisplay 7000) displayCtrl 7003;
	private _Btn3 = (findDisplay 7000) displayCtrl 7004;
	private _Btn4 = (findDisplay 7000) displayCtrl 7005;
	private _Btn5 = (findDisplay 7000) displayCtrl 7006;
	private _Btn6 = (findDisplay 7000) displayCtrl 7007;
	private _Btn7 = (findDisplay 7000) displayCtrl 7008;
	private _Btn8 = (findDisplay 7000) displayCtrl 7009;
	private _Btn9 = (findDisplay 7000) displayCtrl 7010;

	private _btnArray = [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
	{_x ctrlEnable false; _x ctrlShow false} foreach _btnArray;
	{
		_btn = _btnArray select _forEachIndex;

		_btn ctrlSetText _x#0;
		_btn buttonSetAction _x#1;
		_btn ctrlEnable ([_x#2] call RRPClient_util_conditionsCheck);
		_btn ctrlShow true;
	} forEach getArray(missionConfigFile >> "CfgJobs" >> "life_jobs_array");
} catch {
	["Работа", _exception] call toastError;
};
