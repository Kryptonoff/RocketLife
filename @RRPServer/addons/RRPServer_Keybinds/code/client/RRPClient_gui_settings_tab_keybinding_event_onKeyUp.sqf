private["_caller","_keyCode","_shiftState","_controlState","_altState","_display","_listbox","_index","_text","_key","_removalIndex"];
if (RRPClientKeybindWaitingForKeypress) then
{
	disableSerialization;
	_caller = _this select 0;
	_keyCode = _this select 1;
	_shiftState = _this select 2;
	_controlState = _this select 3;
	_altState = _this select 4;
	_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
	_listbox = _display displayCtrl 23108;
	_index = lbCurSel _listbox;
	_text = "";
	if (_controlState) then
	{
		_text = _text + "CTRL + ";
	};
	if (_altState) then
	{
		_text = _text + "ALT + ";
	};
	if (_shiftState) then
	{
		_text = _text + "SHIFT + ";
	};
	if !(_keyCode in [0x2A,0x38,0x1D,0x36,0xB8,0x9D]) then
	{
		_key = _keyCode call RRPClient_util_keybinding_getStringedDik;
		_text = _text + _key;
		_listbox lbSetTextRight [_index,_text];
		_removalIndex = RRPClientKeybindCurrentBinds find RRPClientKeybindLastSelected;
		if !(_removalIndex isEqualTo -1) then
		{
			RRPClientKeybindCurrentBinds deleteAt _removalIndex;
		};
		if (_text in RRPClientKeybindCurrentBinds) then
		{
			_listbox lbSetColorRight [_index, [0.780, 0.149, 0.318, 1]];
		}
		else
		{
			RRPClientKeybindCurrentBinds pushbackUnique _text;
			_listbox lbSetColorRight [_index, [1,1,1,1]];
		};
		RRPClientKeybindWaitingForKeypress = false;
		_index = -1;
		{
			if ((_x select 0) isEqualTo RRPClientKeybindModifingID) exitWith
			{
				_index = _forEachIndex;
			};
		}
		forEach RRPClientKeybindModified;
		if (_index isEqualTo -1) then
		{
			RRPClientKeybindModified pushbackUnique [RRPClientKeybindModifingID,[_keyCode,[_shiftState,_controlState,_altState]]];
		}
		else
		{
			(RRPClientKeybindModified select _index) set [1,[_keyCode,[_shiftState,_controlState,_altState]]];
		};
		_listbox ctrlEnable true;
	};
};
true