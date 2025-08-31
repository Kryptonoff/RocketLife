private["_id","_keybind","_downHash","_upHash","_keybindsArr","_data","_category","_keyID","_index","_actionsArray","_actionIndex","_actionHash"];
try
{
	{
		_id = _x select 0;
		_keybind = _x select 1;
		_downHash = RRPClientKeybindsDown getVariable _id;
		_upHash = RRPClientKeybindsUp getVariable _id;
		if !((isNil "_downHash") && (isNil "_upHash")) then
		{
			_downHash set [1,_keybind];
			_upHash set [1,_keybind];
			RRPClientKeybindsDown setVariable [_id,_downHash];
			RRPClientKeybindsUp setVariable [_id,_upHash];
			_keybindsArr = profileNameSpace getVariable ["ExileLifeKeybinds",[]];
			if (_keybindsArr isEqualTo []) throw "Нечего сохранять";
			_data = _id splitString "_";
			_category = _data select 0;
			_keyID = _data select 1;
			_index = (_keybindsArr select 0) find _category;
			if (_index isEqualTo -1) throw "Не обнаружена категория";
			_actionsArray = (_keybindsArr select 1) select _index;
			_actionIndex = (_actionsArray select 0) find _keyID;
			if (_index isEqualTo -1) throw "Не обнаружен ID";
			_actionHash = (_actionsArray select 1) select _actionIndex;
			_actionHash set [2,_keybind];
		};
	}
	forEach RRPClientKeybindModified;
}
catch
{
	_exception call RRPClient_util_log;
	_exception call chat;
};
RRPClientKeybindLastSelected = "";
RRPClientKeybindWaitingForKeypress = false;
RRPClientKeybindModifingID = "";
RRPClientKeybindModified = [];
RRPClientKeybindCurrentBinds = [];
true