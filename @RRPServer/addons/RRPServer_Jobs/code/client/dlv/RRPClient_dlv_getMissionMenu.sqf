/*
	
	Filename: 	RRPClient_dlv_getMissionMenu.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try {
	life_depo = param [0,"",[""]];
	if (life_action_inUse) throw "Вы заняты";
	
	if (player distance life_dlv_vehicle > 25) throw "Проверьте, чтобы ваш грузовик был рядом и повторите попытку";
	private _cargoDeliver = life_dlv_vehicle getVariable ["cargoDeliver",[]];
	if !(_cargoDeliver isEqualTo []) throw "Вы уже взяли заказ на доставку";
	
	disableSerialization;
	if (isNull (findDisplay 4300)) then {
		if !(createDialog "RocketDialogDeliver") throw "Не получилось сделать диалог";
	};
	
	private _title = (findDisplay 4300) displayCtrl 4301;
	private _control = (findDisplay 4300) displayCtrl 4302;
	
	
	_title ctrlSetText format['Депо "%1"',getText(missionConfigFile >> "CfgJobs" >> "dlv" >> life_depo)];
	
	private _depos = ["depo_kavala","depo_alps","depo_north","depo_east"] - [life_depo];
	private _picture = getText(configFile >> "CfgVehicles" >> typeOf life_dlv_vehicle >> "picture");
	lbclear _control;
	{	
		_toTitle = getText(missionConfigFile >> "CfgJobs" >> "dlv" >> _x);		
		_price = [life_depo,_x,life_dlv_vehicle] call RRPClient_dlv_price;
		
		_control lbAdd format['Доставка в депо "%1"',_toTitle];
		_control lbSetData [(lbSize _control)-1,_x];
		_control lbSetPicture [(lbSize _control)-1,_picture];			
		_control lbSetTextRight [(lbSize _control)-1, format["Оплата: $%1",[_price] call RRPClient_util_numberText]];							
	} foreach _depos;
} catch {
	["Работа", _exception] call toastError;
}