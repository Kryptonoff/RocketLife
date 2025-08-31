/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogRewards",displayNull];
params [
	["_bool",false,[false]],
	["_color","",[""]],
	["_type","",[""]],
	["_selectitem",[],[[]]]
];
if !(_bool) exitWith {RRPClient_temp_haveGift = true;};
try
{
	if (isNil "RRPClent_temp_buttonLoot") throw "Control not defined";
	if (_color isEqualTo "") throw "Color is empty";
	if (_type isEqualTo "") throw "Type is empty";
	if (_selectitem isEqualTo []) throw "Select item is empty";
	_control = RRPClent_temp_buttonLoot#0;
	_control ctrlSetText (_selectitem#1);
	_control ctrlRemoveAllEventHandlers "MouseEnter";
	
	RRPClient_temp_haveGift = true;
	switch (_type) do
	{
		case "money": 
		{
			["SuccessTitleAndText",["Поздравляем!",format 
				[
					"Вы выиграли %2<br/>$%1<br/>Возвращайтесь завтра!",
					_selectitem # 0,
					getText(missionConfigFile >> "CfgLootBox" >> _color >> "name")
				]]] call SmartClient_gui_toaster_addTemplateToast;
		};
		case "vehicles": 
		{
			["SuccessTitleAndText",["Поздравляем!",format 
				[
					"Вы выиграли %2<br/>%1<br/>Возвращайтесь завтра!",
					getText(configFile >> "CfgVehicles" >> _selectitem # 0 >> "displayName"),
					getText(missionConfigFile >> "CfgLootBox" >> _color >> "name")
				]]] call SmartClient_gui_toaster_addTemplateToast;
		};
		case "item": 
		{
			["SuccessTitleAndText",["Поздравляем!",format 
				[
					"Вы выиграли %2<br/>%1<br/>Возвращайтесь завтра!",
					getText(configFile >> "CfgMagazines" >> _selectitem # 0 >> "displayName"),
					getText(missionConfigFile >> "CfgLootBox" >> _color >> "name")
				]]] call SmartClient_gui_toaster_addTemplateToast;
		};
		default {["InfoTitleAndText",["Что-то не так...",format ["R:%1",_type]]] call SmartClient_gui_toaster_addTemplateToast;}
	};
	RRPClient_temp_waitGift = false;
}catch{
	["ErrorTitleOnly",[_exception]] call SmartClient_gui_toaster_addTemplateToast;
	comment "Потребуется релог, TODO";
};
