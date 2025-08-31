params ["_target"];

if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};

if (!isNil "PhoneTaskForceRadioCall") exitWith {
	["ErrorTitleAndText",["Телефон","Вы уже разговариваете"]] call SmartClient_gui_toaster_addTemplateToast;
};

private _channel = format ["%1-call-%2", profileName, name _target];

private _arr = [netId player, netId _target, _channel];
_arr remoteExec ["TFAR_fnc_phoneCallTo", _target];

["InfoTitleAndText",["Телефон",format ["Набираю %1...", name _target]]] call SmartClient_gui_toaster_addTemplateToast;		


PhoneTaskForceRadioCall = _arr;

[_target] spawn {
	params ["_target"];

	private _timeStartCall = 0;
	private _soundFrom = getText(missionConfigFile >> "Config_TFRtell" >> "soundCallFrom");
	private _timeSoundCallFrom = getNumber(missionConfigFile >> "Config_TFRtell" >> "timeSoundCallFrom");
	private _timerCall = getNumber(missionConfigFile >> "Config_TFRtell" >> "timerCall");
	private _startCall = time;
	
	for "_i" from 0 to 1 step 0 do {
		
		if (isNull _target) exitWith {[3] spawn TFAR_fnc_phoneCallEnd;};
		if (_target getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) exitWith {[3] spawn TFAR_fnc_phoneCallEnd;};
		if ((time - _startCall) >= _timerCall) exitWith {[4] spawn TFAR_fnc_phoneCallEnd;};
		
		if (isNil "PhoneTaskForceRadioCall") exitWith {};
		if (!isNil "PhoneTaskForceRadioFreq") exitWith {};
		
		if (time - _timeStartCall >= _timeSoundCallFrom) then {
			playSound _soundFrom;
			_timeStartCall = time;
		};
		
		uiSleep 1;
	};
};
