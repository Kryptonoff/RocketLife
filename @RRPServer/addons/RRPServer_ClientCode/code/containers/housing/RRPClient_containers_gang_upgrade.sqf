/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
params [
	"_action"
];

try{
	switch _action do
	{
		case "request": {
			if (RRPClientAtmWaitingResponse) throw "Сервер еще не обработал ваш запрос";
			if (isNull life_gang_box) throw "Ящик не определен";
			
			_cost = getNumber(getMissionConfig "ptw" >> "costUpgradeGroupBox");
			if (RRPClientCredits < _cost) throw format ["Недостаточно RC для покупки, стоимость улучшения составляет %1 RC",_cost];

			[
				(uiNamespace getVariable ["RRPDialogGangContainer",displayNull]),
				{
					["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
					[SessionId,life_gang_box] remoteExecCall ["RRPServer_containers_gang_upgrade",2];
				},[],
				"Улучшить?",
				format ["Улучшить ящик организации? Стоимость 1-го слота составляет %1 RC",_cost]
			] call RRPClient_util_prompt;
		};
		case "response": {
			private _gangBoxSlots = life_gang_box getVariable ["slots",0];
			private _gangBoxInventory = life_gang_box getVariable ["inventory",[[],0]];
			private _currentWeight = _gangBoxInventory select 1;
			
			private _maxWeight = (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_trunkInventoryWeight")) * _gangBoxSlots;
			_gangBoxWeight = ((findDisplay 4800) displayCtrl 4804);
			_gangBoxWeight ctrlSetText format["Вес: %1/%2",_currentWeight,_maxWeight];
			RRPClientAtmWaitingResponse = false;
			["SuccessTitleAndText",["Хранилище","Вы добавили 1 слот в ваше хранилище"]] call SmartClient_gui_toaster_addTemplateToast;
		};
		case "error": {
			RRPClientAtmWaitingResponse = false;
			throw (param [1,"",[""]]);
		};
	};
}catch{
	["ErrorTitleAndText",["Хранилище",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};