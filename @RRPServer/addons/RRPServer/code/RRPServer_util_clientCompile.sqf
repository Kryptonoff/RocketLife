params [["_FuncName","",[""]],["_function",{},[{}]],["_final",true,[true]]];

if (_final) then 
{
	_function = compileFinal ([_function] call RRPAH_util_compilableString);
	missionNamespace setVariable [_FuncName,_function,true]
} else {
	missionNamespace setVariable [_FuncName,_function,true]
};

diag_log format["Compiled Client Function %1",_FuncName];
