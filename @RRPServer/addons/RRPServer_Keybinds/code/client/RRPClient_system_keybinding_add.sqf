private["_category","_id","_displayName","_description","_downCode","_upCode","_default","_temporary","_hash","_keybinds","_categories","_actions","_index","_actionIndex","_info","_downHashArray","_upHashArray"];

params ["_category","_id","_displayName","_description","_onDownCode","_onUpCode",["_default",[-1,[false,false,false]]],["_temporary",false] ];

_hash = false;
try
{
	if (_category isEqualTo "") throw "Категория не может быть пустой";
	if (_id isEqualTo "") throw "ID не может быть пустым";
	_keybinds = profileNameSpace getVariable ["ExileLifeKeybinds",nil];
	if (isNil "_keybinds") then
	{
		_keybinds = [[],[]];
		profileNameSpace setVariable ["ExileLifeKeybinds",_keybinds];
	};
	_categories = _keybinds select 0;
	_actions = _keybinds select 1;
	_index = _categories find _category;
	if (_index isEqualTo -1) then
	{
		_index = _categories pushBack _category;
		_actions pushBack [[],[]];
	};
	_actions = _actions select _index;
	_actionIndex = (_actions select 0) find _id;
	if !(_actionIndex > -1) then
	{
		(_actions select 0) pushback _id;
		(_actions select 1) pushBack [_displayName,_description,_default];
	}
	else
	{
		_info = ((_actions select 1) select _actionIndex);
		if !((_info select 0) isEqualTo _displayName) then
		{
			_info set [0, _displayName];
		};
		if !((_info select 1) isEqualTo _description) then
		{
			_info set [1, _description];
		};
		_default = _info select 2;
	};
	_hash = format["%1_%2",_category,_id];
	if (_upCode isEqualTo {} && {_downCode isEqualTo {}}) throw format["Keybind %1 (%2) needs to have code assigned to it!",_category,_id];

	if !(_downCode isEqualTo {}) then
	{
		_downHashArray = [_downCode,_default];
		RRPClientKeybindsDown setVariable [_hash,_downHashArray];
		RRPClientActiveKeyDown pushbackUnique _hash;
	};
	if !(_upCode isEqualTo {}) then
	{
		_upHashArray = [_upCode,_default];
		RRPClientKeybindsUp setVariable [_hash,_upHashArray];
		RRPClientActiveKeyUp pushbackUnique _hash;
	};
	(RRPClientKeybindActiveBinds select 0) pushbackUnique _category;
	(RRPClientKeybindActiveBinds select 1) pushbackUnique _id;
	if !(_temporary) then
	{
		profileNameSpace setVariable ["ExileLifeKeybinds",_keybinds];
		saveProfileNameSpace;
	};
}
catch
{
	_exception call chat;
	_hash = false;
};
_hash
