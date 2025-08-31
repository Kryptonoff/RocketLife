
private _return = false;

if (!isNil "PhoneTaskForceRadioCall" && isNil "PhoneTaskForceRadioFreq") then {
	if !((PhoneTaskForceRadioCall select 0) isEqualTo netId player) then {
		disableSerialization;
		
		private _params = PhoneTaskForceRadioCall;
		
		if (!createDialog "FatumDialogCallPhone") exitWith {
			["ErrorTitleAndText",["Телефон","Окно не открылось"]] call SmartClient_gui_toaster_addTemplateToast;
		};
		private _display = findDisplay 2863;

		_params params ["_idToPlayer","_channel"];

		private _toPlayer = objectFromNetId _idToPlayer;
		
		private _btnRedCall = _display displayCtrl 2865;
		private _btnGreenCall = _display displayCtrl 2866;
		
		[name _toPlayer] spawn {
			disableSerialization;
		
			private _display = findDisplay 2863;
			private _info = _display displayCtrl 2864;
			
			ctrlSetText [7201, getText(missionConfigFile >> "LifeCfgPadSkins" >> life_myPadSkinID >> "image")];
			
			private _n = 0;
			
			private _name = _this select 0;
			
			while {!isNull _display} do {
				if (!isNil "PhoneTaskForceRadioFreq") exitWith {
					_info ctrlSetStructuredText parseText format["<br/><br/><br/><br/><br/><br/><t align='center' size='1.5'>%1</t>", _name];
				};
				
				private _dots = "";
				
				for "_i" from 1 to _n do {
					_dots = _dots + ".";
				};
			
				_info ctrlSetStructuredText parseText format["<br/><br/><br/><br/><br/><br/><t align='center' size='1.5'>Вызывает %1%2</t>", _name, _dots];
				
				if (_n isEqualTo 3) then { _n = 0; }else{ _n = _n + 1; };
				
				uiSleep 1;
			};
		};
		
		_btnRedCall ctrlAddEventHandler ["ButtonClick", {
			closeDialog 0;
			
			if (!isNil "PhoneTaskForceRadioCall") then {			
				_typeEnd = if (isNil "PhoneTaskForceRadioFreq") then {1.1}else{0.1};
				[_typeEnd] spawn TFAR_fnc_phoneCallEnd;
			};
		}];
		_btnGreenCall ctrlAddEventHandler ["ButtonClick", {
			[] spawn {
				
				if (TF_tangent_lr_pressed) then {
					call TFAR_fnc_onLRTangentReleased;
				};
				if (TF_tangent_lr_pressed) exitWith { 
					["ErrorTitleAndText",["Телефон","Выключите рацию чтобы ответить."]] call SmartClient_gui_toaster_addTemplateToast;
				};

				if (TF_tangent_sw_pressed) then {
					call TFAR_fnc_onSwTangentReleased;
				};
				if (TF_tangent_sw_pressed) exitWith { 
					["ErrorTitleAndText",["Телефон","Выключите рацию чтобы ответить."]] call SmartClient_gui_toaster_addTemplateToast;
				};
			
				disableSerialization;
				
				private _display = findDisplay 2863;
				private _btnRedCall = _display displayCtrl 2865;
				private _btnGreenCall = _display displayCtrl 2866;
				
				_btnGreenCall ctrlShow false;
				
				_btnRedCall ctrlSetFade 1;
				_btnRedCall ctrlCommit .5;			
				
				private _params = PhoneTaskForceRadioCall;
				_params params ["_idFromPlayer","_idToPlayer","_channel"];
				private _toPlayer = objectFromNetId _idFromPlayer;
				
				PhoneTaskForceRadioFreq = format ["%1|%2|0", _channel, call TFAR_fnc_getVolumePhone];
				
				[netId player, _channel] remoteExec ["TFAR_fnc_phoneCallTake", _toPlayer];
				
				_type = (call TFAR_fnc_getAllTheSounds) select (getNumber(missionConfigFile >> "Config_TFRtell" >> "typeSoundBeginTell"));
				
				private _COMMAND = format["TANGENT	PRESSED	%1	999999	%2",_channel,_type];
				"task_force_radio_pipe" callExtension _COMMAND;
				
				uiSleep .5;
				_btnRedCall ctrlSetPosition [0.4625,0.66,0.075,0.1];
				_btnRedCall ctrlCommit 0;
				
				_btnRedCall ctrlSetFade 0;
				_btnRedCall ctrlCommit .5;
			};
		}];

		_return = true;
	};
};

_return