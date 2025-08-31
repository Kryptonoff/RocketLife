/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
params [
	["_action","request"],
	["_box",objNull,[objNull,""]],
	["_error","",[""]]
];
try
{
	switch (_action) do 
	{
		case "request": {
			if !(isNull (uiNamespace getVariable ["RRPDialogGangContainer",displayNull])) throw "Вы уже взаимодействуете с инвентарем";
			if (RRPClientAtmWaitingResponse) throw "Сервер еще не обработал ваш запрос";
			if (_box isEqualType "") then {_box = missionNamespace getVariable [_box,objNull]};
			RRPClientAtmWaitingResponse = true;
			[SessionId,_box] remoteExecCall ["RRPServer_containers_gang_openMenu",2];
		};
		case "response": {
			life_gang_box = _box;
			createDialog "RRPDialogGangContainer";
			true call RRPClient_gui_util_blur;
			
			_display = uiNamespace getVariable ["RRPDialogGangContainer",displayNull];
			
			/*
				_upg = _display ctrlCreate ["RscButtonUC",-1];
				_upg ctrlSetText "Улучшить";
				_upg ctrlAddEventHandler ["ButtonClick","['request'] call RRPClient_containers_gang_upgrade"];
				_upg ctrlSetPosition [0.775,0.9,0.2,0.06];
				_upg ctrlCommit 0;
			*/

			private _takeButton = _display displayCtrl 4809;
			_takeButton ctrlRemoveAllEventHandlers "ButtonClick";
			_takeButton ctrlAddEventHandler ["ButtonClick","['request'] call RRPClient_containers_gang_take"];

			[player,"house_cont"] remoteExecCall ["RRPClient_system_say3d",0];

			_title = _display displayCtrl 4801;
			_filters = _display displayCtrl 4807;
			_title ctrlSetText "Хранилище банды";

			_filters lbAdd "Все снаряжение";
			_filters lbAdd "Амуниция";
			_filters lbAdd "Оружие";
			_filters lbAdd "Боеприпасы";
			_filters lbAdd "Обвес";
			_filters lbAdd "Предметы";
			_filters lbSetCurSel 0;
			RRPClientAtmWaitingResponse = false;
			[
				{isNull (uiNamespace getVariable ["RRPDialogGangContainer",displayNull])},
				{["unload",life_gang_box] call RRPClient_containers_gang_openMenu}
			] call CBA_fnc_waitUntilAndExecute;
		};
		case "unload": {
			false call RRPClient_gui_util_blur;
			life_gang_box setVariable ["trunk_inUseBy",nil,true];
			life_gang_box = objNull;
			RRPClientAtmWaitingResponse = false;
		};
		case "error": {
			RRPClientAtmWaitingResponse = false;
			["ErrorTitleAndText",["Хранилище",_error]] call SmartClient_gui_toaster_addTemplateToast;
		};
	};
}catch{ 
	["ErrorTitleAndText",["Хранилище",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
