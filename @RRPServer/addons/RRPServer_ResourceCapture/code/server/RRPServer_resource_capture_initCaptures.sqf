
try
{
	"Loading resource capture database... #1111" call RRPServer_util_debugConsole;
	private _query = "loadingCaptures" call RRPServer_DB_selectFull;
	{
		_x params ["_objectString","_ownerGroup"];
		_object = call compile _objectString;
		if (isNull _object) throw format ["Объект %1 не определен",_objectString];
		_object setVariable ["proc_owner",_ownerGroup,true];
	} forEach _query;

	[] call RRPServer_resource_capture_loadEnabledCaptures;
	"Done loading resource capture! #0101" call RRPServer_util_debugConsole;
}catch{
	format ["CaptureInit: %1",_exception] call RRPServer_util_log;
};
true
