params ["_idTarget","_channel"];
private _target = objectFromNetId _idTarget;

if (isNil "PhoneTaskForceRadioCall") exitWith {};

if (TF_tangent_lr_pressed) then {
	call TFAR_fnc_onLRTangentReleased;
};
if (TF_tangent_lr_pressed) exitWith { 
	["ErrorTitleAndText",["Телефон","Выключите рацию и наберите снова"]] call SmartClient_gui_toaster_addTemplateToast;
	[0] remoteExec ["TFAR_fnc_phoneCallEnd", (objectFromNetId (PhoneTaskForceRadioCall select 1))];
};

if (TF_tangent_sw_pressed) then {
	call TFAR_fnc_onSwTangentReleased;
};
if (TF_tangent_sw_pressed) exitWith {
	["ErrorTitleAndText",["Телефон","Выключите рацию и наберите снова"]] call SmartClient_gui_toaster_addTemplateToast;
	[0] remoteExec ["TFAR_fnc_phoneCallEnd", (objectFromNetId (PhoneTaskForceRadioCall select 1))];
};

PhoneTaskForceRadioFreq = format ["%1|%2|0", _channel, call TFAR_fnc_getVolumePhone];

private _type = (call TFAR_fnc_getAllTheSounds) select (getNumber(missionConfigFile >> "Config_TFRtell" >> "typeSoundBeginTell"));

private _COMMAND = format["TANGENT	PRESSED	%1	999999	%2",_channel,_type];
"task_force_radio_pipe" callExtension _COMMAND;
