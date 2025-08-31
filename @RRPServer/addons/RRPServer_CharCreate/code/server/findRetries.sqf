

recursies = 0;
_findRetrie = {
	_config = getMissionConfig "CfgCharCreate";
	_newName = (selectRandom([getArray(_config >> "defaultNames")] call CBA_fnc_shuffle));
	_surName = (selectRandom([getArray(_config >> "defaultSurNames")] call CBA_fnc_shuffle));
	_res = format["%1 %2",_newName,_surName];
	_q1 = format ["char_findRetrieName:%1",_res] call RRPServer_DB_selectSingleField;
	if !(isNil "_q1") then {
		format ["Called recursies for name %1",_newName] call RRPServer_util_debugConsole;
		recursies = recursies + 1;
		call _findRetrie}else{_res};	
};

_query = "char_findRetriesNames" call RRPServer_DB_selectFull;
{
	_x params ["_uid"];
	_newName = call _findRetrie;
	format ["For player %1 set new name[%2]",_uid,_newName] call RRPServer_util_debugConsole;
	format ["char_setNewName:%1:%2",_newName,_uid] call RRPServer_DB_fireAndForget;
} forEach _query;
format ["Finded %1 retried accs | %2 recursies",count _query,recursies] call RRPServer_util_debugConsole;