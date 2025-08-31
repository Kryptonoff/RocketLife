/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND 

	Usage: 
		[
			"c",
			[_type,_value,_valid,_count]
		] call RRPClient_function_genKhc23bfsd

	_type :SCALAR = 1 -VIP, 2 - MONEY, 3 - RC
	_value :SCALAR
	_valid :SCALAR in days
	_count :SCALAR
*/

params ["_mode","_parameters"];
private _return = "";
switch (_mode) do 
{
	case "c": {
		_return = [7] call RRPClient_util_generateRandomString;
		["v4fgsbesn45",[_return,_parameters]] call RRPClient_system_send;
	};
	case "r": {

	};
};
toString _return