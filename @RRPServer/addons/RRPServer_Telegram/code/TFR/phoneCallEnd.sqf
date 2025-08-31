params ["_type"];

switch _type do {
	case 0: {	//Закончен звонок
		private _channel = PhoneTaskForceRadioCall select 2;
		
		private _type = (call TFAR_fnc_getAllTheSounds) select (getNumber(missionConfigFile >> "Config_TFRtell" >> "typeSoundEndTell"));
		private _COMMAND = format["TANGENT	RELEASED	%1	999999	%2",_channel,_type];
		"task_force_radio_pipe" callExtension _COMMAND;
		
		PhoneTaskForceRadioFreq = nil;
		
		disableSerialization;
		private _display = findDisplay 2863;
		if (!isNull _display) then {
			closeDialog 0;
		};
	};
	case 0.1: {
		private _channel = PhoneTaskForceRadioCall select 2;
	
		private _type = (call TFAR_fnc_getAllTheSounds) select (getNumber(missionConfigFile >> "Config_TFRtell" >> "typeSoundEndTell"));
		private _COMMAND = format["TANGENT	RELEASED	%1	999999	%2",_channel,_type];
		"task_force_radio_pipe" callExtension _COMMAND;
		
		PhoneTaskForceRadioFreq = nil;
	
		[0] remoteExec ["TFAR_fnc_phoneCallEnd", (objectFromNetId (PhoneTaskForceRadioCall select 0))];
	};
	
	
	
	case 1: {	//Игрок нажал отбить звонок
		_target = objectFromNetId (PhoneTaskForceRadioCall select 1);
		["ErrorTitleAndText",["Телефон",format ["%1 отбил звонок",name _target]]] call SmartClient_gui_toaster_addTemplateToast;		

	};
	case 1.1: {
		[1] remoteExec ["TFAR_fnc_phoneCallEnd", objectFromNetId (PhoneTaskForceRadioCall select 0)];
	};
	
	
	
	case 2: {	//Занято
		_target = objectFromNetId (PhoneTaskForceRadioCall select 1);
		["ErrorTitleAndText",["Телефон",format ["Не удалось дозвонится. %1 уже с кем-то говорит", name _target]]] call SmartClient_gui_toaster_addTemplateToast;
	};
	
	
	
	case 3: {	//Игрок вышел, умер или изчез
		["ErrorTitleAndText",["Телефон","Не удалось дозвонится."]] call SmartClient_gui_toaster_addTemplateToast;		
		_target = objectFromNetId (PhoneTaskForceRadioCall select 1);
		if (!isNull _target) then {
			[3.1] remoteExec ["TFAR_fnc_phoneCallEnd", _target];
		};
	};
	case 3.1: {

	};
	
	
	
	case 4: {	//Игрок долго не брал трубку
		["ErrorTitleAndText",["Телефон","Не удалось дозвонится."]] call SmartClient_gui_toaster_addTemplateToast;

		[4.1] remoteExec ["TFAR_fnc_phoneCallEnd", objectFromNetId (PhoneTaskForceRadioCall select 1)];
	};
	case 4.1: {
		//["До вас не удалось дозвонится.",""] call client_system_hint;
	};
};

PhoneTaskForceRadioCall = nil;