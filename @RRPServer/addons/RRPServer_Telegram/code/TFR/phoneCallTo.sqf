params ["_idToPlayer","_channel"];

private _toPlayer = objectFromNetId _idToPlayer;
private _name = name _toPlayer;

if (!isNil "PhoneTaskForceRadioCall") exitWith {
	["InfoTitleAndText",["Телефон",format ["Вам только что звонил %1",_name]]] call SmartClient_gui_toaster_addTemplateToast;
	[2] remoteExec ["TFAR_fnc_phoneCallEnd", _toPlayer];
};

PhoneTaskForceRadioCall = _this;

["InfoTitleAndText",["Телефон",format ["Вам звонит %1, чтобы ответить, намжите кнопку T",_name]]] call SmartClient_gui_toaster_addTemplateToast;

[] spawn {
	private _timeStartCall = 0;
	private _timeStartVibr = 0;
	private _soundTo = getText(missionConfigFile >> "Config_TFRtell" >> "soundCallTo");
	private _soundVibr = getText(missionConfigFile >> "Config_TFRtell" >> "soundVibrating");
	private _timeSoundTo = getNumber(missionConfigFile >> "Config_TFRtell" >> "timeSoundCallTo");
	private _timeSoundVibr = getNumber(missionConfigFile >> "Config_TFRtell" >> "timeSoundVibrating");

	for "_i" from 0 to 1 step 0 do {
		
		if (time - _timeStartCall >= _timeSoundTo) then {
			playSound _soundTo;
			_timeStartCall = time;
		};
		if (time - _timeStartVibr >= _timeSoundVibr) then {
			playSound _soundVibr;
			_timeStartVibr = time;
		};
		
		if (isNil "PhoneTaskForceRadioCall") exitWith {};
		if (!isNil "PhoneTaskForceRadioFreq") exitWith {};
		
		uiSleep 1;
	};
};
