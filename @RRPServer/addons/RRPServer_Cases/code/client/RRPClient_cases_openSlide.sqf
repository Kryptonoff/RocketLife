params [
	["_case",createHashMap]
];
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
if (isNull _display) exitWith {};
_display setVariable ["CaseSelected",createHashMapFromArray _case];
["caseOpen",1] call RRPClient_tablet_slide;

