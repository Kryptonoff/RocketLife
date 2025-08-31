private _config = getMissionConfig "CfgActions";

_getData = {
	_config = _this;
	_ret = [
		getText(_config >> "object"),
		configName _x,
		getText(_config >> "displayName"),
		getText(_config >> "icon"),
		getText(_config >> "selection"),
		getNumber(_config >> "distance"),
		compile getText(_config >> "action"),
		compile getText(_config >> "conditions"),
		getText(_config >> "position")
	];
	_ret
};
_createAction = {

	_actions = _this;
	
		
	{
		(_x select 0) params ["_object","_nameAction","_displayName","_icon","_selections","_distance","_statement","_conditions","_position","_parents"];
		systemChat _object;
		systemChat str _parents;
		["Action",_x] call RRPClient_util_logArray;
		_a = [
			_nameAction,
			_displayName,
			_statement,
			_conditions,
			{},
			nil,
			_position,
			_distance
		] call ace_interact_menu_fnc_createAction;
		[
			_object,
			0,
			_parents,
			_a
		] call ace_interact_menu_fnc_addActionToClass;
	} forEach _actions;
};

_recurse = {
	params [["_action",[]],["_config",missionConfigFile],"_parentObject",["_parents",[]],"_newParent"];
	_parents = _parents + [_newParent];
	{
		_data = (_x call _getData) + [_parents];
		_data set [0,_parentObject];
		_action pushBack _data;
		if (isClass (_config >> "SubActions")) then 
		{
			[_action,(_config >> "SubActions"),_parentObject,_parents,configName _x] call _recurse;
		};
	} forEach ("true" configClasses _config);
};

private _actions = [];
{
	_parent = ["ACE_MainActions"];
	private _action = [];
	_data = (_x call _getData) + [_parent];
	_action pushBack _data;
	if (isClass (_config >> "SubActions")) then 
	{
		[_action,(_config >> "SubActions"),_data#0,_parent, configName _x] call _recurse;
	};
	_actions pushBack _action;
} forEach ("true" configClasses _config);

_actions call _createAction;
