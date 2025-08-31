/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/
params [
	["_success", false, [false]],
	["_prof","",[""]],
	["_neededXpToBuy", 0, [0]],
	["_message", "", [""]]
];

RRPClientAtmWaitingResponse = false;
closeDialog 0;

if (_success) then {
	[_prof, _neededXpToBuy, true] call RRPClient_skills_addXP;
	["saveXP",[_array]] call RRPClient_system_send;

	["SuccessTitleAndText",["Время сохранено!",format["Вы приобрели уровень навыка '%1'! Благодарим за поддержку!",getText(getMissionConfig "CfgSkills" >> _prof >> "displayName")]]] call SmartClient_gui_toaster_addTemplateToast;
} else {
	["Save time", _message] call toastError;	
};