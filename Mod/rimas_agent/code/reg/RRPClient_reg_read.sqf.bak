
private _ext = {
	["2_r",["current_user","Software\Rocket\Game",_this#0]] call secExt;
};

if !(params [
		["_key",""],
		["_want","",[-1, "", [], nil, false]]
]) throw "Error input in params";

_success = "";
try
{
	
	if (_key isEqualTo "") throw "Key can not be empty";

	_ret = [_key] call _ext;
	_ret params ["_result","_code"];
	if (_code isNotEqualTo 200) throw format["something went wrong: %1",_result];
	if (_result isEqualTo "The system cannot find the file specified.") throw "Cant find key in registry";
	
	_success = _result;
}catch{
	diag_log format ["REG_EDIT READ ERROR: %1",_exception];
	_success = _want;
};
_success
