/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_cost"];
try
{	
	throw "Услуга в данный момент недоступна";
	_cost = call RRPClient_groups_calcUpgrade;
	if (RRPClientCredits < _cost) throw format ["У вас недостаточно средств! Стоимость слота составляет %1 RC",_cost];

	[ 
		(uiNamespace getVariable ["RRPDialogTablet",displayNull]), 
		{ 
		  ["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast; 
		  ["upgradeRequest",[_this select 0]] call RRPClient_system_send; 
		},[_cost],
		"Выгнать?", 
		format["Вы хотите добавить один слот в организацию '%1'? Это действие обойдется вам в %2 RC",RRPClientGroupInfo get "name", _cost] 
	  ] call RRPClient_util_prompt; 

}catch{
	["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true