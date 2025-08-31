/**
 * File: RRPServer_util_addDate
 * Project: Exile Point
 * Author: Alexis
 * E-Mail: a3atlaslife@gmail.com
   Return: Array
   
   Example:
		["Day",30] call RRPServer_util_addDate;
 */
params ["_mode","_time"];
_date = [];
switch (_mode) do
{
	case "Day":
	{
		_date = parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[%2,0,0,0]",(parseSimpleArray ("extDB3" callExtension "9:LOCAL_TIME") select 1),_time]);
	};
	case "Hours": 
	{
		_date = parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[0,%2,0,0]",(parseSimpleArray ("extDB3" callExtension "9:LOCAL_TIME") select 1),_time]);
	};
	case "Minutes": 
	{
		_date = parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[0,0,%2,0]",(parseSimpleArray ("extDB3" callExtension "9:LOCAL_TIME") select 1),_time]);
	};
	case "Second": 
	{
		_date = parseSimpleArray ("extDB3" callExtension format["9:DATEADD:%1:[0,0,0,%2]",(parseSimpleArray ("extDB3" callExtension "9:LOCAL_TIME") select 1),_time]);
	};
	
	default {_date = [];};
};
_date select 1
