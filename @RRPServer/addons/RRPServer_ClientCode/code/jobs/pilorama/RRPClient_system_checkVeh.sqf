_cond = false;
_cond =  if(life_job_car distance player > 15) then {true} else {false};

if (_cond) then {
    ["WarningTitleAndText", ["Внимание!", "Спец техника должа быть в радиусе 15 м от вас!"]] call SmartClient_gui_toaster_addTemplateToast;	
	};

_cond 