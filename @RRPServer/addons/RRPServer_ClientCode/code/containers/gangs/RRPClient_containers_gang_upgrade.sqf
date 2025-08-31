/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
params [
	"_action",
	["_object",cursorObject] 
];

try{
	switch _action do
	{
		case "request": {
			if (RRPClientAtmWaitingResponse) throw "Сервер еще не обработал ваш запрос";
			life_gang_box = _object;
			if (isNull life_gang_box) throw "Ящик не определен";
			_cost = getNumber(getMissionConfig "ptw" >> "costUpgradeGroupBox");
			if (RRPClientCredits < _cost) throw format ["Недостаточно RC для покупки, стоимость улучшения составляет %1 RC",_cost];

			[
				(findDisplay 46),
				{
					["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
					[SessionId,life_gang_box] remoteExecCall ["RRPServer_containers_gang_upgrade",2];
				},[],
				"Улучшить?",
				format ["Улучшить ящик организации? Стоимость 1-го слота (200 предметы / 1000 ресурсы) составляет - %1 RC",_cost]
			] call RRPClient_util_prompt;
		};
		case "response": {
			private _gangBoxSlots = life_gang_box getVariable ["slots",0];
			private _gangBoxInventory = life_gang_box getVariable ["inventory",[[],0]];
			private _currentWeight = _gangBoxInventory select 1;
			RRPClientAtmWaitingResponse = false;
			["SuccessTitleAndText",["Хранилище","Вы добавили 1 слот в ваше хранилище"]] call SmartClient_gui_toaster_addTemplateToast;
			if !(isNull (uiNamespace getVariable ["RRPDialogContainerManage",displayNull])) then 
			{
				["refreshDialog"] call RRPClient_containers_gang_manage;
			};
		};
		case "error": {
			RRPClientAtmWaitingResponse = false;
			throw (param [1,"",[""]]);
		};
	};
}catch{
	["ErrorTitleAndText",["Хранилище",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
