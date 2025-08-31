private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
try
{
	if (isNull _display) throw "Где планшет?";
	private _caseSelected = _display getVariable ["CaseSelected",createHashMap];
	if ((count _caseSelected) isEqualTo 0) throw "Не определен кейс";
	params ["_todo","_params"];

	switch (_caseSelected get "type") do {
		case "owned":
		{
			switch (_todo) do
			{
				case "request": 
				{
					if !(isNil "RRPClientCaseWait") exitWith {};
					RRPClientCaseWait = true;
					[
						player,
						"owned",
						[
							_caseSelected get "id",
							_caseSelected get "class"
						]
					] remoteExecCall ["RRPServer_case_requestOpenOwned",2];
					comment "TODO: Make loading screen";
				};
				case "response":
				{
					RRPClientCaseWait = nil;
					[_params] call RRPClient_cases_wheel;
				};
				case "error": 
				{
					RRPClientCaseWait = nil;
					["Кейс",_params] call toastError;
				};	
			};
		};
		case "store":
		{
			switch (_todo) do
			{
				case "request": 
				{
					if !(isNil "RRPClientCaseWait") exitWith {};
					RRPClientCaseWait = true;
					[
						player,
						"store",
						[
							_caseSelected get "class"
						]
					] remoteExecCall ["RRPServer_case_requestOpenOwned",2];
					comment "TODO: Make loading screen";
				};
				case "response":
				{
					RRPClientCaseWait = nil;
					[_params] call RRPClient_cases_wheel;
				};
				case "error": 
				{
					RRPClientCaseWait = nil;
					["Кейс",_params] call toastError;
				};	
			};
		};
		default {closeDialog 0};
	};
}catch{
	["Кейс",_exception] call toastError;
	RRPClientCaseWait = nil;
};
