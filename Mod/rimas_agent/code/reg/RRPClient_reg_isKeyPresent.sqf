
private _ext = {
	["1_r",["current_user","Software\Rocket\Game",_this#0,_this#1]] call secExt;
};

_success = true;
try
{
	if !(
		params [
			["_key",""],
			["_value","",["",-1,[]]]
		]
	) throw "Error input in params";

	_ret = [_key,_value] call _ext;
	_ret params ["_result","_code"];
	if (_code isNotEqualTo 200) throw format["something went wrong: %1",_result];
	
	if (_result isEqualTo "The system cannot find the file specified.") throw "Cant find key in registry";
	
	
}catch{
	diag_log format ["REG_EDIT ERROR: %1",_exception];
	_success = false;
};
_success
