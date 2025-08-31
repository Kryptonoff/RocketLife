
private _price = param [0,0,[0]];
private _vehicle = param [1,ObjNull,[ObjNull]];
private _EVH = param [2,0,[0]];
private _localMarker = param [3,"",[""]];
try
{

	waitUntil {uiSleep 0.01; _vehicle distance arrowPointer < 30 OR !alive _vehicle OR isNull _vehicle};
	if (!alive _vehicle OR isNull _vehicle) throw "Вы потеряли самолет на котором доставляли груз!";
	_level = (missionNamespace getVariable ["Pilot_Prof",[0,0]]) select 0;
	_level = if (_level isEqualto 0) then {1} else {_level};
	
	_levelPrice = ((round(_price / 100) * 5) * _level);
	_price = _price + _levelPrice;
	_price = ["priceUp",_price] call RRPClient_system_VIP; 
	[player,"atm","add",_price] remoteExecCall ["RRPServer_system_moneyChange",2];
	_vehicle setVariable ["already_delivers",nil,true];
	removeMissionEventHandler ["Draw3D",_EVH];
	task_flyDpActive = false;
	_addExpAmount = [50,_level, "Pilot_Prof"] call RRPClient_farm_util_countAmountXP;
  	["Pilot_Prof",_addExpAmount] call RRPClient_skills_addXP;
	[50, "доставку груза"] call RRPClient_perks_addXP;
	["SuccessTitleAndText", ["Успех!", format["<t>Вы доставили груз и получили:<br />Гонорар: <t color='#1dae0e'>$%1</t></t>",_price]]] call SmartClient_gui_toaster_addTemplateToast;
	deleteVehicle arrowPointer;
	deleteMarkerLocal _localMarker;
	private _action = [
		'Вы доставили посылку! Хотите взять заказ на следующую доставку?',
		'Хотите продолжить работу?',
		true,
		true
	] call BIS_fnc_guiMessage;
	if (_action) then {[_vehicle] call RRPClient_FlyDP_startQuest} else {
		["InfoTitleAndText", ["Info!", "Вы завершили работу по доставке грузов самолетом"]] call SmartClient_gui_toaster_addTemplateToast;
		_vehicle setVariable ["already_delivers",nil,true];
	};
}
catch
{
	["WarningTitleAndText", ["Внимание!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
	_vehicle setVariable ["already_delivers",nil,true];
	removeMissionEventHandler ["Draw3D",_EVH];
	task_flyDpActive = false;
	deleteVehicle arrowPointer;
	deleteMarkerLocal _localMarker;
};
