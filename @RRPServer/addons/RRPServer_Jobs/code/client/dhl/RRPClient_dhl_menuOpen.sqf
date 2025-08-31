/*

	Filename: 	RRPClient_dhl_menuOpen.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if !("dhl" call RRPClient_jobs_clothCheck) throw "Вы должны быть одеты в комплект формы компании DHL. А так же никакого оружия в руках или на виду";
	if ((player call getSide) in ["cop", "med"]) throw "Работа в DHL доступна только гражданам";
	private _spawnPointPos = getMarkerPos (getText(missionConfigFile >> "CfgJobs" >> "dhl" >> "life_office_spawn"));
	if (life_dhl_vehicle distance _spawnPointPos < 30) throw "Покиньте точку выдачи!";

	disableSerialization;
	createDialog "UnionDialogDhl";
	waitUntil {!isNull (findDisplay 5800)};

	private _dpPoints = getArray(missionConfigFile >> "CfgJobs" >> "dhl" >> "life_dp_points");

	private _info = (findDisplay 5800) displayCtrl 5801;
	private _startPoint = (findDisplay 5800) displayCtrl 5802;
	private _finishPoint = (findDisplay 5800) displayCtrl 5803;

	_info ctrlSetStructuredText parseText format ["<t size='0.9' color='%1'>Выберите начальную и конечную точку доставки заказа.<br/>Снизу вам отобразится сумма, которую вы получите за доставку посылки.</t>", profileNamespace getVariable ['GUI_V3_TXT_HTML','#000000']];

	lbClear _startPoint;
	lbClear _finishPoint;

	private "_dp";
	{
		_dp = [_x,"_"," "] call RRPClient_kron_replace;
		_startPoint lbAdd format ["%1",toUpper(_dp)];
		_startPoint lbSetData [(lbSize _startPoint)-1,_x];
		_finishPoint lbAdd format ["%1",toUpper(_dp)];
		_finishPoint lbSetData [(lbSize _finishPoint)-1,_x];
	} forEach _dpPoints;

	_startPoint lbSetCurSel 0;
	_finishPoint lbSetCurSel 1;
} catch {
	["Работа", _exception] call toastError;
};
