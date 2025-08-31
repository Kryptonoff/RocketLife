/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
	["_object", objNull, [objNull]],
	["_refinery_control", objNull, [objNull]],
	["_refinery_var", "", [""]],
	["_object_name", "", [""]]
];

private _ref_status = _refinery_control getVariable ["ref_status", ""];

if !(_ref_status in ["RValve", "Machine", "SValve", "Control"]) exitWith {
	["WarningTitleAndText", ["Захват", "Захват не запущен, что бы его отменить идите к блоку управления, который находится в ангаре!"]] call SmartClient_gui_toaster_addTemplateToast;
};

private _time = switch (true) do {
    case ((call (life_adminlevel) > 4) and !((getPlayerUID player) isEqualTo "76561197984276591")): {getNumber(missionConfigFile >> "cfgRefinery" >> "captureTimeDev")};
	case ((player call getSide) isEqualTo "cop "): {getNumber(missionConfigFile >> "cfgRefinery" >> "captureTimeCop")};
	default {getNumber(missionConfigFile >> "cfgRefinery" >> "captureTime")};
};

switch (_object_name) do {
	case "storage_valve": {
		if !(_ref_status isEqualTo "SValve") exitWith {
			["WarningTitleAndText", ["Ошибка!", "Начать захват можно с пульта управления"]] call SmartClient_gui_toaster_addTemplateToast;
		};
		if ([_time, "Захватываю кран #1..."] call RRPClient_system_actionProgress) then {
				["SuccessTitleAndText", ["Захват!", "Вы открыли кран #1! Бегите к крану #2.."]] call SmartClient_gui_toaster_addTemplateToast;
				_refinery_control setVariable ["ref_status", "Machine", true];
			} else {
				["WarningTitleAndText", ["Ошибка!", "Вы отменили действие"]] call SmartClient_gui_toaster_addTemplateToast;
			};
	};

	case "refine_machine": {
		if !(_ref_status isEqualTo "Machine") exitWith {
			["WarningTitleAndText", ["Ошибка!", "Сначала захватитите кран #1"]] call SmartClient_gui_toaster_addTemplateToast;
		};
		if ([_time, "Захватываю кран #2..."] call RRPClient_system_actionProgress) then {
			_refinery_control setVariable ["ref_status", "RValve", true];
			["SuccessTitleAndText", ["Захват!", "Вы открыли кран #2! Бегите к крану #3.."]] call SmartClient_gui_toaster_addTemplateToast;
		} else {
			["WarningTitleAndText", ["Ошибка!", "Вы отменили действие"]] call SmartClient_gui_toaster_addTemplateToast;
		};
	};

	case "refine_valve": {
		if !(_ref_status isEqualTo "RValve") exitWith {
			["WarningTitleAndText", ["Захват", "Сначала захватитите кран #2"]] call SmartClient_gui_toaster_addTemplateToast;
		};

		if ([_time, "Захватываю кран #3..."] call RRPClient_system_actionProgress) then {
			_refinery_control setVariable ["ref_status", "Control", true];
			["SuccessTitleAndText", ["Захват!", 'Вы открыли кран #3! Бегите к пульту управления и заканчивайте захват!']] call SmartClient_gui_toaster_addTemplateToast;
		} else {
			["WarningTitleAndText", ["Ошибка!", "Вы отменили действие"]] call SmartClient_gui_toaster_addTemplateToast;
		};
	};

	case "control": {
		if (_refinery_control getVariable ["ref_status","Control"] isEqualTo "Control") then {
			[_refinery_control, _refinery_var, RRPClientGroupInfo get "name", (player getVariable ["groupID",-1]), RRPClientGroupInfo get "premialVar"] remoteExecCall ["RRPServer_refinery_capture", 2];
			_refinery_control setVariable ["ref_status", "Captured", true];
			_refinery_control setVariable ["ref_status", "ref_canCaptured", false];
		} else {
			["WarningTitleAndText", ["Захват", "Сначала захватите кран # 3"]] call SmartClient_gui_toaster_addTemplateToast;
		};
	};

	default {
		["ErrorTitleAndText", ["Ошибка!", "Взаимодействие с этим элементом не требуется на данном этапе"]] call SmartClient_gui_toaster_addTemplateToast;
	};
};
