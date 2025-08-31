/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
	["_object", objNull, [objNull]],
	["_object_name", "", [""]]
];

try {
	if (count RRPClientGroupInfo isEqualTo 0) throw "Взаимодействие лабораторией доступно только членам группировок";

	private ["_refinery_var"];
	_refinery_var = switch (true) do {
		case (_object in [ref1_control, ref1_refine_valve, ref1_refine_machine, ref1_storage_valve]): {"ref1"};
		case (_object in [ref2_control, ref2_refine_valve, ref2_refine_machine, ref2_storage_valve]): {"ref2"};
		case (_object in [ref3_control, ref3_refine_valve, ref3_refine_machine, ref3_storage_valve]): {"ref3"};
		case (_object in [ref4_control, ref4_refine_valve, ref4_refine_machine, ref4_storage_valve]): {"ref4"};
		default {""};
	};

	private ["_ref_status","_action","_refinery_control","_ref_license","_controls"];
	_refinery_control = missionNamespace getVariable [format["%1_control", _refinery_var], objNull];
	if (isNull _refinery_control) throw "_refinery_control isNull";

	_ref_status = _refinery_control getVariable ["ref_status", "Captured"];
	_ref_license = _refinery_control getVariable ["ref_license", ""];
	_controls = ["ref1_control","ref2_control","ref3_control","ref4_control"];

	if !(_refinery_control getVariable ["ref_canCaptured",false]) exitWith {
		["WarningTitleAndText", [_refinery_control getVariable ["ref_name", "Нарколаба"], "Уже захвачена, приходите на следующей буре!"]] call SmartClient_gui_toaster_addTemplateToast;
	};

	if !(((player call getSide isEqualTo 'cop') AND ([getText(missionConfigFile >> "cfgRefinery" >> "conditionCOP")] call RRPClient_util_conditionsCheck)) OR !(player call getSide isEqualTo 'cop')) exitWith {
		["WarningTitleAndText", ["Захват", getText(missionConfigFile >> "cfgRefinery" >> "conditionMsgCOP")]] call SmartClient_gui_toaster_addTemplateToast;
	};

	if (license_press OR license_ems) exitWith {
		["WarningTitleAndText", ["Захват", "Вам такое захватить не по зубам..."]] call SmartClient_gui_toaster_addTemplateToast;
	};

	if ((_ref_status isEqualTo "Captured") AND (vehicleVarName _object) in _controls) exitWith {
		if (missionNamespace getVariable [format ["license_%1",_ref_license],false]) exitWith {
			["ErrorTitleAndText", [_refinery_control getVariable ["ref_name", "Нарколаба"], "Уже находится под вашим контролем"]] call SmartClient_gui_toaster_addTemplateToast;
		};

		if !(
			((RRPPublicTime # 3) in [21,22,23,24]) OR
			((call (life_adminlevel) > 3) and !((getPlayerUID player) isEqualTo "76561197984276591"))
		) exitWith {
			["ErrorTitleAndText", [_refinery_control getVariable ["ref_name", "Нарколаба"], "Захват доступен с 21:00 до 00:00"]] call SmartClient_gui_toaster_addTemplateToast;
		};

		private _text = "Захват нарколабы происходит в следующей последовательности:<br/>1. Вам нужно поочердно открыть 3 вентиля<br/>2. Защищать блок управления (В случае чего, любой игрок может отменить захват с его помощью)<br/>3. Вернуться сюда к блоку управления и взять под котроль.<br/><br/>Захват начнется, как только вы нажмете 'Да'<br/>Вы уверены, что хотите начать захват?";
		 _action = [_text, "Захват НПЗ", "Да", "Нет"] call BIS_fnc_guiMessage;

		if (_action) then {
			_refinery_control setVariable ["ref_status", "SValve", true];
			_refinery_control setVariable ["ref_capturedOrgnName",(RRPClientGroupInfo get "name"), true];
			[(_refinery_control getVariable ["ref_name", "Нарколаба"]),format ["Организация %1 начала захват нарколабы",(RRPClientGroupInfo get "name")]] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];
		};
	};

	if (_ref_status in ["RValve", "Machine", "SValve", "Control"]) exitWith {
		if ((_refinery_control getVariable ["ref_capturedOrgnName",""]) isEqualTo (RRPClientGroupInfo get "name")) then {
			[_object, _refinery_control, _refinery_var, _object_name] call RRPCLient_refinery_captureProcess;
		} else {
			if !((vehicleVarName _object) in _controls) then {
				["WarningTitleAndText", ["Захват", "Что бы перебить захват, отправляйтесь к блоку управления, который находится в ангаре!"]] call SmartClient_gui_toaster_addTemplateToast;
			} else {
				if ([if ((call (life_adminlevel) > 3) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {5} else {60}, "Срываю захват..."] call RRPClient_system_actionProgress) then {
					[
						"InfoTitleAndText",
						[
							_refinery_control getVariable ["ref_name", "Нарколаба"],
							"Захват предотвращен!"
						]
					] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",-2];

					[(_refinery_control getVariable ["ref_name", "Нарколаба"]),"Захват предотвращен!"] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];

					_refinery_control setVariable ["ref_capturedOrgnName",nil, true];
					_refinery_control setVariable ["ref_status","Captured", true];
				};
			};
		};
	};

	["InfoTitleAndText", ["Нарколаба", "Для взаимодействия вам нужно подойти к пульту управления который стоит в белом ангаре!"]] call SmartClient_gui_toaster_addTemplateToast;

} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
