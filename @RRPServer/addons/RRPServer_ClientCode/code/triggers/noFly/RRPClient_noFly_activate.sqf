
private ["_handle"];

_handle = [] spawn {
	["InfoTitleAndText",["Бесполетная зона!","Над этой территорией полёты запрещены! У вас есть 10 секунд чтобы покинуть территорию или будете сбиты!"]] call SmartClient_gui_toaster_addTemplateToast;
	uiSleep 11;
	(vehicle player) setDamage 0.91;
};

[_handle]
