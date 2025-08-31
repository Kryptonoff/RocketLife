/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if(_this select 0)then
{
	["SuccessTitleAndText", ["Добро пожаловать!", "Вы приняли приглашение в организацию!"]] call SmartClient_gui_toaster_addTemplateToast;
	call RRPClient_tags_setTags;
	call RRPClient_system_setTag;
	call RRPClient_groups_setLicense;
	call RRPClient_groups_salaryHandler;
}
else
{
	["InfoTitleAndText", ["Не сегодня!", "Вы отказались от вступления в организацию!"]] call SmartClient_gui_toaster_addTemplateToast;
};
true
