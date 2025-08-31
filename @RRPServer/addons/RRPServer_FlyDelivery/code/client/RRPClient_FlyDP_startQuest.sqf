
private _vehicle = param [0,ObjNull,[ObjNull]];
private _newTask = false;
if (isNull _vehicle) then {
	{
		private _VehOwner = _x getVariable ["vehicle_info_owners",[]];
		if (
			(typeOf _x) in getArray(missionConfigFile >> "CfgFlyDelivery" >> "allowedPlanes") and 
			{!(_VehOwner isEqualto [])} and 
			{((_VehOwner select 0) select 0) isEqualto getPlayerUid player} and 
			{(player distance _x < 50)} and 
			{alive _x} and 
			{local _x} and 
			{!(_vehicle getVariable ["already_delivers",false])}
		) exitWith {_vehicle = _x; _newTask = true;};
	} foreach life_vehicles;
};

try
{
	if (task_flyDpActive) throw "У вас уже есть задание!";
	if (_vehicle getVariable ["already_delivers",false]) throw "За данным бортом уже есть закрепленный груз";
	if (!(vehicle player isEqualto player) and _newTask) throw "Для того что-бы взять задание Вам нужно выйти из техники!";
	if (isNull _vehicle) throw "У Вас нет подходящей техники, для данного вида работы нужно иметь собственный самолет, приобрести который можно в магазине авиатехники!";

	private _VehDistance = player distance _vehicle;
	if (_VehDistance > 50) throw "Что-бы взять посылку, самолет должен быть рядом!";
	FinishPos = selectRandom getArray(missionconfigfile >> "CfgFlyDelivery" >> "life_FlyDPpoints");
	_vehicle setVariable ["already_delivers",true,true];
	private _distanceToFinish = _vehicle distance FinishPos;
	private _price = (round(_distanceToFinish / 1000) * 650);
	private _CruisingSpeed = getNumber(missionconfigfile >> "CfgFlyDelivery" >> "CruisingSpeed");
	private _NeedetTimeForOverPrice = time + (round(_distanceToFinish / 650) * _CruisingSpeed);
	task_flyDpActive = true;
	totalTime = _NeedetTimeForOverPrice;
	_localMarker = createMarkerLocal ["DP_marker",FinishPos];
	_localMarker setMarkerTypeLocal "mil_start";
	_localMarker setMarkerTextLocal "Доставьте поссылку на маркер!";
	arrowPointer = "Sign_Circle_F" createVehicleLocal [0,0,0];
	arrowPointer setPosWorld FinishPos;
	private _EVH = addMissionEventHandler ["Draw3D",{call RRPClient_FlyDP_draw3D}];
	["InfoTitleAndText", ["Диспетчер", format["<t>Рейс дальностью: <t color='#1dae0e'>%1км</t><br />Примерный гонорар: <t color='#1dae0e'>%2$</t><br /><br /> <br />. Легкого полета!</t>",(round(_distanceToFinish / 1000)),_price]]] call SmartClient_gui_toaster_addTemplateToast;
	[_price,_vehicle,_EVH,_localMarker] spawn RRPClient_FlyDP_CheckPoint;
}
catch
{
	["WarningTitleAndText", ["Внимание!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
