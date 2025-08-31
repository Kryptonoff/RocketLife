try{

	if (count RRPClientGroupInfo isEqualTo 0) throw "Вы не в организации";
	if (call RRPClient_groups_isPrem) throw "Официальную организацию нельзя упразднить";
	private _leader = RRPClientGroupInfo get "leader";
	if (getPlayerUID player isNotEqualTo _leader) throw "Только глава может распустить организацию";

	[
		(uiNamespace getVariable ["RRPDialogTablet",displayNull]),
		{
			["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
			["disbandRequest", []] call RRPClient_system_send
		},[],
		"Упразднить организацию?",
		format ["Вы уверены что хотите упразднить организацию %1? Это действие необратимо!", (RRPClientGroupInfo get "name")]
	] call RRPClient_util_prompt;
}catch{
	["Организация",_exception] call toastError;
};
true