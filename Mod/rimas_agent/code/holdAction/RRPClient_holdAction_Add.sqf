params[
	["_target", objNull, [objNull]], 
	["_title", "MISSING TITLE", [""]], 
	["_iconIdle", "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa", [""]], 
	["_iconProgress", "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa", [""]], 
	["_condShow", "true", [""]], 
	["_condProgress", "true", [""]], 
	["_codeStart", {},[{}]], 
	["_codeProgress", {},[{}]], 
	["_codeCompleted", {},[{}]], 
	["_codeInterrupted", {},[{}]], 
	["_arguments", [],[[]]], 
	["_duration", 10, [0, {}]], 
	["_priority", 1000, [0]], 
	["_removeCompleted", true, [true]], 
	["_showUnconscious", false, [true]], 
	["_showWindow", true, [true]]
];

private _keyNameRaw = actionKeysNames["Action", 1, "Keyboard"];
private _keyName = _keyNameRaw select[1, count _keyNameRaw - 2];
private _keyNameColored = format["<t color='#ffae00'>%1</t>", _keyName];
private _hint = format[localize "STR_A3_HoldKeyTo", _keyNameColored, _title];
_hint = format["<t font='RobotoCondensedBold'>%1</t>", _hint];
_title = format["<t color='#FFFFFF' align='left'>%1</t><t color='#83ffffff' align='right'>%2</t>", _title, _keyName];
_iconIdle = format["<img size='3' color='#ffffff' image='%1'/>", _iconIdle];
_iconProgress = format["<img size='3' color='#ffffff' image='%1'/>", _iconProgress];
if !(uiNamespace getVariable['holdAction_set', false]) then {
	private _texturesProgress = [];
	private _texturesIdle = [];
	private _texturesIn = [];
	for "_i" from 0 to 24 do {
		_texturesProgress pushBack(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\progress\progress_%1_ca.paa'/>", _i])
	};
	for "_i" from 0 to 11 do {
		private _alpha = (sin((_i / 11) * 360) * 0.25) + 0.75;
		private _color = [1, 1, 1, _alpha] call bis_fnc_colorRGBAtoHTML;
		_texturesIdle pushBack(format["<img size='3' shadow='0' color='%2' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\in\in_0_ca.paa'/>", _i, _color]);
	};
	for "_i" from 0 to 3 do {
		_texturesIn pushBack(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\in\in_%1_ca.paa'/>", _i]);
	};
	uiNamespace setVariable['holdAction_texturesProgress', _texturesProgress];
	uiNamespace setVariable['holdAction_texturesIdle', _texturesIdle];
	uiNamespace setVariable['holdAction_texturesIn', _texturesIn];
	uiNamespace setVariable['holdAction_set', true];
};
_arguments resize 10;
_arguments = _arguments + [_target, _title, _iconIdle, _iconProgress, _condShow, _condProgress, _codeStart, _codeProgress, _codeCompleted, _codeInterrupted, _duration, _removeCompleted, _hint];

private _codeInit = {
	if (!isNil "holdAction_scriptHandle" && {!scriptDone holdAction_scriptHandle}) exitWith {};
	holdAction_scriptHandle = _this spawn {
		params[["_target", objNull, [objNull]], ["_caller", objNull, [objNull]], ["_actionID", 0, [0]], ["_arguments", [],[[]]]];
		_arguments params["_a0", "_a1", "_a2", "_a3", "_a4", "_a5", "_a6", "_a7", "_a8", "_a9", "_target", "_title", "_iconIdle", "_iconProgress", "_condShow", "_condProgress", "_codeStart", "_codeProgress", "_codeCompleted", "_codeInterrupted", "_duration", "_removeCompleted", "_hint"];
		private _condProgressCode = compile _condProgress;
		private _object = cursorObject;
		for "_i"
		from 0 to 3 do {
			uiSleep 0.05;
			[_target, _actionID, _title, _iconIdle, uiNamespace getVariable['holdAction_texturesIn', []], _i] call RRPClient_holdAction_IconChangeState;
		};
		[_target, _caller, _actionID, _arguments]
		call _codeStart;
		private _frame = 0;
		private _timeStart = diag_tickTime;
		private _timeNextStep = diag_tickTime;
		if (_duration isEqualType {}) then {
			_duration = call _duration
		};
		private _stepDuration = _duration / 24;
		while {call _condProgressCode && {_frame < 24}} do {
			_timeNextStep = _timeStart + (_frame * _stepDuration);
			private _timeDiff = round(((_duration - (diag_tickTime - _timeStart)) max 0));
			waitUntil {diag_tickTime >= _timeNextStep || {(inputAction "Action" < 0.5 && {inputAction "ActionContext" < 0.5}) || {isNil {call _condProgressCode}} || {visibleMap || {!(call _condProgressCode)}}}};
			if (diag_tickTime < _timeNextStep) exitWith {};
			_frame = _frame + 1;
			[_target, _actionID, _title, _iconProgress, uiNamespace getVariable['holdAction_texturesProgress', []], _frame, format["<t size ='1'>%1</t><br/><br/><br/>%2", _timeDiff, _hint], true] call RRPClient_holdAction_IconChangeState;
			[_target, _caller, _actionID, _arguments, _frame, 24] call _codeProgress;
		};
		if (_frame == 24) then {
			uiSleep _stepDuration;
			if (_removeCompleted) then {
				_target removeAction _actionID
			};
			[_target, _caller, _actionID, _arguments] call _codeCompleted;
		} else {
			[_target, _caller, _actionID, _arguments] call _codeInterrupted
		};
		[_target, _actionID, _title, _iconIdle, uiNamespace getVariable['holdAction_texturesIdle', []], 0, _hint] call RRPClient_holdAction_IconChangeState;
	};
};
_condShow = format["_target = _originalTarget; _eval = %1; [""%2"",""%3"",""%4""] call RRPClient_holdAction_AnimationState; _eval", _condShow, _title, _iconIdle, _hint];
private _actionID = _target addAction[_title, _codeInit, _arguments, _priority, _showWindow, false, "", _condShow, 15, _showUnconscious, ""];
[_target, _actionID, _title, _iconIdle, uiNamespace getVariable['holdAction_texturesIdle', []], 0, _hint] call RRPClient_holdAction_IconChangeState;
_actionID