/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
	if !(call RRPClient_groups_isPrem) throw "Эта функция доступна только для премиальных организаций";
	private _post = (getPlayerUID player) call RRPClient_groups_getPostGroup;
	if !(_post isEqualTo 1) throw "Сбросить разрешения может только глава организации!";
	[
		(uiNamespace getVariable ["RRPDialogTablet",displayNull]),
		{
			["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
			["dropPermissions",[]] call RRPClient_system_send;
		},[],
		"Сбросить?",
		"Вы уверены что хотите сбросить все настройки званий?"
	] call RRPClient_util_prompt;
}catch{
	["ErrorTitleAndText", ["Организация", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
