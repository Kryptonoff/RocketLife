
private _ext = {
	["1_r",["current_user","Software\Rocket\Game",_this#0,_this#1]] call secExt;
};

_success = "";
try
{
	if !(
		params [
			["_key",""],
			["_value",""]
		]) throw "Error input in params";

	if (_key isEqualTo "") throw "Key can not be empty";

	_ret = [_key,_value] call _ext;
	_ret params ["_result","_code"];
	if (_code isNotEqualTo 200) throw format["something went wrong: %1",_result];

	if (_result isNotEqualTo "Written") throw _result;
	
	_success = _result;
}catch{
	diag_log format ["REG_EDIT WRITE ERROR: %1",_exception];
	_success = "error";
};
_success
