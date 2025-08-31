
private["_category","_id","_keybinds","_index","_actions","_actionIndex","_i"];
_category = _this select 0;
_id = _this select 1;
try
{
	if (_category isEqualTo "") throw "Category cannot be blank!";
	if (_id isEqualTo "") throw "ID cannot be blank!";
	
	_keybinds = profileNameSpace getVariable ["ExileLifeKeybinds",nil];
	if (isNil "_keybinds") throw "Keybinds registry does not exist!";

	_index = (_keybinds select 0) find _category;
	if !(_index > -1) throw format["Registry for category %1 does not exist!",_category];

	_actions = (_keybinds select 1) select _index;
	if (isNil "_actions") throw format["No keybinds found for category %1",_category];

	_actionIndex = (_actions select 0) find _id;
	if !(_actionIndex > -1) throw format["Action with ID %1 does not exist!",_id];
	for "_i" from 0 to 2 do
	{
		(_actions select _i) deleteAt _actionIndex;
	};
	if (count(_actions) isEqualTo 0) then
	{
		(_keybinds select 0) deleteAt _index;
		(_keybinds select 1) deleteAt _index;
	};
	profileNameSpace setVariable ["ExileLifeKeybinds",_keybinds];
	saveProfileNameSpace;
}
catch
{
	_exception call RRPClient_util_log;
};