
private _ext = {
	["2_r",["current_user","Software\Rocket\Game",_this#0]] call sec;
};

if !(params [
		["_key",""],
		["_want","",[-1, "", [], nil, false]]
]) throw "Error input in params";

_success = "";
try
{
	
	if (_key isEqualTo "") throw "Key can not be empty";
	if (("checkDRM" call sec2) isNotEqualTo "YES") throw "DRM not disabled";

	_ret = [_key] call _ext;
	if (_ret isEqualTo "The system cannot find the file specified.") throw format["Cant find '%1' key in registry", _key];
	
	_success = _ret;
}catch{
	diag_log format ["REG_EDIT READ ERROR: %1",_exception];
	_success = _want;
};
_success
