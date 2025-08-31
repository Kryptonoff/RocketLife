/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private ["_mode","_display","_picture","_control","_lb","_index","_color","_marker"];
_mode = param [0,"",[""]];
_display = findDisplay 12;
switch _mode do 
{
	case "color": 
	{
		_control = _this select 1;
		_lb = _control select 0;
		_index = _control select 1;  
		_color = parseSimpleArray(_lb lbData _index);
		profileNamespace setVariable ["PRNS_WaypointColor",_color];
	};
	case "marker": 
	{
		_control = _this select 1;
		_lb = _control select 0;
		_index = _control select 1;  
		_marker = _lb lbData _index;
		profileNamespace setVariable ["PRNS_WaypointPic",_marker];
	};
	case "size":
	{
		_control = _this select 1;
		_position = _control select 1;
		profileNamespace setVariable ["PRNS_WaypointSize",_position];
	};
	default {};
};
true
